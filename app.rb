require_relative './book'
require_relative './classroom'
require_relative './person'
require_relative './rental'
require_relative './student'
require_relative './teacher'

class App
  attr_accessor :people, :books, :rentals

  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def list_all_books
    puts '#=> No books added yet' if books.empty?
    books.each do |book|
      puts "#=> Title: #{book.title} Author: #{book.author}"
    end
    puts people.length
  end

  def list_all_people
    puts '#=> No person added yet' if books.empty?

    people.each do |person|
      puts "#=> [#{person.class}] ID: #{person.id} Name: #{person.name} Age: #{person.age}"
    end
    puts people.length
  end

  def create_teacher
    print "Teacher's specialization: "
    specialization = gets.chomp
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    teacher = Teacher.new(specialization, name, age)
    people << teacher
    puts ''
    puts '#=> Teacher created successfully'
  end

  def create_student
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
      '#=> Invalid option, please try again'
    end

    puts ''
    puts '#=> Student created successfully'
  end

  def create_person
    puts 'What kind of person do you want to create?'
    puts '1 - Student'
    puts '2 - Teacher'
    print 'Input number : '

    person_type = Integer(gets.chomp)

    case person_type
    when 1
      create_student
    when 2
      create_teacher
    end
  end

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    book = Book.new(title, author)
    books << book
    puts ''
    puts '#=>  Book created successfully'
  end

  def create_rental
    return if books.empty? || people.empty?

    puts '#=> Select a book from the following list by number'

    books.each.with_index(1) { |book, index| puts "#{index}) Title: #{book.title}, Author: #{book.author}" }
    print '#=> Choose a book: '
    selected_book = Integer(gets.chomp) - 1

    puts '#=> Select a person from the following list by number (no id)'

    people.each.with_index(1) do |person, index|
      puts "#{index}) Name: #{person.name} Age: #{person.age} Id: #{person.id}"
    end
    print '#=> Choose a person: '
    selected_person = Integer(gets.chomp) - 1

    print 'Date: '
    selected_date = gets.chomp.to_s

    rentals << Rental.new(selected_date, books[selected_book], people[selected_person])

    puts ''
    print '#=>  Rental created successfully.'
  end

  def list_rentals
    print '#=> Enter the Person ID: '
    id = gets.chomp.to_i

    rentals.each do |rental|
      if rental.person.id == id
        puts "#=>  Date: #{rental.date}, Book: #{rental.book.title} Author: #{rental.book.author}"
      else
        puts '#=> Invalid id, please try again'
      end
    end
  end
end
