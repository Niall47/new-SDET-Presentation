require 'student'

describe Student do
  describe 'initialize' do
    it 'throws an error if provided ID is malformed' do
      student_hash = { id: '1ES7123', first_name: 'Jim', last_name: 'Jimmyson', courses: ['CSC', 'CSC', 'PHY', 'BIO'] }
      expect { Student.new(student_hash) }.to raise_error RuntimeError
    end
    it 'throws an error if provided first name is malformed' do
      student_hash = { id: 'ABC1234', first_name: '!@£$%&*()', last_name: 'Jimmyson', courses: ['CSC', 'CSC', 'PHY', 'BIO'] }
      expect { Student.new(student_hash) }.to raise_error RuntimeError
    end
    it 'throws an error if provided last name is malformed' do
      student_hash = { id: 'ABC1234', first_name: 'Jim', last_name: ')(*&^%$£@!', courses: ['CSC', 'CSC', 'PHY', 'BIO'] }
      expect { Student.new(student_hash) }.to raise_error RuntimeError
    end
    it 'throws an error if provided courses are malformed' do
      student_hash = { id: 'ABC1234', first_name: 'Jim', last_name: 'Jimmyson', courses: ['Biology', 'Physics'] }
      expect { Student.new(student_hash) }.to raise_error RuntimeError
    end
  end
end
