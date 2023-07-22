module Select
  def options
    puts ''
    puts 'Welcome to School Library App!'
    puts ''

    puts '1 - List all books',
         '2 - List all people',
         '3 - Create a person',
         '4 - Create a book',
         '5 - Create a rental',
         '6 - List all of rentals for a given person id',
         '7 - Exit'
    puts ''
    puts 'Please choose an option by entering a number: '
    puts ''
    print '#=> '
  end

  def select_option(app, num)
    actions = {
      '1' => :list_all_books,
      '2' => :list_all_people,
      '3' => :create_person,
      '4' => :create_book,
      '5' => :create_rental,
      '6' => :list_rentals,
      '7' => :exit_app
    }

    action = actions[num]

    if action
      app.send(action)
    else
      puts "\n#=> Invalid input Error\n"
    end
  end

  def exit_app
    puts "\nThanks for using the app. Goodbye\n"
  end
end
