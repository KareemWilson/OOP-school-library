class Person
    attr_reader :id
    attr_accessor :name, :age
    def initialize(age, parent_permission = true, name = 'Unknown')
        @id = Random.rand(1..100000)
        @name = name
        @age = age
        @parent_permission = parent_permission
    end

    def can_use_services?
        if is_of_age? 
            true
        else
            false
        end
    end

    private

    def is_of_age?
        if @age >= 18
            return true
        else
            return false
        end
    end
end


# first_p = Person.new(18, true, 'kareem')

# puts first_p.name
# puts first_p.age
# puts first_p.id
# puts first_p.can_use_services?