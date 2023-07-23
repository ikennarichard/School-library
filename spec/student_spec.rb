require_relative '../student'
require_relative '../classroom'

RSpec.describe Student do
  let(:student) { Student.new('Science', 11, 'Emeka', false) }
  let(:classroom) { Classroom.new('Science-A') }

  describe '#initialize' do
    it 'should create a new Student instance' do
      expect(student).to be_a(Student)
    end

    it 'should set the attributes' do
      expect(student.classroom).to eq('Science')
      expect(student.age).to eq(11)
      expect(student.name).to eq('Emeka')
      expect(student.parent_permission).to eq(false)
    end

    it 'should generate a random ID between 1 and 100' do
      expect(1...100).to include(student.id)
    end
  end

  describe '#classroom=' do
    it 'should set the classroom attribute' do
      student.classroom = classroom
      expect(student.instance_variable_get(:@classroom)).to eq(classroom)
    end

    it 'should add student to classroom' do
      student.classroom = (classroom)
      expect(classroom.students).to include(student)
    end

    it 'should not add student twice' do
      classroom.students << student
      expect { student.classroom = classroom }.not_to(change { classroom.students.size })
    end
  end
end
