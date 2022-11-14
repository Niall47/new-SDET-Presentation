# frozen_string_literal: true

require 'student'

describe Student do
  describe 'initialize' do
    it 'should allow a valid student' do
      student_hash = { id: 'WWW2345', first_name: 'Jim', last_name: 'Jimmyson', course: 'CSC' }
      expect { Student.new(student_hash) }.to_not raise_error
    end
    it 'throws an error if provided ID is malformed' do
      student_hash = { id: '1ES7123', first_name: 'Jim', last_name: 'Jimmyson', course: 'CSC' }
      expect { Student.new(student_hash) }.to raise_error RuntimeError
    end
    it 'throws an error if provided first name is malformed' do
      student_hash = { id: 'ABC1234', first_name: { name: 'Jimmy' }, last_name: 'Jimmyson', course: 'BIO' }
      expect { Student.new(student_hash) }.to raise_error RuntimeError
    end
    it 'throws an error if provided last name is malformed' do
      student_hash = { id: 'ABC1234', first_name: 'Jim', last_name: { name: 'Jimmyson' }, course: 'CSC' }
      expect { Student.new(student_hash) }.to raise_error RuntimeError
    end
    it 'throws an error if provided course is malformed' do
      student_hash = { id: 'ABC1234', first_name: 'Jim', last_name: 'Jimmyson', course: 'Physics' }
      expect { Student.new(student_hash) }.to raise_error RuntimeError
    end
  end
end
