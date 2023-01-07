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

  def take_inputs(option, secondary_option)
    case option
    when 3
      move_to_secondary(secondary_option)
    when 4
      print 'Title: '
      title = gets.chomp
      print 'Author: '
      author = gets.chomp
      create_book(title, author)
    else
      puts 'Something went wrong'
    end
  end

  def move_to_secondary(secondary_option)
    case secondary_option
    when 1
      print 'age: '
      age = gets.chomp.to_i
      print 'Name: '
      name = gets.chomp
      print 'Has parent permission? [Y/N]'
      parent_perm = gets.chomp
      parent_permission = true if (parent_perm = 'Y' || 'y' || 'yes')
      create_student(name, age, parent_permission)
    when 2
      print 'Name: '
      name = gets.chomp
      print 'age: '
      age = gets.chomp.to_i
      print 'specialization: '
      spec = gets.chomp
      create_teacher(name, age, spec)
    end
  end

  def move_to_primary(option)
    secondary_option = 0
    case option
    when 1
      list_all_books
    when 2
      list_all_people
    when 3
      print "\nDo you want to create  a Student (1) or a Teacher (2)? [Input the number]: "
      secondary_option = gets.chomp.to_i
      take_inputs(option, secondary_option)
    when 4
      take_inputs(option, secondary_option)
    when 5
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
      create_rental(date, book_index, person_index)
    when 6
      puts "\n Enter Person ID: "
      person_id = gets.chomp.to_i
      list_all_rentals(person_id)
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

  def create_student(name, age, parent_permission)
    student = Student.new(name, age, parent_permission)
    @people << student
    puts "\nStudent added successfully"
    options
  end

  def create_teacher(name, age, spec)
    teacher = Teacher.new(name, age, spec)
    @people << teacher
    puts "\nTeacher added successfully"
    options
  end

  def create_book(title, author)
    book = Book.new(title, author)
    @books << book
    puts "\nA New Book has been created successfully"
    options
  end

  def create_rental(date, book_index, person_index)
    @rentals << Rental.new(date, @books[book_index], @people[person_index])
    puts "\nRental created successfully"
    options
  end

  def list_all_rentals(person_id)
    rentals = @rentals.filter { |rental| rental.person.id == person_id }
    puts 'Rentals:'
    rentals.each do |rental|
      puts "Date: #{rental.date}, Book: '#{rental.book.title}' by #{rental.book.author}"
    end
    options
  end
end
