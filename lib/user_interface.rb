require 'stringio'
require_relative 'board'

class UserInterface
  attr_reader :position

  def initialize(output, input)
    @output = output
    @input = input  
  end

  def prompt_next_player(mark)
    @output.puts "Player #{mark} goes next"
  end

  def get_play_position
    @output.puts "Put in the position you want play\n"
    @position = @input.gets.chomp.to_i
    @position
  end  
end