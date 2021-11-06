# class MyCar
  
#   attr_accessor :color, :speed
#   attr_reader :year, :model

#   def self.mileage(miles, gallons)
#     "#{miles.to_f / gallons} miles to the gallon."
#   end

#   def initialize(y, c, m)
#     @year = y
#     @color = c
#     @model = m
#     @speed = 0
#   end

#   def to_s
#     "That's a #{color} #{model}, produced in #{year}, traveling at a speed of #{speed} miles per hour."
#   end

#   def accelerate(a)
#     self.speed += a
#   end

#   def brake(b)
#     self.speed -= b
#   end

#   def cut_engine
#     self.speed = 0
#   end

#   def spray_paint(color)
#     self.color = color
#   end

# end

# betty_white = MyCar.new(1997, 'white', 'volvo')
# puts betty_white
# puts MyCar.mileage(77, 4)

class Person
  attr_accessor :name
  def initialize(name)
    @name = name
  end
  def to_s
    "My name is #{name}"
  end 
end

bob = Person.new("Steve")
bob.name = "Bob"
puts bob
