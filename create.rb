module Create
  def create_teacher
    print "Teacher's specialization: "
    specialization = gets.chomp
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    teacher = Teacher.new(specialization, name, age)

    people << { 'id' => teacher.id, 'name' => teacher.name, 'age' => teacher.age,
                'specialization' => teacher.specialization, 'rentals' => teacher.rentals }

    File.write('json/person.json', JSON.generate(people))

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
    student = nil

    case parent_permission
    when 'n'
      student = Student.new(nil, age, name, false)
    when 'y'
      student = Student.new(nil, age, name, true)
    else
      '#=> Invalid option, please try again'
    end
    people << { 'id' => student.id, 'name' => student.name, 'age' => student.age,
                'parent_permission' => student.parent_permission, 'rentals' => student.rentals }

    File.write('json/person.json', JSON.generate(people))
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
    books << { 'title' => book.title, 'author' => book.author }
    File.write('json/books.json', JSON.generate(books))
    puts ''
    puts '#=>  Book created successfully'
  end

  def create_rental
    return if books.empty? || people.empty?

    selected_book = select_book
    return unless selected_book

    selected_person = select_person
    return unless selected_person

    selected_date = input_date
    return unless selected_date

    rental = create_new_rental(selected_book, selected_person, selected_date)

    update_rental_records(rental)

    puts "\n#=> Rental created successfully.\n\n"
  end

  def select_book
    puts "\n#=> Select a book from the following list by number\n"

    books.each.with_index(1) do |book, index|
      puts "#{index}) Title: #{book['title']}, Author: #{book['author']}"
    end

    print '#=> Choose a book: '
    selected_book = Integer(gets.chomp) - 1

    return books[selected_book] if selected_book.between?(0, books.length - 1)

    puts "\nInvalid choice. Please select a valid book.\n"
    nil
  end

  def select_person
    puts "\n#=> Select a person from the following list by number (not id)\n"

    people.each.with_index(1) do |person, index|
      puts "#{index}) PersonID: #{person['id']} Name: #{person['name']}"
    end
    print '#=> Choose a person: '
    selected_person = Integer(gets.chomp) - 1

    return people[selected_person] if selected_person.between?(0, people.length - 1)

    puts "\nInvalid choice. Please select a valid person.\n"
    nil
  end

  def input_date
    print 'Date (dd/mm/yy): '
    gets.chomp.to_s
  end

  def create_new_rental(selected_book, selected_person, selected_date)
    rental_book = Book.new(selected_book['title'], selected_book['author'])
    renter = Person.new(selected_person['age'], selected_person['name'], selected_person['parent_permission'])
    renter.id = selected_person['id']

    Rental.new(selected_date, rental_book, renter)
  end

  def update_rental_records(rental)
    rentals << { 'date' => rental.date, 'book' => rental.book.title, 'person' => rental.person.name }

    people.each do |item|
      item['id'] == rental.person.id && (item['rentals'] << { 'date' => rental.date, 'title' => rental.book.title,
                                                              'author' => rental.book.author })
    end

    File.write('json/rentals.json', JSON.generate(rentals))
    File.write('json/person.json', JSON.generate(people))
  end
end
