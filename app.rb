require_relative 'student'
require_relative 'teacher'
require_relative 'book'
require_relative 'rental'

class App
    def initialize()
        @students = []
        @teachers = []
        @books = []
        @rentals = []
    end

    def options 
        puts "\n\nPlease choose an option by entering a number"
        puts "1 - List all Books"
        puts "2 - List all People"
        puts "3 - Create a Person"
        puts "4 - Create a Book"
        puts "5 - Create a Rental"
        puts "6 - List all Rentals for a given person id"
        puts "7 - Exit"
        option = gets.chomp.to_i
        move_to_primary(option)
    end
    
    def take_inputs(option, secondary_option) 
        case option
        when 3 
            move_to_secondary(secondary_option)
        when 4
            print "Title: "
            title = gets.chomp
            print "Author: "
            author = gets.chomp
            create_book(title, author)
            puts "\nA New Book has been created successfully"
            options()
        else 
            puts "Something went wrong"
        end
    end

    def move_to_secondary(secondary_option)
        case secondary_option
        when 1 
            print "age: "
            age = gets.chomp.to_i
            print "Name: "
            name = gets.chomp
            print "Has parent permission? [Y/N]"
            parent_perm = gets.chomp
            parent_permission = true if parent_perm = "Y" || 'y'
            create_student(name, age, parent_permission)
        when 2 
            print "Name: "
            name = gets.chomp
            print "age: "
            age = gets.chomp.to_i
            print "specialization: "
            spec = gets.chomp
            create_teacher(name, age, spec)
        else
            options()
        end
    end
    
    def move_to_primary(option)
        secondary_option = 0
        case option
        when 1
            list_all_books()
            options()
        when 2
            list_all_people()
            options()
        when 3
            print "Do you want to create  a Student (1) or a Teacher (2)? [Input the number]: "
            secondary_option = gets.chomp.to_i
            take_inputs(option, secondary_option)
        when 4
            take_inputs(option, secondary_option)
        when 5
    
        when 6  
    
        when 7
            puts "I hope you enjoyed this simple application, Bye bye!"
            exit()
        else 
            puts "Unknown option"
        end
    end

    def list_all_books
        @books.map { |book| puts book.title}
    end

    def list_all_people
        @teachers.map { |teacher| puts teacher.name}
        @students.map { |student| puts student.name}
    end

    def create_student(name, age, parent_permission)
        student = Student.new(name, age, parent_permission)
        @students << student
        puts "\nStudent added successfully"
        options()
    end
    
    def create_teacher(name, age, spec)
        teacher = Teacher.new(name,age,spec)
        @teachers << teacher
        puts "\nTeacher added successfully"
        options()
    end

    def create_book(title, author)
        book = Book.new(title, author)
        @books << book
    end

    def create_rental

    end

    def list_all_rentals

    end
end