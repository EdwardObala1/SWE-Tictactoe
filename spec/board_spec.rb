require 'board'

RSpec.describe Board do
  it 'starts with an empty grid' do
    board = Board.new

    expect(board.grid).to eq([
                               '', '', '',
                               '', '', '',
                               '', '', ''
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

  it 'Returns each row from the board' do
    grid = [
      '', '', 'X',
      'X', '', '',
      '', '', 'O'
    ]
    board = Board.new(grid)

    expect(board.rows).to eq([
      ['', '', 'X'],
      ['X', '', ''],
      ['', '', 'O'],
    ])
  end

  it 'Return columns from the board' do

    grid = [
      'X', 'O', 'X',
      'X', 'O', 'O',
      'X', 'X', 'O'
    ]
    board = Board.new(grid)
    expect(board.columns).to eq([
      ['X', 'X', 'X'],
      ['O', 'O', 'X'],
      ['X', 'O', 'O'],
    ])
  end

  it 'Returns diagonals from the board' do
    grid = [
      'X', 'O', 'X',
      'X', 'O', 'O',
      'X', 'X', 'O'
    ]
    board = Board.new(grid)
    expect(board.diagonals).to eq([
      ['X', 'O', 'O'],
      ['X', 'O', 'X'],
    ])
  end

  context '#winner?' do 
    it 'returns false when the game is ongoing' do
      grid = [
        '', '', '',
        '', '', '',
        '', '', ''
      ]
      board = Board.new(grid)
      expect(board.winner?).to eq(false)  
    end

    it 'returns false when the game is tied' do
      grid = [
        'X', 'O', 'X',
        'X', 'X', 'O',
        'O', 'X', 'O'
      ]
      board = Board.new(grid)
      expect(board.winner?).to eq(false)
    end

    it 'returns true when there is a winner in a row' do
      grid = [
        'X', 'X', 'X',
        'O', 'X', 'O',
        'O', 'X', 'O'
      ]
      board = Board.new(grid)
      expect(board.winner?).to eq(true)
    end

    it 'returns true when there is a winner in a column' do
      grid = [
        'O', 'X', 'X',
        'O', 'X', 'O',
        'O', 'X', 'X'
      ]
      board = Board.new(grid)
      expect(board.winner?).to eq(true)
    end

    it 'returns true when there is a winner in a diagonal' do
      grid = [
        'X', 'O', 'X',
        'O', 'X', 'O',
        'X', 'O', 'X'
      ]
      board = Board.new(grid)
      expect(board.winner?).to eq(true)
    end
  end

  context '#ongoing?' do
    it 'returns true when the game is ongoing' do
      grid = [
        '', '', '',
        '', '', '',
        '', '', ''
      ]
      board = Board.new(grid)
      expect(board.ongoing?(board.rows)).to eq(true)  
    end

    it 'returns false when the game is tied' do
      grid = [
        'X', 'O', 'X',
        'X', 'X', 'O',
        'O', 'X', 'O'
      ]
      board = Board.new(grid)
      expect(board.ongoing?(board.rows)).to eq(false)
    end
  end

context 'player turns' do
  it 'determines the player turns according to the grid' do
    grid = [
      '', '', '',
      '', '', '',
      '', '', ''
    ]
    board = Board.new(grid)
    expect(board.get_player_turns).to eq("X")
  end

  it 'determines the player turns according to the grid' do
    grid = [
      'X', '', '',
      '', '', '',
      '', '', ''
    ]
    board = Board.new(grid)
    expect(board.get_player_turns).to eq("O")
  end
end

end
