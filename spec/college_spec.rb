require 'college'
require 'student'

describe College do
  describe 'initialize' do
    it 'throws an error if invalid filename is provided' do
      expect { College.new'does_not_exist.yaml' }.to raise_error RuntimeError
    end
  end
  describe 'add' do
    it 'should return an error if a duplicate ID is registered' do
      college = College.new 'lib/student_records.yaml'
      student = Student.new({id: 'ABC1234', first_name: 'testy', last_name: 'mcTesterson', courses: ['CSC', 'CSC', 'PHY', 'BIO']})
      college.add student
      student = Student.new({id: 'BCA1234', first_name: 'testy', last_name: 'mcTesterson', courses: ['CSC', 'CSC', 'PHY', 'BIO']})
      expect { college.add(student) }.to raise_error RuntimeError
    end
  end
  describe 'get_students_on_course' do
    it 'should return the correct number of students on a course' do
      student1 = Student.new({id: 'ABC1234', first_name: 'testy', last_name: 'mcTesterson', courses: ['MUS', 'CSC', 'PHY', 'BIO']})

      student2 = Student.new({id: 'ABC1235', first_name: 'testy', last_name: 'mcTesterson', courses: ['MUS']})
      student3 = Student.new({id: 'ABC1235', first_name: 'testy', last_name: 'mcTesterson', courses: ['MUS','BIO']})
      college.add student1
      college.add student2
      college.add student3

    end

  end
end





