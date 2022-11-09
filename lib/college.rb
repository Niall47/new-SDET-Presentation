require 'yaml'

class College
  attr_reader :students

  def initialize(filename)
    raise 'File not found' unless File.exists? filename

    @filename = filename
    @students = load_from_file
  end

  def add(student)
    raise 'This student ID already exits' if get_index(student.id)

    @students.push(student)
  end

  def get_students_on_course(course)
    @students.map { |student| student if student.course == course}
  end

  def remove(id)
    student_index = get_index(id)
    @students.delete_at student_index if student_index
  end

  def load_from_file
    # TODO load or return []
    file = YAML.load_file(@filename, permitted_classes: [Student])
    if file
      file    
   else
    []
   end
  end

  def save_to_file
    File.write(@filename, @students.to_yaml)
  end

  private

  def get_index(id)
    @students.find_index { |student| student.id == id } unless @students.empty?
  end
end
