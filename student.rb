require './person'
require './classroom'

class Student < Person
  attr_reader :classroom

  def initialize(name, age, parent_permission)
    @parent_permission = parent_permission
    super(age, name)
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students << self unless classroom.students.include?(self)
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end
