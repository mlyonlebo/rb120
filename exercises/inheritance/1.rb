module Transportation
  class Vehicle; end
  class Truck < Vehicle
    attr_reader :color
    def initialize(color)
      @color = color
    end
  end
  class Car < Vehicle; end
end

henry = Transportation::Truck.new('blue')
puts henry.color