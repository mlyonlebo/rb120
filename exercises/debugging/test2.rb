module Shoutable
  def speak
    puts "I'M SHOUTING!!!"
  end
end

module Whisperable
  def speak
    puts "i'm whispering...."
  end
end

class Person
  def speak
    puts "I'm speaking."
  end
end

class Child < Person
  include Whisperable
  include Shoutable
end

Child.new.greeting

