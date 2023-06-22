class Rental
  attr_accessor :date, :book, :person

  def initialize(date=nil,book, person)
    @date = date

    @person = person
    person.rentals << self

    @book = book
    book.rentals << self
  end
end
