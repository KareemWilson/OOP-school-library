require './book'
require './person'

class Rental
  attr_accessor :date

  def initialize(date, book, person)
    @date = date
    @book = book
    @person = person
    book.rentals << self unless book.rentals.include?(self)
    person.rentals << self unless person.rentals.include?(self)
  end
end

book1 = Book.new('Pirates', 'Maxmilian')
person1 = Person.new(20, 'kareem')
rent = Rental.new('15-11-2022', book1, person1)

puts "this is rentals #{book1.rentals}"
