require 'game'

RSpec.describe Game do
  context 'human vs human' do
    it 'plays a game until is over' do
      grid = ['X', 'O', 'X', 'O', 'X', 'X', '', 'O', '']
      board = Board.new(grid)
      ui = double(UserInterface).as_null_object
      expect(ui).to receive(:play_vs_human?).and_return(true)
      allow(ui).to receive(:position).and_return(7, 9)
      game = Game.new(board, ui)

      game.play

      expect(board.grid).to eq(%w[X O X O X X O O X])
      expect(game.over?).to eq(true)
    end

    it 'prompts the user for a move and gets play position' do
      grid = ['X', 'O', 'X', 'O', 'X', 'X', 'O', 'O', '']
      board = Board.new(grid)
      ui = double(UserInterface).as_null_object
      game = Game.new(board, ui)

      expect(ui).to receive(:prompt_next_player).with(board.current_player)
      expect(ui).to receive(:get_play_position)
      expect(ui).to receive(:position).and_return(9)

      game.play
    end

    it 'prints the board to the user' do
      grid = ['X', 'O', 'X', 'O', 'X', 'X', 'O', 'O', '']
      board = Board.new(grid)
      ui = double(UserInterface).as_null_object
      allow(ui).to receive(:position).and_return(9)
      game = Game.new(board, ui)

      expect(ui).to receive(:print_board).with(board)

      game.play
    end
  end

  context 'human vs ai' do
    it 'plays a game until is over' do
      grid = ['X', 'O', 'X', 'O', 'X', 'X', '', 'O', '']
      board = Board.new(grid)
      ui = double(UserInterface).as_null_object
      expect(ui).to receive(:play_vs_human?).and_return(false)
      expect(ui).to receive(:position).and_return(9)
      game = Game.new(board, ui)

      game.play

      expect(board.grid).to eq(%w[X O X O X X O O X])
      expect(game.over?).to eq(true)
    end
  end
end
