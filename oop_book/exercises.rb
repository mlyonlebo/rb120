# # 1. 
# =begin
# Create a superclass called Vehicle for your MyCar class t
# to inherit from and move the behavior that isn't specific to the MyCar class to the superclass. 
# Create a constant in your MyCar class that stores information about the vehicle 
# that makes it different from other types of Vehicles.

# Then create a new class called MyTruck that inherits from your superclass 
# that also has a constant defined that separates it from the MyCar class in some way.
# =end
# class Vehicle
  
#   attr_accessor :speed, :color, :total_cars
#   attr_reader :year, :model 

#   @@number_of_vehicles = 0

#   def initialize(year, model, color)
#     @year = year
#     @model = model
#     @color = color
#     @speed = 0
#     @@number_of_vehicles += 1
#   end

#   def self.mileage(miles, gallons)
#     "#{miles.to_f / gallons} miles to the gallon."
#   end

#   def self.total_vehicles
#     "There are #{@@number_of_vehicles} vehicles."
#   end

#   def accelerate(mph)
#     self.speed += mph
#   end

#   def decelerate(mph)
#     self.speed -= mph
#   end

#   def park
#     self.speed = 0
#   end

#   def spray_paint(color)
#     self.color = color
#   end

# end

# module Convertible
#   def top_down
#     puts "I'm rolling with the top down!"
#   end
# end

# class MyCar < Vehicle
#   include Convertible
#   HYBRID = true

#   def age
#     seconds_per_year = 31536000
#     (Time.new - manufacture_date) / seconds_per_year.to_f 
#   end

#   private

#   def manufacture_date
#     Time.new(self.year)
#   end

# end

# class MyTruck < Vehicle
#   HYBRID = false
# end

# # puts Vehicle.mileage(555, 18)
# silver_bullet = MyCar.new(2006, "Toyota", "Camry Hybrid")
# big_bertha = MyTruck.new(1977, "Chevy", "Silverado")
# # puts Vehicle.total_vehicles
# # silver_bullet.top_down

# puts silver_bullet.age


# class Student
  
#   def initialize(name, grade)
#     @name = name
#     @grade = grade
#   end

#   def better_grade_than?(student)
#     grade > student.grade
#   end

#   protected

#   def grade
#     @grade
#   end

# end

# joe = Student.new("Joe", 85)
# bob = Student.new("Bob", 76)
# puts joe.better_grade_than?(bob)

class Animal
  def initialize(name)
    @name = name
  end

  def speak
    puts sound
  end

  def sound
    "#{@name} says "
  end
end

class Cow < Animal
  def sound
    super + "moooooooooooo!"
  end
end

daisy = Cow.new("Daisy")
daisy.speak