# module Merriment
#   def song_of_mirth
#     puts "Trah-LA-la-LAH-LAH-lahhhh!"
#   end
# end

class FancyLad
  
  #include Merriment

  attr_accessor :name, :catchphrase, :style

  def initialize(n, c, s)
    @name = n
    @catchphrase = c
    @style = s
  end

  def song_of_mirth
    "#{name} says, 'Trah-LA-la-LAH-LAH-lahhhh!'"
  end

  def info
    "#{name} wears #{style} and says, '#{catchphrase}!'"
  end

  def new_year_new_me(n, c, s)
    self.name = n
    self.catchphrase = c
    self.style = s
  end

  # def get_catchphrase
  #   @catchphrase
  # end

  # def set_catchphrase=(catchphrase)
  #   @catchphrase = catchphrase
  # end

end

chauncey = FancyLad.new("Chauncey P. Erskine", "I'm a little lad who loves berries and cream!", "lederhosen")
puts chauncey.info
chauncey.new_year_new_me("Blazer", "Live by the sword, die by the sword", "robe and cap")
puts chauncey.info

