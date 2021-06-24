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
    board.place_move('X', 1)

    expect(board.grid).to eq([
                              'X', '', '',
                               '', '', '',
                               '', '', ''
                              ])
  end

  it 'marks mulitple positions on the grid' do
    board = Board.new(Array.new(9) { "" })
    board.place_move('X', 2)
    board.place_move('O', 5)

    expect(board.grid).to eq([
                               '', 'X', '',
                               '', 'O', '',
                               '', '', ''
                             ])
  end

  it 'marks mulitple positions on the grid' do
    board = Board.new(Array.new(9) { "" })
    board.place_move('X', 2)
    board.place_move('O', 2)

    expect(board.grid).to eq([
                               '', 'X', '',
                               '', '', '',
                               '', '', ''
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
      grid_1 = [
        'O', 'X', 'O',
        'X', 'O', 'O',
        'X', 'X', 'X'
      ]

      grid_2 = [
        'O', 'X', 'O',
        'X', 'X', 'X',
        'X', 'O', 'O'
      ]

      grid_3 = [
        'O', 'O', 'X',
        'X', 'O', 'O',
        'X', 'X', 'X'
      ]
      board_1 = Board.new(grid_1)
      board_2 = Board.new(grid_2)
      board_3 = Board.new(grid_3)
      expect(board_1.winner?).to eq(true)
      expect(board_2.winner?).to eq(true)
      expect(board_3.winner?).to eq(true)
    end

    it 'returns true when there is a winner in a column' do
      grid_1 = [
        'O', 'X', 'O',
        'O', 'X', 'O',
        'X', 'X', 'X'
      ]

      grid_2 = [
        'X', 'X', 'O',
        'X', 'O', 'O',
        'X', 'O', 'X'
      ]

      grid_3 = [
        'O', 'X', 'X',
        'O', 'O', 'X',
        'O', 'X', 'X'
      ]
      board_1 = Board.new(grid_1)
      board_2 = Board.new(grid_2)
      board_3 = Board.new(grid_3)
      expect(board_1.winner?).to eq(true)
      expect(board_2.winner?).to eq(true)
      expect(board_3.winner?).to eq(true)
    end

    it 'returns true when there is a winner in a diagonal' do
      grid_1 = [
        'X', 'O', 'X',
        'O', 'X', 'O',
        'O', 'X', 'X'
      ]
      grid_2 = [
        'X', 'O', 'X',
        'O', 'X', 'O',
        'X', 'X', 'O'
      ]

      board_1 = Board.new(grid_1)
      board_2 = Board.new(grid_2)

      expect(board_1.winner?).to eq(true)
      expect(board_2.winner?).to eq(true)
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
    expect(board.current_player).to eq("X")
  end

  it 'determines the player turns according to the grid' do
    grid = [
      'X', '', '',
      '', '', '',
      '', '', ''
    ]
    board = Board.new(grid)
    expect(board.current_player).to eq("O")
  end
end

context 'check if the game is tied' do
  it 'determines if the game is tied or not' do
    grid = [
      'X', 'O', 'X',
      'X', 'X', 'O',
      'O', 'X', 'O'
    ]
    board = Board.new(grid)
    expect(board.tied?).to eq(true)
  end

  it 'determines if the game is tied or not' do
    grid = [
      'X', '', '',
      '', '', '',
      '', '', ''
    ]
    board = Board.new(grid)
    expect(board.tied?).to eq(false)
  end

  it 'determines if the game is tied or not' do
    grid = [
      'X', 'O', 'X',
      'O', 'X', 'O',
      'X', 'O', 'X'
    ]
    board = Board.new(grid)
    expect(board.tied?).to eq(false)
  end
  end

  it 'to get the free positions on a grid' do
    grid = [
      'X', 'O', 'X',
      'O', 'X', 'O',
      '', 'O', ''
    ]
    board = Board.new(grid)
    expect(board.available_moves.sort).to eq([7, 9])
  end

  it 'check if reset board works' do
    grid = [
      'X', 'O', 'X',
      'X', 'X', 'O',
      'O', 'X', 'O'
    ]
    board = Board.new(grid)
    expect(board.reset_board(7)).to eq([
      'X', 'O', 'X',
      'X', 'X', 'O',
      '', 'X', 'O'
    ])
  end
end
