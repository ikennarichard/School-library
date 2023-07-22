module List
  def retrieve_data
    books_path = './json/books.json'
    people_path = './json/person.json'
    rentals_path = './json/rentals.json'
    @books = File.empty?(books_path) ? [] : JSON.parse(File.read(books_path))
    @rentals = File.empty?(rentals_path) ? [] : JSON.parse(File.read(rentals_path))
    @people = File.empty?(people_path) ? [] : JSON.parse(File.read(people_path))
  end

  def list_all_books
    puts '#=> No books added yet' if books.empty?
    books.each do |book|
      puts "Title: #{book['title']}, Author: #{book['author']}"
    end
  end

  def list_all_people
    puts '#=> No person added yet' if people.empty?

    people.each do |person|
      puts "Person-ID: #{person['id']}, Name: #{person['name']}"
    end
  end

  def list_rentals
    print '#=> Enter the Person ID: '
    id = gets.chomp.to_i

    rentals = JSON.parse(File.read('json/person.json')).find { |person| person['id'] == id }['rentals']
    if rentals.empty?
      puts "Person with ID #{id} has no rentals yet"
    else
      rentals.each { |rental| puts "Date: #{rental['date']}, Book: \"#{rental['title']}\" Author: #{rental['author']}" }
    end
  end
end
