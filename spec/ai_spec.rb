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
                          '', 'X', ''
                        ])
      randomAI = RandomAI.new(board)

      expect(randomAI.get_move).to eq(7).or(eq(9))
    end

    it 'plays the next position' do
      board = Board.new([
                          '', 'O', 'X',
                          'O', '', 'O',
                          'X', 'X', 'O'
                        ])
      randomAI = RandomAI.new(board)
      randomAI.ai_move(randomAI.get_move)
      expect(randomAI.get_move).to eq(1).or(eq(5))
    end
  end
end
