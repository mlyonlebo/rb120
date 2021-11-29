module TeamLeader
  def delegate
    puts "Actually, I'm going to get someone else to do this."
  end
end

module Vacationable
  def take_vacation(duration)
    self.vacation_days -= duration
  end
end

class Employee 
  attr_reader :name, :serial, :is_full_time
  
  def initialize(name, serial, is_full_time)
    @name = name
    @serial = serial
    @is_full_time = is_full_time
  end

  def to_s
    "Name: #{@name}\nType: #{self.class}\nVacation days: #{@vacation_days}\nDesk: #{self.class::DESK}"
  end
end

class PartTime < Employee
  
  DESK = 'not reserved'
  
  def initialize(name, serial, is_full_time=false)
    super
    @vacation_days = 0
  end
end

class FullTimeEmployee < Employee
  include Vacationable
  attr_accessor :vacation_days

  DESK = 'cubicle farm'
  
  def initialize(name, serial, is_full_time=true)
    super(name, serial, is_full_time)
    @vacation_days = 10
  end
end

class Executive < FullTimeEmployee
  include TeamLeader
  
  DESK = 'corner office'
  
  def initialize(name, serial)
    super
    @vacation_days = 20
  end
end

class Manager < FullTimeEmployee
  include TeamLeader
  
  DESK = 'private office'
  
  def initialize(name, serial)
    super
    @vacation_days = 14
  end
end

george = PartTime.new('George', 12345)
puts george