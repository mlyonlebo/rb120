=begin
1
The interviewer will ask you to present or teach OOP topics. 
You should have a strong conceptual understanding of the core concepts in RB120. 
You should be able to talk about why they exist, and how to use them in code. 

2
You'll also need to use that conceptual understanding 
to reason with and solve various code examples and problems that the interviewer will present you with.
=end

#method lookup path

class Sandwich
  def initialize(filling, spread)
    @filling = filling
    @spread = spread
  end

  def decrust
    puts "Where did my crust go??"
  end
end


class PBJ < Sandwich
  def initialize
    super('peanut butter', 'jelly')
  end
end
