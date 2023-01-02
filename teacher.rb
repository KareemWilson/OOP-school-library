require './person.rb'

class Teacher < Person
    def initialize(name, age, parent_permission, specialization)
        super(age, parent_permission, name)
        @specialization = specialization
    end

    def can_use_services?
        true
    end
end


# teacher_one = Teacher.new("Khaled", 15, true, 15)

# puts teacher_one.can_use_services?
# puts teacher_one.name
# puts teacher_one.age