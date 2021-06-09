require 'stringio'
require_relative 'board'

class UserInterface
  attr_reader :position

  def initialize(output, input)
    @output = output
    @input = input
  end

  def print_board(board)
    grid = board.grid.map.with_index { |cell, index| board.free?(cell) ? index + 1 : cell }
    rows = grid.each_slice(Board::GRID_DIMENSIONS).to_a
    formatted_board = rows.map { |row| row.join(' , ') }

    @output.puts formatted_board
  end

  def opponent_options
    @output.puts 'Do you want to play a 1.human or 2.Computer Opponent'
    @response = @input.gets.chomp.to_i
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
