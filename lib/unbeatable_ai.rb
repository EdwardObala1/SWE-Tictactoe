require_relative 'board'

class UnbeatableAI

  def get_move(board)
    max_player(board)
    min_player
    best_move = minimax(board)
    board.place_move(@max_player, best_move)
    best_move
  end

  # the thing recurscively goes to the end point of each avalable move
  # maximising player
  # opponent minimising player

  # current plqyer = maximising player
  # opponent player = minimising player

  def max_player(board) #human
    @max_player = board.current_player
  end

  def min_player #ai
    @min_player = @max_player == 'X' ? 'O' : 'X'
  end

  def minimax(board, score = {}, depth = 0)
    # terminal state
    if board.win_for(@max_player)
      return 10
    elsif board.win_for(@min_player)
      return  -10
    elsif board.tied?
      return  0
    end

    board.available_moves.each do |available_move|
      board.place_move(board.current_player, available_move)
      score[available_move] = minimax(board, {}, depth +=1)
      board.reset_board(available_move)
    end

    if depth == board.available_moves.length
      play = score.max_by {|available_move, score| score}[0]
      return play
    end

    if board.current_player == @max_player
      score.max_by {|available_move, score| score}[1]
    else 
      score.min_by {|available_move, score| score}[1]
    end
    
  end
end
