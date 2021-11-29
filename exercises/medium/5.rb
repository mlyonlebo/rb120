class MinilangError < StandardError; end
class BadTokenError < MinilangError; end
class EmptyStackError < MinilangError; end

class Minilang
  attr_accessor :commands, :register, :stack

  ACTIONS = %w(PUSH ADD SUB MULT DIV MOD POP PRINT)
  
  def initialize(commands)
    @commands = commands
    @stack = []
    @register = 0
  end

  def eval
    commands.split.each do |command|
      if is_num?(command) 
        @register = command.to_i
      elsif ACTIONS.include?(command)
        self.send(command.downcase)
      else 
        raise BadTokenError, "Invalid token: #{command}"
      end
    end
  rescue MinilangError => error
    puts error.message
  end

  def is_num?(str)
    str.match?(/[0-9]/)
  end

  def push
    stack << register
  end

  def add
    self.register += stack.pop
  end
  
  def sub
    self.register -= stack.pop
  end
  
  def mult
    self.register *= stack.pop
  end
  
  def div
    self.register /= stack.pop
  end
  
  def mod
    self.register %= stack.pop
  end
  
  def pop
    raise EmptyStackError, "Empty stack!" if stack.empty?
    self.register = stack.pop
  end
  
  def print
    puts register
  end
end

puts "command: 'PRINT'"
Minilang.new('PRINT').eval
# 0
puts "command: '5 PUSH 3 MULT PRINT'"
Minilang.new('5 PUSH 3 MULT PRINT').eval
# 15

puts "commmand: '5 PRINT PUSH 3 PRINT ADD PRINT'"
Minilang.new('5 PRINT PUSH 3 PRINT ADD PRINT').eval
# 5
# 3
# 8
puts "commmand: '5 PUSH 10 PRINT POP PRINT'"
Minilang.new('5 PUSH 10 PRINT POP PRINT').eval
# 10
# 5
puts "commmand: '5 PUSH POP POP PRINT'"
Minilang.new('5 PUSH POP POP PRINT').eval
# Empty stack!
puts "commmand: '3 PUSH PUSH 7 DIV MULT PRINT '"
Minilang.new('3 PUSH PUSH 7 DIV MULT PRINT ').eval
# 6
puts "commmand: '4 PUSH PUSH 7 MOD MULT PRINT '"
Minilang.new('4 PUSH PUSH 7 MOD MULT PRINT ').eval
# 12
puts "commmand: '-3 PUSH 5 XSUB PRINT'"
Minilang.new('-3 PUSH 5 XSUB PRINT').eval
# Invalid token: XSUB
puts "commmand: '-3 PUSH 5 SUB PRINT'"
Minilang.new('-3 PUSH 5 SUB PRINT').eval
# 8
puts "commmand: '6 PUSH'"
Minilang.new('6 PUSH').eval
# (nothing printed; no PRINT commands)
