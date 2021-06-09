require_relative 'board'
require_relative 'user_interface'

class Game
  def initialize(board = Board.new, ui = UserInterface.new($stdout, $stdin))
    @board = board
    @ui = ui
  end

  def play
    until over?
      @ui.prompt_next_player(@board.current_player)
      @ui.get_play_position
      @board.place_move(@board.current_player, @ui.position)
      @ui.print_board(@board)
    end
    conclusion
  end

  # change this move some factors to ui
  def conclusion
    if @board.winner?
      puts "#{@board.current_player} wins"
      @ui.print_board(@board)
    else
      puts 'Game is tied'
    end
  end

  def over?
    @board.winner? || @board.tied?
  end
end
