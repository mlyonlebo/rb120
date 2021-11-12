module Test
  def some_method
    puts "This is working"
  end
end

class SomeClass
  include Test
  def instance_method
    some_method
  end
end

SomeClass.new.instance_method