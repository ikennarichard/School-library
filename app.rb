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

  def list_all_people
    puts '#=> No person added yet' if books.length == 0
    
    people.each do |person| puts "#=> [#{person.class}] ID: #{person.id} Name: #{person.name} Age: #{person.age}"
    end
    puts people.length
  end

  def create_person
    puts 'Wha kind of person you want to create?'
    puts '(1) Student'
    puts '(2) Teacher'
    print 'Input number : '
    
    person_type = Integer(gets.chomp)
  
    case person_type
    when 1
      print 'Age: '
      age = Integer(gets.chomp)
      print 'Name: '
      name = gets.chomp
      print 'Parent permission? [y/n]: '
      parent_permission = gets.chomp.downcase
  
      case parent_permission
      when 'n'
        people << Student.new(nil, age, name, false)
      when 'y'
        people << Student.new(nil, age, name)
      else
        'Invalid option, please try again'
      end
  
      puts ''
      puts '#=> Student created successfully'
  
    when 2
      print "Teacher's specialization: "
      specialization = gets.chomp
      print "Age: "
      age = gets.chomp
      print "Name: "
      name = gets.chomp
      teacher = Teacher.new(specialization, name, age)
      people << teacher
      puts ''
      puts '#=> Teacher created successfully'
    end
  end
  
end