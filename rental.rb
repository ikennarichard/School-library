class Rental
  attr_accessor :date, :book, :person

  def initialiize(date)
    @date = date

    @person = person
    person.rentals << self

    @book = book
    book.rentals << self
  end
end
