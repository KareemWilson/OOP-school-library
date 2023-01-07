require_relative 'student'
require_relative 'teacher'
require_relative 'book'
require_relative 'rental'

class App
  def initialize()
    @students = []
    @teachers = []
    @people = []
    @books = []
    @rentals = []
  end

  def options
    puts "\n\nPlease choose an option by entering a number"
    puts '1 - List all Books'
    puts '2 - List all People'
    puts '3 - Create a Person'
    puts '4 - Create a Book'
    puts '5 - Create a Rental'
    puts '6 - List all Rentals for a given person id'
    puts '7 - Exit'
    option = gets.chomp.to_i
    move_to_primary(option)
  end

  def switch_person
    print "\nDo you want to create  a Student (1) or a Teacher (2)? [Input the number]: "
    secondary_option = gets.chomp.to_i
    case secondary_option
    when 1
      create_student
    when 2
      create_teacher
    end
  end

  def move_to_primary(option)
    case option
    when 1
      list_all_books
    when 2
      list_all_people
    when 3
      switch_person
    when 4
      create_book
    when 5
      create_rental
    when 6
      list_all_rentals
    when 7
      puts "\nI hope you enjoyed this simple application, Bye bye!"
      exit
    end
  end

  def list_all_books
    @books.map { |book| puts "Title: #{book.title}, Author: #{book.author}" }
    options
  end

  def list_all_people
    @people.each do |person|
      if person.instance_of?(Student)
        puts "[Student]: Name: #{person.name}, Id: #{person.id}, Age: #{person.age}"
      else
        puts "[Teacher]: Name: #{person.name}, Id: #{person.id}, Age: #{person.age}"
      end
    end
    options
  end

  def create_student
    print 'age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Has parent permission? [Y/N]'
    parent_permission = gets.chomp
    parent_permission = true if (parent_permission = 'Y' || 'y' || 'yes')
    @people << Student.new(name, age, parent_permission)
    puts "\nStudent added successfully"
    options
  end

  def create_teacher
    print 'Name: '
    name = gets.chomp
    print 'age: '
    age = gets.chomp.to_i
    print 'specialization: '
    spec = gets.chomp
    @people << Teacher.new(name, age, spec)
    puts "\nTeacher added successfully"
    options
  end

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    @books << Book.new(title, author)
    puts "\nA New Book has been created successfully"
    options
  end

  def create_rental
    puts "\n Select a Book from the following list by number"
    @books.each_with_index do |book, index|
      puts "#{index}) Title: #{book.title}, Author: #{book.author}"
    end
    book_index = gets.chomp.to_i
    puts "\n Select a person from the folloeing list by number"
    @people.each_with_index do |person, index|
      puts "#{index}) Name: #{person.name}, Age: #{person.age}, ID: #{person.id}"
    end
    person_index = gets.chomp.to_i
    puts "\nDate: "
    date = gets.chomp
    @rentals << Rental.new(date, @books[book_index], @people[person_index])
    puts "\nRental created successfully"
    options
  end

  def list_all_rentals
    puts "\n Enter Person ID: "
    person_id = gets.chomp.to_i
    rentals = @rentals.filter { |rental| rental.person.id == person_id }
    puts 'Rentals:'
    rentals.each do |rental|
      puts "Date: #{rental.date}, Book: '#{rental.book.title}' by #{rental.book.author}"
    end
    options
  end
end
