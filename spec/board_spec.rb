require 'board'

RSpec.describe Board do
  it 'starts with an empty grid' do
    board = Board.new

    expect(board.grid).to eq([
                               ['', '', ''],
                               ['', '', ''],
                               ['', '', '']
                             ])
  end

  it 'marks a position on the grid' do
    board = Board.new
    expect(board.place_move('X', 2, 3)).to eq([
                                                ['', '', ''],
                                                ['', '', 'X'],
                                                ['', '', '']
                                              ])
  end

  it 'marks a position on the grid' do
    board = Board.new
    board.place_move('X', 2, 2)
    board.place_move('O', 1, 2)

    expect(board.grid).to eq([
                               ['', 'O', ''],
                               ['', 'X', ''],
                               ['', '', '']
                             ])
  end

  it 'marks a position on the grid' do
    board = Board.new
    board.place_move('X', 1, 3)
    board.place_move('O', 3, 3)

    expect(board.grid).to eq([
                               ['', '', 'X'],
                               ['', '', ''],
                               ['', '', 'O']
                             ])
  end

  # check combination in Row
  it 'Check the grid combinations within the game' do
    board = Board.new

    grid1 = [
      ['', '', 'X'],
      ['', '', ''],
      ['', '', 'O']
    ]
    expect(board.check_combinations_in_row(grid1)).to eq(%w[Ongoing Ongoing Ongoing])
  end

  it 'Check the grid combinations within the game' do
    board = Board.new

    grid1 = [
      %w[X O X],
      %w[X O X],
      %w[O X O]
    ]
    expect(board.check_combinations_in_row(grid1)).to eq(%w[Tied Tied Tied])
  end

  it 'Check the grid combinations within the game' do
    board = Board.new

    grid1 = [
      %w[X X X],
      %w[X O X],
      %w[O X O]
    ]
    expect(board.check_combinations_in_row(grid1)).to eq(['X wins', 'Tied', 'Tied'])
  end

  it 'Check the grid combinations within the game' do
    board = Board.new

    grid1 = [
      %w[X O X],
      %w[X O X],
      %w[O O O]
    ]
    expect(board.check_combinations_in_row(grid1)).to eq(['Tied', 'Tied', 'O wins'])
  end

  # check for combinations in columns

  it 'Check the grid combinations within the game' do
    board = Board.new

    grid1 = [
      ['', '', 'X'],
      ['', '', ''],
      ['', '', 'O']
    ]
    expect(board.check_combinations_in_column(grid1)).to eq(%w[Ongoing Ongoing Ongoing])
  end

  it 'Check the grid combinations within the game' do
    board = Board.new

    grid1 = [
      %w[X O X],
      %w[X O X],
      %w[O X O]
    ]
    expect(board.check_combinations_in_column(grid1)).to eq(%w[Tied Tied Tied])
  end

  it 'Check the grid combinations within the game' do
    board = Board.new

    grid1 = [
      %w[X X X],
      %w[X O X],
      %w[O X O]
    ]
    expect(board.check_combinations_in_column(grid1)).to eq(%w[Tied Tied Tied])
  end

  it 'Check the grid combinations within the game' do
    board = Board.new

    grid1 = [
      %w[X O X],
      %w[X O X],
      %w[O O O]
    ]
    expect(board.check_combinations_in_column(grid1)).to eq(['Tied', 'O wins', 'Tied'])
  end

  # check for combinations in diagonals

  it 'Check the grid combinations within the game' do
    board = Board.new

    grid1 = [
      ['', '', 'X'],
      ['', '', ''],
      ['', '', 'O']
    ]
    expect(board.check_combinations_in_diagonals(grid1)).to eq(%w[Ongoing Ongoing])
  end

  it 'Check the grid combinations within the game' do
    board = Board.new

    grid1 = [
      %w[X O O],
      %w[X O X],
      %w[O X O]
    ]
    expect(board.check_combinations_in_diagonals(grid1)).to eq(['Tied', 'O wins'])
  end

  # check for combinations in columns

  it 'Check the grid combinations within the game' do
    board = Board.new

    grid1 = [
      %w[X O X],
      %w[O X O],
      ['', 'O', 'X']
    ]
    expect(board.check_combinations_in_diagonals(grid1)).to eq(['X wins', 'Ongoing'])
  end
end
