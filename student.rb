require './person'
require './classroom'

class Student < Person
  attr_reader :classroom

  def initialize(name, age, parent_permission)
    super(age, name, parent_permission)
  end

  def classroom(classroom)
    @classroom = classroom
    classroom.students << self unless classroom.students.include?(self)
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end

stu = Student.new('kareem', 15, true)

puts stu.name
puts stu.age
puts stu.can_use_services?

class1 = Classroom.new(15)
stu.classroom(class1)
puts "this is students #{class1.students.map(&:name)}"
