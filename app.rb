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


  
end