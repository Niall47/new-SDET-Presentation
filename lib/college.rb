# frozen_string_literal: true

require 'yaml'
require_relative 'student'

# holds a list of students that can be saved and loaded from file
class College
  attr_reader :students

  def initialize(student_record_filename, courses_filename)
    raise 'Student records file not found' unless File.exist? student_record_filename
    raise 'Course information file not found' unless File.exist? courses_filename

    @courses_filename = courses_filename
    @student_record_filename = student_record_filename
    @courses = load_courses
    @students = load_student_records
  end

  def enroll(student)
    raise 'This student ID already exits' if get_index(student.id)

    @students.push(student)
  end

  def bulk_enroll(filename)
    raise 'File not found' unless File.exist? filename

    records_to_import = YAML.load_file(filename)
    records_to_import.each do |student_data|
      enroll(Student.new(student_data))
    rescue RuntimeError => e
      puts "#{e} : #{student_data}"
    end
  end

  def get_students_on_course(course)
    @students.map { |student| student if student.course == course }.count
  end

  def print_report
    course_attendees = @students.group_by(&:course)
    course_attendees.each_key { |course| puts "#{course} : #{course_attendees[course].count}" }
  end

  def load_student_records
    file = YAML.load_file(@student_record_filename, permitted_classes: [Student])
    file || []
  end

  def load_courses
    file = YAML.load_file(@courses_filename)
    raise "Error parsing #{@courses_filename}" unless file.instance_of? Hash

    file
  end

  def save_to_file
    File.write(@student_record_filename, @students.to_yaml)
  end

  private

  def get_index(id)
    @students.find_index { |student| student.id == id } unless @students.empty?
  end
end
