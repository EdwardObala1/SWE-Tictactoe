require 'user_interface'
require_relative 'board'

class RandomAI
  def initialize(board = Board.new)
    @board = board
  end

  def get_move
    @board.available_moves.sample
  end

#   rather do with a loop
  def ai_move(position)
    if @board.current_player == 'O'
      @board.place_move('O', position)
    end
  end
end
