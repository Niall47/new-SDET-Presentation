class Student
  attr_accessor :id, :first_name, :last_name, :courses

  def initialize(student_hash)
    raise 'Invalid ID' unless valid_id? student_hash[:id]
    raise 'Invalid first name' unless first_name_valid? student_hash[:first_name]
    raise 'Invalid last name' unless last_name_valid? student_hash[:last_name]
    raise 'Courses were invalid format' unless courses_valid? student_hash[:courses]

    @id = student_hash[:id]
    @first_name = student_hash[:first_name]
    @last_name = student_hash[:last_name]
    @courses = student_hash[:courses]
  end

  private

  def valid_id?(id)
    # 3 uppercase characters excluding 'I' & 'O'
    # followed by 4 numeric characters
    id.match?(/(?![IO])[A-Z]{3}\d{4}/)
  end

  def first_name_valid?(*_args)
    true
  end

  def last_name_valid?(*_args)
    true
  end

  def courses_valid?(courses)
    courses.instance_of?(Array) && courses.join.scan(/^[A-Z]{3}$/)
  end
end