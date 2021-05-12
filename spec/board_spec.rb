require 'board'

RSpec.describe Board do

  it 'starts with an empty grid' do
    board = Board.new
    expect(board.grid).to eq([
      ["", "", ""],
      ["", "", ""],
      ["", "", ""]
    ])
  end

  it 'marks a position on the grid' do
    expect(Board.place_move("X",2,3)).to eq([
        ["", "", ""],
        ["", "", "X"],
        ["", "", ""]
      ])
  end

  it 'marks a position on the grid' do
    board = Board.new
    Board.place_move("X", 2, 2)
    Board.place_move("O", 1, 2)

    expect(board.grid).to eq([
        ["", "O", ""],
        ["", "X", "X"],
        ["", "", ""]
      ])
  end

  it 'marks a position on the grid' do
    board = Board.new
    Board.place_move("X", 1, 3)
    Board.place_move("O", 3, 3)
    

    expect(board.grid).to eq([
        ["", "O", "X"],
        ["", "X", "X"],
        ["", "", "O"]
      ])
  end

end