require_relative '../classroom'

RSpec.describe Classroom do
  let(:classroom) { Classroom.new('Art') }

  describe '#initialize' do
    it 'should create a new Classroom instance' do
      expect(classroom).to be_a(Classroom)
    end

    it 'should set the attribute' do
      expect(classroom.label).to eq('Art')
    end
  end

  describe '#add_student' do
    it 'should add a student to the students array' do
      student1 = double('Mikaila')
      classroom.add_student(student1)
      expect(classroom.students).to include(student1)
    end
  end
end
