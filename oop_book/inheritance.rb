class Animal
  def initialize(name)
    @name = name
  end  
  def speak
    "arf arf arf arf"
  end
end

class Pooch < Animal
  attr_accessor :name, :color
  def initialize(name, color)
    super(name)
    @color = color
  end
  def speak
    "#{name} the #{color} pooch says, " + super 
  end
end

class Puss < Animal
end

sparky = Pooch.new("Sparky", "golden") 
puts sparky.speak
wow = Puss.new("Wow")
puts wow.speak