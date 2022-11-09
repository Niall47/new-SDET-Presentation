require 'yaml'

class College
  attr_reader :students

  @@filename = 'lib/student_records.yaml'

  def initialize(filename)
    raise 'File not found' unless File.exists? filename

    @filename = filename
    @students = load_from_file
  end

  def add(student)
    raise 'This student already exits' if get_index(student.id)

    @students.push(student)
  end

  def get_students_on_course(course)
    @students.map { |student| student if student.courses.include? course}
  end

  def remove(id)
    student_index = get_index(id)
    @students.delete_at student_index if student_index
  end

  def load_from_file
    YAML.load_file(@filename, permitted_classes: [Student])
  end

  def save_to_file
    File.write(@filename, @students.to_yaml)
  end

  private

  def get_index(id)
    @students.find_index { |student| student.id == id }
  end
end
