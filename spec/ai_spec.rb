require 'ai'

RSpec.describe RandomAI do
  # it provides a random move
  # should it provide a valid move?
  # what is a valid move?
    # a free cell
    # within the correct range (i.e 1 vs 1000)
    # within the correct format (i.e 1 vs {position: 1})

  context 'random play' do
    it 'picks a random position to play in grid' do
      board = Board.new([
        'X', 'O', 'X',
        'O', 'X', 'O',
        '', 'X', '',
      ])
      randomAI = RandomAI.new

      expect(randomAI.get_move(board)).to eq(7).or(eq(9))
    end
  end
end

