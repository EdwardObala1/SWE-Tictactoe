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

  it 'marks a single position on the grid' do
    board = Board.new(Array.new(9) { "" })
    board.place_move_new('X', 1)

    expect(board.grid).to eq([
                              'X', '', '',
                               '', '', '',
                               '', '', ''
                              ])
  end

  it 'marks mulitple positions on the grid' do
    board = Board.new(Array.new(9) { "" })
    board.place_move_new('X', 2)
    board.place_move_new('O', 5)

    expect(board.grid).to eq([
                               '', 'X', '',
                               '', 'O', '',
                               '', '', ''
                             ])
  end

  # check combination in Row
  it 'Check the grid combinations within the game' do
    grid = [
      ['', '', 'X'],
      ['', '', ''],
      ['', '', 'O']
    ]
    board = Board.new(grid)
    expect(board.check_combinations_in_row).to eq(%w[Ongoing Ongoing Ongoing])
  end

  it 'Check the grid combinations within the game' do

    grid = [
      %w[X O X],
      %w[X O X],
      %w[O X O]
    ]
    board = Board.new(grid)
    expect(board.check_combinations_in_row).to eq(%w[Tied Tied Tied])
  end

  it 'Check the grid combinations within the game' do
    grid = [
      %w[X X X],
      %w[X O X],
      %w[O X O]
    ]
    board = Board.new(grid)

    expect(board.check_combinations_in_row).to eq(['X wins', 'Tied', 'Tied'])
  end

  it 'Check the grid combinations within the game' do
    grid = [
      %w[X O X],
      %w[X O X],
      %w[O O O]
    ]
    board = Board.new(grid)
    expect(board.check_combinations_in_row).to eq(['Tied', 'Tied', 'O wins'])
  end

  # check for combinations in columns

  it 'Check the grid combinations within the game' do

    grid = [
      ['', '', 'X'],
      ['', '', ''],
      ['', '', 'O']
    ]
    board = Board.new(grid)
    expect(board.check_combinations_in_column).to eq(%w[Ongoing Ongoing Ongoing])
  end

  it 'Check the grid combinations within the game' do
    grid = [
      %w[X O X],
      %w[X O X],
      %w[O X O]
    ]
    board = Board.new(grid)

    expect(board.check_combinations_in_column).to eq(%w[Tied Tied Tied])
  end

  it 'Check the grid combinations within the game' do
    grid = [
      %w[X X X],
      %w[X O X],
      %w[O X O]
    ]
    board = Board.new(grid)
    expect(board.check_combinations_in_column).to eq(%w[Tied Tied Tied])
  end

  it 'Check the grid combinations within the game' do
    grid = [
      %w[X O X],
      %w[X O X],
      %w[O O O]
    ]
    board = Board.new(grid)
    expect(board.check_combinations_in_column).to eq(['Tied', 'O wins', 'Tied'])
  end

  # check for combinations in diagonals

  it 'Check the grid combinations within the game' do
    grid = [
      ['', '', 'X'],
      ['', '', ''],
      ['', '', 'O']
    ]
    board = Board.new(grid)
    expect(board.check_combinations_in_diagonals).to eq(%w[Ongoing Ongoing])
  end

  it 'Check the grid combinations within the game' do

    grid = [
      %w[X O O],
      %w[X O X],
      %w[O X O]
    ]
    board = Board.new(grid)
    expect(board.check_combinations_in_diagonals).to eq(['Tied', 'O wins'])
  end

  # check for combinations in columns

  it 'Check the grid combinations within the game' do

    grid = [
      %w[X O X],
      %w[O X O],
      ['', 'O', 'X']
    ]
    board = Board.new(grid)
    expect(board.check_combinations_in_diagonals).to eq(['X wins', 'Ongoing'])
  end

  # check of the game is ongoing, won or tied
  it "checks if the game is ongoing won or tied" do
    board = Board.new
    row = ["Ongoing","Ongoing","Ongoing"]
    column = ["X wins","Ongoing","Ongoing"]
    diagonal = ["Tied","Tied"]
    expect(board.to_check_the_state_of_game(row,column,diagonal)).to eq("X wins")
  end

  it "checks if the game is ongoing won or tied" do
    board = Board.new
    row = ["Ongoing","Ongoing","Ongoing"]
    column = ["O wins","Ongoing","Ongoing"]
    diagonal = ["Tied","Tied"]
    expect(board.to_check_the_state_of_game(row,column,diagonal)).to eq("O wins")
  end

  it "checks if the game is ongoing won or tied" do
    board = Board.new
    row = ["Ongoing","Ongoing","Ongoing"]
    column = ["Tied","Ongoing","Ongoing"]
    diagonal = ["Tied","Tied"]
    expect(board.to_check_the_state_of_game(row,column,diagonal)).to eq("Ongoing")
  end

  it "checks if the game is ongoing won or tied" do
    board = Board.new
    row = ["Tied","Tied","Tied"]
    column = ["Tied","Tied","Tied"]
    diagonal = ["Tied","Tied"]
    expect(board.to_check_the_state_of_game(row,column,diagonal)).to eq("Tied")
  end

  # decide which players turn it is 
  it 'decides the player turns via grid count' do
    grid = [
      %w[X O  ],
      %w[X O X],
      %w[O X O]
    ]
    board = Board.new(grid)
    expect(board.decide_player_turn).to eq("X")
  end

  it 'decides the player turns via grid count' do
    grid = [
      %w[X O  ],
      %w[  O X],
      %w[O X O]
    ]
    board = Board.new(grid)
    expect(board.decide_player_turn).to eq("O")
  end

  it 'decides the player turns via grid count' do
    grid = [
      %w[X O X],
      %w[X O X],
      %w[O X O]
    ]
    board = Board.new(grid)
    expect(board.decide_player_turn).to eq("Done")
  end

end
