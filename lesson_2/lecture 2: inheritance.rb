class Pet
  def run
    'running!'
  end

  def jump
    'jumping!'
  end

end

class Dog < Pet
  def swim
    'swimming!'
  end

  def fetch
    'fetching!'
  end

  def speak
    'bark!'
  end
end

class Cat < Pet
  def speak
    "meow!"
  end
end

class Bulldog < Dog
  def swim
    "can't swim!"
  end
end

pete = Pet.new
kitty = Cat.new
dave = Dog.new
bud = Bulldog.new

p bud.class.ancestors

