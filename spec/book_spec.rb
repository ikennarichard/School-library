require_relative '../book'

RSpec.describe Book do
  let(:book) { Book.new('Dune', 'Frank Herbert') }

  describe '#initialize' do
    it 'should create a new Book instance' do
      expect(book).to be_a(Book)
    end

    it 'should set the attributes' do
      expect(book.title).to eq('Dune')
      expect(book.author).to eq('Frank Herbert')
    end
  end

  describe '#add_rental' do
    it 'should add a rental to the rentals array' do
      rental = double('Book-1')
      book.add_rental(rental)
      expect(book.rentals).to include(rental)
    end
  end
end
