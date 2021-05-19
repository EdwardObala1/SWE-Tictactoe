require 'stringio'
require 'board'

class UserInterface
  attr_accessor :row,:column

  def initialize(output, input)
    @output = output
    @input = input
  end

  def get_user_name
    @output.puts 'Please enter your name:'
    @input.gets.chomp
  end

  def prompt_next_player(mark)
    @output.puts "Player #{mark} goes next"
  end

  def get_play_position
    @output.puts "Put in your Row and Column"
    row = @input.gets.chomp.to_i
    column = @input.gets.chomp.to_i

    [row, column]
  end
end