require './nameable'

class Person < Nameable
  attr_reader :id
  attr_accessor :name, :age, :rentals

  def initialize(age, name = 'Unknown', parent_permission = true)
    super()
    @id = Random.rand(1..100_000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def rental(rental)
    @rentals << rental
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  private

  def of_age?
    @age >= 18
  end
end
