class UnbeatableAI
  attr_reader :mark

  def initialize(points = 0)
    @points = points
  end

  def choose_mark(board)
    board.available_moves.length.odd? ? @mark = 'X' : @mark = 'O'
  end

  def opponent
    @mark == 'X' ? 'O' : 'X'
  end

  def get_move(board)
    # make thhe move as a smart computer
    best_move = terminal(board)
    board.place_move(@mark, best_move)
    best_move
  end

  def minimax(board)
    choose_mark(board)
    # create a terminal state
    if board.win_for(mark)
      return 10
    elsif board.win_for(opponent)
      return -10
    elsif board.tied?
      return 0
    else 
      return 0
    end
  end

  def terminal(board, depth = 0, score = {})
    
  
    available_moves = board.available_moves
    available_moves.each do |available_move|
      depth += 1
      board.place_move(board.current_player, available_move) 
      score[available_move] = minimax(board)
      board.reset_board(available_move)
    end
    
    if depth == board.available_moves.length 
      available_move = score.max_by {|available_move, score| score } [0]
      available_move
    end
    
    # require 'pry'
    # binding.pry

    if board.current_player == mark
      score.max_by { |available_move, score| score } [0]
    else
      available_move = score.min_by { |available_move, score| score } [0]
      available_move
    end
    
  end
end