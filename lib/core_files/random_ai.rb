require_relative 'board'

class RandomAI
  def get_move(board)
    board.available_moves.sample
  end
end
