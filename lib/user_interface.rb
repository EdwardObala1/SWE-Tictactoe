require 'stringio'
require_relative 'board'

class UserInterface
  attr_reader :row,:column

  def initialize(output, input)
    @output = output
    @input = input  
  end

  def prompt_next_player(mark)
    @output.puts "Player #{mark} goes next"
  end

  def get_play_position
    @output.puts "Put in your Row and Column\n"
    @row = @input.gets.chomp.to_i
    @column = @input.gets.chomp.to_i

    [@row, @column]
  end  
end