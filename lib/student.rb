# frozen_string_literal: true

require_relative 'college'

class Student
  attr_accessor :id, :first_name, :last_name, :course

  def initialize(student_hash)
    raise 'Invalid ID' unless valid_id? student_hash[:id]
    raise 'Invalid first name' unless name_valid? student_hash[:first_name]
    raise 'Invalid last name' unless name_valid? student_hash[:last_name]
    raise 'Invalid course' unless course_valid? student_hash[:course]

    @id = student_hash[:id]
    @first_name = student_hash[:first_name]
    @last_name = student_hash[:last_name]
    @course = student_hash[:course]
  end

  private

  def valid_id?(id)
    # 3 uppercase characters excluding 'I' & 'O'
    # followed by 4 numeric characters
    id.match?(/^(?![IO])[A-Z]{3}\d{4}$/)
  end

  def name_valid?(name)
    return unless name.instance_of? String
    return unless name&.chars&.count&.<= 30

    true
  end

  def course_valid?(course)
    course.match?(/^[A-Z]{3}$/)
  end
end
