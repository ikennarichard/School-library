require_relative '../teacher'

RSpec.describe Teacher do
  let(:teacher) { Teacher.new('Science', 31, 'Deadpool') }

  describe '#initialize' do
    it 'should create a new Teacher instance' do
      expect(teacher).to be_a(Teacher)
    end

    it 'should set the attributes' do
      expect(teacher.specialization).to eq('Science')
      expect(teacher.age).to eq(31)
      expect(teacher.name).to eq('Deadpool')
    end

    it 'should generate a random ID between 1 and 100' do
      expect(1...100).to include(teacher.id)
    end
  end

  describe '#can_use_services?' do
    it 'should return true for teachers' do
      expect(teacher.can_use_services?).to be(true)
    end
  end
end
