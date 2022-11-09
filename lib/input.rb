require 'pry'
require 'yaml'
require_relative 'student'
require_relative 'college'

college = College.new('lib/student_records.yaml')
# student = Student.new('ABC1234', 'testy', 'mcTesterson', ['MTH', 'CSC', 'PHY', 'BIO', 'CHE'])
# student = Student.new('BCA1234', 'testy', 'mcTesterson', ['CSC', 'CSC', 'PHY', 'BIO'])
# student = Student.new({id: 'BCA1234', first_name: 'testy', last_name: 'mcTesterson', courses: ['CSC', 'CSC', 'PHY', 'BIO']})
# college.remove(student.id)
binding.pry
