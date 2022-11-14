# frozen_string_literal: true

require 'college'
require 'student'

describe College do
  describe 'initialize' do
    it 'throws an error if invalid student record filename is provided' do
      expect { College.new 'does_not_exist.yaml', 'courses.yaml' }.to raise_error RuntimeError
    end
    it 'throws an error if invalid student record filename is provided' do
      expect { College.new 'student_records.yaml', 'does_not_exist.yaml' }.to raise_error RuntimeError
    end
  end
  describe 'enroll' do
    it 'should let a valid student be enrolled' do
      college = College.new 'lib/student_records.yaml', 'lib/courses.yaml'
      student = Student.new({ id: 'JNV9845', first_name: 'test', last_name: 'User', course: 'BIO' })
      expect { college.enroll(student) }.to_not raise_error
    end
    it 'should return an error if a duplicate ID is registered' do
      college = College.new 'lib/student_records.yaml', 'lib/courses.yaml'
      student = Student.new({ id: 'ABC1234', first_name: 'test', last_name: 'User', course: 'BIO' })
      college.enroll student
      student = Student.new({ id: 'ABC1234', first_name: 'test', last_name: 'User', course: 'PHY' })
      expect { college.enroll(student) }.to raise_error RuntimeError
    end
  end
end
