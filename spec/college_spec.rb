require 'college'
require 'student'

describe College do
  describe 'initialize' do
    it 'throws an error if invalid student record filename is provided' do
      expect { College.new 'does_not_exist.yaml', 'courses.yaml' }.to raise_error RuntimeError
    end

    it 'throws an error if invalid student record filename is provided' do
      expect { College.new 'student_recoreds.yaml', 'does_not_exist.yaml' }.to raise_error RuntimeError
    end
  end
  describe 'add' do
    it 'should return an error if a duplicate ID is registered' do
      college = College.new 'lib/student_records.yaml', 'lib/courses.yaml'
      student = Student.new({id: 'ABC1234', first_name: 'test', last_name: 'User', course: 'BIO'})
      college.enroll student
      student = Student.new({id: 'ABC1234', first_name: 'test', last_name: 'User', course: 'PHY'})
      expect { college.enroll(student) }.to raise_error RuntimeError
    end
  end
  describe 'get_students_on_course' do
    it 'should return the correct number of students on a course' do
        pending
    end
  end
end
