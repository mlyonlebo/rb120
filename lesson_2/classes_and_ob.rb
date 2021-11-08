#1. Given the below usage of the Person class, code the class definition.

# class Person
#   attr_accessor :name
#   def initialize(name)
#     @name = name
#   end
# end

# bob = Person.new('bob')
# p bob.name                  # => 'bob'
# bob.name = 'Robert'
# p bob.name                  # => 'Robert'

#2. Modify the class definition from above to facilitate the following methods. 
#Note that there is no name= setter method now.

# class Person
#   attr_accessor :first_name, :last_name
  
#   def initialize(first_name)
#     @first_name = first_name
#     @last_name = ''
#   end

#   def name
#     last_name.empty? ? first_name : first_name + ' ' + last_name
#   end  

# end

# bob = Person.new('Robert')
# p bob.name                  # => 'Robert'
# p bob.first_name            # => 'Robert'
# p bob.last_name             # => ''
# bob.last_name = 'Smith'
# p bob.name                  # => 'Robert Smith'

#3. Now create a smart name= method that can take just a first name or a full name, 
#and knows how to set the first_name and last_name appropriately.

class Person
  
  attr_accessor :first_name, :last_name
  
  def initialize(name)
    parse_full_name(name)
  end

  def name
    "#{first_name} #{last_name}".strip
  end

  def name=(name)
    parse_full_name(name)
  end

  def parse_full_name(name)
    names = name.split
    self.first_name = names.first
    self.last_name = names.size > 1 ? names.last : ''
  end

end

# bob = Person.new('Robert')
# p bob.name                  # => 'Robert'
# p bob.first_name            # => 'Robert'
# p bob.last_name             # => ''
# bob.last_name = 'Smith'
# p bob.name                  # => 'Robert Smith'

# bob.name = "John Adams"
# p bob.first_name            # => 'John'
# p bob.last_name             # => 'Adams'

#4. Using the class definition from step #3, let's create a few more people -- that is, Person objects.
# If we're trying to determine whether the two objects contain the same name, how can we compare the two objects?

bob = Person.new('Robert Smith')
rob = Person.new('Robert Smith')

p bob.name == rob.name