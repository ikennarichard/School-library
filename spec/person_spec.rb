require_relative '../person'

RSpec.describe Person do
  let(:person) { Person.new(51, 'Ikenna', true) }

  describe '#initialize' do
    it 'should create a new Person instance' do
      expect(person).to be_a(Person)
    end

    it 'should set the attributes' do
      expect(person.name).to eq('Ikenna')
      expect(person.age).to eq(51)
      expect(person.parent_permission).to be(true)
    end

    it 'should generate a random ID between 1 and 100' do
      expect(1...100).to include(person.id)
    end
  end

  describe '#can_use_services?' do
    it 'should return true if person is above 18' do
      person = Person.new(33, 'Meg', false)
      expect(person.can_use_services?).to be(true)
    end

    it 'should return true if the person has parent permission' do
      person = Person.new(15, 'Meg', true)
      expect(person.can_use_services?).to be(true)
    end

    it 'returns false if the person is underage and has no parent permission' do
      person = Person.new(12, 'Meg', false)
      expect(person.can_use_services?).to be(false)
    end
  end

  describe '#correct_name' do
    it 'should return the correct name' do
      expect(person.correct_name).to eq('Ikenna')
    end
  end

  describe '#add_rental' do
    it 'should add a rental to the rentals array' do
      rental = double('Rental')
      person.add_rental(rental)
      expect(person.rentals).to include(rental)
    end
  end

  describe '#of_age?' do
    it 'should return true if the person is 18 years old or older' do
      expect(person.send(:of_age?)).to be(true)
    end

    it 'should return false if the person is younger than 18 years old' do
      person = Person.new(17, 'Meg', true)
      expect(person.send(:of_age?)).to be(false)
    end
  end
end
