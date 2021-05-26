require_relative 'board'
require_relative 'user_interface'

class Main
  def initialize
    @board = Board.new
    @ui = UserInterface.new($stdout, $stdin)
  end
  def assemble_game_function
    # decide the player turn
    @board.decide_player_turn
    # Prompt player
    @ui.prompt_next_player(@board.mark)
    # get position
    @ui.get_play_position
    # place move
    @board.place_move(@board.mark, @ui.row, @ui.column)
    # check combinations in row, column and diagonal
    @board.check_combinations_in_row
    @board.check_combinations_in_column
    @board.check_combinations_in_diagonals
    # check the state of the game
    @board.to_check_the_state_of_game
    if @board.game_state != "Done"
      assemble_game_function
    else
      puts @board.game_end
    end
  end
end

main = Main.new
main.assemble_game_function