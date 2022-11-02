require 'json'
require 'pry'

class College
    attr_accessor :students

    def initialize
        @students = load
    end

    def add(student)
        raise 'This student already exits' if get_index(student.id)
        
        @students.push(
            {:id => student.id,
            :first_name => student.first_name,
            :last_name => student.last_name,
            :courses => student.courses})
    end
    
    def get_index(id)
        @students.find_index { |student| student['id'] == id}
    end

    def remove(id)
        student_index = get_index(id)
        @students.delete_at student_index if student_index
    end

    def load
        JSON.parse(File.read('students.json'))
    end

    def save
        File.open('students.json', 'w') do |file|
            file.puts(students.to_json)
        end
    end
end


class Student
    attr_accessor :id, :first_name, :last_name, :courses

    def initialize(id, first_name, last_name, courses)
        
        raise 'Invalid ID' unless valid_id? id
        raise 'Invalid first name' unless first_name_valid? first_name
        raise 'Invalid last name' unless last_name_valid? last_name
        raise 'Courses were invalid format' unless courses_valid? courses

        @id = id
        @first_name = first_name
        @last_name = last_name
        @courses = courses
        
    end
    
    private

    def valid_id?(id)
        # 3 uppercase characters excluding 'I' & 'O'
        # followed by 4 numeric characters
        id.match? /(?![IO])[A-Z]{3}[\d]{4}/
    end

    def first_name_valid?(*args)
        true
    end

    def last_name_valid?(*args)
        true
    end

    def courses_valid?(courses)
        courses.instance_of?(Array) && courses.join.scan(/^[A-Z]{3}$/)
    end

end


college = College.new
# student = Student.new('ABC1234', 'testy', 'mcTesterson', ['MTH', 'CSC', 'PHY', 'BIO', 'CHE'])
# college.remove(student.id)
binding.pry
