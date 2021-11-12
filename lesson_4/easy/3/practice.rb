class Cat
  attr_accessor :type, :age

  def initialize(type)
    @type = type
    @age  = 0
  end

  def make_one_year_older
    self.age += 1
  end
end


miggs = Cat.new('tabby')
miggs.make_one_year_older
p miggs.age