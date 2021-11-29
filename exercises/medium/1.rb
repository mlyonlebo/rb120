class Machine
  attr_reader :switch

  def start
    flip_switch(:on)
  end

  def stop
    flip_switch(:off)
  end

  private

  attr_writer :switch

  def flip_switch(desired_state)
    self.switch = desired_state
  end
end

  
  machina = Machine.new
  machina.start
  p machina.switch
  machina.stop
  p machina.switch