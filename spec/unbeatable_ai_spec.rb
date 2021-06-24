require 'unbeatable_ai'
require 'board'

RSpec.describe UnbeatableAI do
  context 'Unbeatable AI player' do

  it 'goes for the win' do
    board = Board.new([
      'O', 'X', 'X',
      'X', 'O', 'O',
      '', 'X', ''
    ])
    unbeatable = UnbeatableAI.new
    
    expect(unbeatable.get_move(board)).to eq(9)
  end

  xit 'goes for the win' do
    board = Board.new([
      'X', 'X', 'O',
      'X', 'O', 'X',
      '', 'O', ''
    ])
    unbeatable = UnbeatableAI.new
    
    expect(unbeatable.get_move(board)).to eq(7)
  end

  xit 'prevents a loss' do
    board = Board.new([
      'X', 'X', 'O',
      '', 'O', 'X',
      'X', 'O', ''
    ])
    unbeatable = UnbeatableAI.new

    expect(unbeatable.get_move(board)).to eq(4)
  end

  xit 'prevents a loss' do
    board = Board.new([
      '', 'X', 'O',
      '', 'X', '',
      '', '', ''
    ])
    unbeatable = UnbeatableAI.new

    expect(unbeatable.get_move(board)).to eq(8)
  end
end
end 