require_relative './book.rb'
require_relative './classroom.rb'
require_relative './person.rb'
require_relative './rental.rb'
require_relative './student.rb'
require_relative './teacher.rb'

class App
  attr_accessor :people, :books, :rentals

  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def list_all_books
    puts '#=> No books added yet' if books.length == 0
    books.each do |book|
      puts "#=> Title: #{book.title} Author: #{book.author}"
    end
    puts people.length
  end
  
end