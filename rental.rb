require_relative 'person'
class Rental
  attr_accessor :date, :book, :person, :rentals

  def initialize(date, book, person)
    @date = date

    @person = person
    person.rentals << self

    @book = book
    book.rentals << self
  end
end
