require_relative 'board'
require_relative 'user_interface'
require_relative 'random_ai'

class Game
  def initialize(board, ui, ai = RandomAI.new)
    @board = board
    @ui = ui
    @ai = ai
  end

  def play
    if @ui.play_vs_human? 
      until over?
        human_vs_human
      end
    else
      until over?
        human_vs_random_ai
      end
    end
    @ui.conclusion(@board)
  end

  def over?
    @board.winner? || @board.tied?
  end
  
  private 

  def human_vs_human
    @ui.prompt_next_player(@board.current_player)
    @ui.get_play_position
    @board.place_move(@board.current_player, @ui.position)
    @ui.print_board(@board)
  end

  def human_vs_random_ai
    if @board.current_player == 'X'
      @ui.prompt_next_player(@board.current_player)
      @ui.get_play_position
      @board.place_move(@board.current_player, @ui.position)
    else
      # available_moves -> [9] ??
      @board.place_move(@board.current_player, @ai.get_move(@board))
    end
    @ui.print_board(@board)
  end
end
