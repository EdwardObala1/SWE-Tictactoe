require 'stringio'
require_relative '../core_files/board'

class UserInterface
  attr_reader :position

  BOARD_SPLITTER = "......................."

  def initialize(output, input)
    @output = output
    @input = input
  end

  def print_board(board)
    grid = board.grid.map.with_index { |cell, index| board.free?(cell) ? index + 1 : cell }
    rows = grid.each_slice(Board::GRID_DIMENSIONS).to_a
    formatted_board = rows.map { |row| row.join(' , ') }

    @output.puts formatted_board 
    @output.puts BOARD_SPLITTER
  end

  def opponent_options
    @output.puts 'Do you want to play a 1.human or 2.Easy computer Opponent 3. Hard computer Opponent'
    @input.gets.chomp.to_i
  end

  def prompt_next_player(mark)
    @output.puts "Player #{mark} goes next"
  end

  def get_play_position
    @output.puts "Put in the position you want play\n"
    @position = @input.gets.chomp.to_i
    @position
  end

  def play_vs_human?
    @output.puts "Who do you want to play 1. Another Human or 2. AI"
    @input.gets.to_i == 1
  end

  
  def conclusion(board)
    if board.winner?
      @output.puts "#{board.opponent(board.current_player)} wins"
      # print_board(board)
    elsif board.tied?
      @output.puts 'Game is tied'
    end
  end
end
