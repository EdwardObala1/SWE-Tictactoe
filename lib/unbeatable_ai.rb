class UnbeatableAI
  attr_reader :mark

  def initialize(points = 0)
    @points = points
  end

  def choose_mark(board)
    @mark = board.available_moves.length.odd? ? 'X' : 'O'
  end

  def opponent
    @mark == 'X' ? 'O' : 'X'
  end

  def get_move(board)
    # make thhe move as a smart computer
    best_move = minimax(board)
    board.place_move(@mark, best_move)
    best_move
  end

  def minimax(board, depth = 0, score = {})
    choose_mark(board)
    # create a terminal state
    if board.win_for(mark)
      return 10
    elsif board.win_for(opponent)
      return -10
    elsif board.tied?
      return 0
    end

    # available_moves = board.available_moves

    board.available_moves.each do |available_move| # [7,9]
      # require 'pry'
      # binding.pry
      board.place_move(board.current_player, available_move)
      score[available_move] = minimax(board, depth += 1, {}) # [9]
      board.reset_board(available_move)
    end

    if depth == board.available_moves.length
      available_move = score.max_by { |_available_move, score| score } [0]
      available_move
    end

    if board.current_player == mark
      score.max_by { |_available_move, score| score }[0]
    else
      score.min_by { |_available_move, score| score }[0]
    end
  end
end
