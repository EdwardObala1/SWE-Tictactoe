require_relative '../../core_files/board'
require_relative '../../terminal_views/user_interface'
require_relative '../../core_files/random_ai'
require_relative '../../core_files/unbeatable_ai'
require_relative '../web_app'

class Game
  def initialize(board, web = Webapp.new , randomai = RandomAI.new, unbeatable = UnbeatableAI.new)
    @board = board
    @web = web
    @randomai = randomai
    @unbeatable = unbeatable
  end

  def play
    game_option = @web.player_opponent
    if game_option == 1
      until over?
        human_move
      end
    elsif game_option == 2
      until over?
        human_vs_ai(@randomai)
      end
    elsif game_option == 3
      until over?
        human_vs_ai(@unbeatable)
      end
    end
  end

  def over?
    @board.winner? || @board.tied?
  end
  
  private 

  def human_move
    @ui.get_play_position
    @board.place_move(@board.current_player, @ui.position)
  end

  def human_vs_ai(ai)
    if @board.current_player == 'X'
      human_move
    else
      @board.place_move(@board.current_player, ai.get_move(@board))
    end
  end
end
