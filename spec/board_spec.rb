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
    board = Board.new
    expect(board.place_move("X",2,3)).to eq([
        ["", "", ""],
        ["", "", "X"],
        ["", "", ""]
      ])
  end
  
end