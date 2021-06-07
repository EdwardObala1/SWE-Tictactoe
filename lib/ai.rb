require 'user_interface'
require_relative 'board'

class RandomAI
  def initialize(random_value = rand(1..9))
    @random_position = random_value
  end

  def get_move(board)
    board.available_moves.sample
  end
end


