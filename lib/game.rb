require_relative 'core_files/board'
require_relative 'user_interface'
require_relative 'core_files/random_ai'
require_relative 'core_files/unbeatable_ai'

class Game
  def initialize(board, ui, randomai = RandomAI.new, unbeatable = UnbeatableAI.new)
    @board = board
    @ui = ui
    @randomai = randomai
    @unbeatable = unbeatable
  end

  def play
    game_option = @ui.opponent_options
    if game_option == 1
      until over?
        human_move
        @ui.print_board(@board)
      end
    elsif game_option == 2
      until over?
        human_vs_ai(@randomai)
        @ui.print_board(@board)
      end
    elsif game_option == 3
      until over?
        human_vs_ai(@unbeatable)
        @ui.print_board(@board)
      end
    end
    @ui.conclusion(@board)
  end

  def over?
    @board.winner? || @board.tied?
  end
  
  private 

  def human_move
    @ui.prompt_next_player(@board.current_player)
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
