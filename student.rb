require './person'

class Student < Person
  def initialize(name, age, parent_permission: true, classroom)
    super(age, name, parent_permission)
    @classroom = classroom
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end

stu = Student.new('kareem', 15, false, 15)

puts stu.name
puts stu.age
puts stu.can_use_services?
