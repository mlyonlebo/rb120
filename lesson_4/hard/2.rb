module FuelUser
  def fuel_efficiency(km_traveled_per_liter)
    @km_traveled_per_liter = km_traveled_per_liter
  end

  def fuel_capacity(liters)
    @liters = liters
  end
end


class WheeledVehicle
  attr_accessor :speed, :heading, :km_traveled_per_liter, :liters

  include FuelUser

  def initialize(tire_array, km_traveled_per_liter, liters_of_fuel_capacity)
    @tires = tire_array
    fuel_efficiency(km_traveled_per_liter)
    fuel_capacity(liters_of_fuel_capacity)
  end

  def tire_pressure(tire_index)
    @tires[tire_index]
  end

  def inflate_tire(tire_index, pressure)
    @tires[tire_index] = pressure
  end

  def range
    @fuel_capacity * @fuel_efficiency
  end
end

class Auto < WheeledVehicle
  def initialize
    # 4 tires are various tire pressures
    super([30,30,32,32], 50, 25.0)
  end
end

class Motorcycle < WheeledVehicle
  def initialize
    # 2 tires are various tire pressures
    super([20,20], 80, 8.0)
  end
end

class Catamaran
  attr_reader :propeller_count, :hull_count, :km_traveled_per_liter, :liters
  attr_accessor :speed, :heading

  include FuelUser

  def initialize(num_propellers, num_hulls, km_traveled_per_liter, liters_of_fuel_capacity)
    @num_propellers = num_propellers
    @num_hulls = num_hulls
    fuel_efficiency(km_traveled_per_liter)
    fuel_capacity(liters_of_fuel_capacity)
  end
end

p Auto.new.km_traveled_per_liter
p Motorcycle.new.liters
p Catamaran.new(3, 4, 40, 12).liters