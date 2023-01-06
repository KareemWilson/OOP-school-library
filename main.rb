require_relative 'app'


def main 
    app = App.new()
    puts "Welcome to the School Libarary App"
    app.options()
    
end

puts main()