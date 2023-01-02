require './person.rb'

class Student < Person
    def initialize(name, age, parent_permission, classroom)
        super(age, parent_permission, name)
        @classroom = classroom
    end

    def play_hooky
        '¯\(ツ)/¯'
    end
end


# stud = Student.new("pony", 18, true, 15)

# puts stud.play_hooky
# puts stud.name
# puts stud.age
# puts stud.can_use_services?