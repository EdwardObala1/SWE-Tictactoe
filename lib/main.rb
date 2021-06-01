require_relative 'board'
require_relative 'user_interface'

class Main
  GRID_DIMENSIONS = 3

  def initialize
    @board = Board.new
    @ui = UserInterface.new($stdout, $stdin)
  end
  def assemble_game_function
    # decide the player turn
    # Prompt player
    @ui.prompt_next_player(@board.current_player)
    # get position
    @ui.get_play_position
    # place move
    @board.place_move_new(@board.current_player, @ui.position)
    # check combinations in row, column and diagonal
    if @board.winner?
      puts @board.current_player + " wins"
      puts "\n" + @board.grid.each_slice(GRID_DIMENSIONS).to_a.to_s + "\n"
    elsif @board.tied?
      puts 'Game is tied'
    else
      puts "\n" + @board.grid.each_slice(GRID_DIMENSIONS).to_a.to_s + "\n"
      assemble_game_function
    end
    
  end
end

main = Main.new
main.assemble_game_function