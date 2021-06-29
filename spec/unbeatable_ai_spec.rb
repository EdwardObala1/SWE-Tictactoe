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

    it 'goes for the win' do
      board = Board.new([
                          'X', 'X', 'O',
                          'X', 'O', 'X',
                          '', 'O', ''
                        ])
      unbeatable = UnbeatableAI.new

      expect(unbeatable.get_move(board)).to eq(7)
    end

    it 'prevents a diagonal fork trap' do
      board = Board.new([
                          'X', '', '',
                          '', 'O', '',
                          '', '', 'X'
                        ])
      unbeatable = UnbeatableAI.new

      expect(unbeatable.get_move(board)).to eq(2)
    end

    it 'prevents a alternative diagonal fork trap' do
      board = Board.new([
                          'O', '', '',
                          '', 'X', '',
                          '', '', 'X'
                        ])
      unbeatable = UnbeatableAI.new

      expect(unbeatable.get_move(board)).to eq(3)
    end

    it 'prevents an edge trap' do
      board = Board.new([
                          '', 'X', '',
                          'X', 'O', '',
                          '', '', ''
                        ])
      unbeatable = UnbeatableAI.new

      expect(unbeatable.get_move(board)).to eq(1)
    end

    it 'prevents a reverse edge trap' do
      board = Board.new([
                          '', '', '',
                          '', 'O', 'X',
                          '', 'X', ''
                        ])
      unbeatable = UnbeatableAI.new

      expect(unbeatable.get_move(board)).to eq(3)
    end

    it 'prevents a loss' do
      board = Board.new([
                          'X', 'X', 'O',
                          '', 'O', 'X',
                          'X', 'O', ''
                        ])
      unbeatable = UnbeatableAI.new

      expect(unbeatable.get_move(board)).to eq(4)
    end

    it 'prevents a loss' do
      board = Board.new([
                          '', 'X', 'O',
                          '', 'X', '',
                          '', '', ''
                        ])
      unbeatable = UnbeatableAI.new

      expect(unbeatable.get_move(board)).to eq(8)
    end

    it 'gets a win with x' do
      board = Board.new([
                          '', 'X', 'O',
                          '', 'X', 'O',
                          '', '', ''
                        ])
      unbeatable = UnbeatableAI.new

      expect(unbeatable.get_move(board)).to eq(8)
    end
  end
end
