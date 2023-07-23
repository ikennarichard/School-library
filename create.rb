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
    p student
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

    puts '#=> Select a book from the following list by number'

    books.each.with_index(1) { |book, index| puts "#{index}) Title: #{book['title']}, Author: #{book['author']}" }
    print '#=> Choose a book: '
    selected_book = Integer(gets.chomp) - 1
    rental_book = Book.new(books[selected_book]['title'], books[selected_book]['author'])

    puts '#=> Select a person from the following list by number (not id)'

    people.each.with_index(1) do |person, index|
      puts "#{index}) PersonID: #{person['id']} Name: #{person['name']}"
    end
    print '#=> Choose a person: '
    selected_person = Integer(gets.chomp) - 1
    renter = Person.new(people[selected_person]['age'], people[selected_person]['name'],
                        people[selected_person]['parent_permission'])
    renter.id = people[selected_person]['id']

    print 'Date (dd/mm/yy): '
    selected_date = gets.chomp.to_s

    rental = Rental.new(selected_date, rental_book, renter)

    rentals << { 'date' => rental.date, 'book' => rental.book.title, 'person' => rental.person.name }

    people.each do |item|
      item['id'] == rental.person.id && (item['rentals'] << { 'date' => rental.date, 'title' => rental.book.title,
                                                              'author' => rental.book.author })
    end

    File.write('json/rentals.json', JSON.generate(rentals))
    File.write('json/person.json', JSON.generate(people))

    puts ''
    print '#=>  Rental created successfully.'
    puts ''
  end
end
