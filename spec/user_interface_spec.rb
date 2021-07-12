require 'terminal_views/user_interface'
require 'stringio'

RSpec.describe UserInterface do
  let(:output) { StringIO.new }

  it 'prompts a player on who they want to face the AI or a human opponent' do
    output = StringIO.new
    input = StringIO.new("2\n")
    ui = UserInterface.new(output,input)

    player_opponent = ui.opponent_options

    expect(output.string).to eq("Do you want to play a 1.human or 2.Easy computer Opponent 3. Hard computer Opponent\n")
    expect(player_opponent).to eq(2)
  end

  it "prints out who's player's turn it is" do
    ui = UserInterface.new(output, StringIO.new)

    ui.prompt_next_player("X")

    expect(output.string).to eq("Player X goes next\n")
  end 

  it 'Get the position the user want to make a play in' do
    output = StringIO.new
    input = StringIO.new("2\n")
    ui = UserInterface.new(output,input)

    position_of_play = ui.get_play_position

    expect(output.string).to eq("Put in the position you want play\n")
    expect(position_of_play).to eq(2)
  end

  it 'prints the board in a nice format' do
    board = Board.new(['X', '', '', 'X', '', '', 'X', '', ''])
    output = StringIO.new
    input = StringIO.new
    ui = UserInterface.new(output, input)

    ui.print_board(board)

    expect(output.string).to eq(<<~BOARD
X , 2 , 3
X , 5 , 6
X , 8 , 9
#{UserInterface::BOARD_SPLITTER}
BOARD
)
  end

  it 'checks for player options' do
    output = StringIO.new
    input = StringIO.new ("1/n")
    ui = UserInterface.new(output, input)
    expect(ui.play_vs_human?).to eq(true)
  end

  it 'checks for the conclusion when X wins' do
    board = Board.new([
      'X', 'X', 'O',
      'X', 'O', 'O',
      'O', 'X', ''
    ])
    output = StringIO.new
    ui = UserInterface.new(output, StringIO.new)
    ui.conclusion(board)
    expect(output.string).to eq("O wins\n")
  end

  it 'checks for the conclusion output when the game is tied' do
    board = Board.new([
      'X', 'O', 'X',
      'X', 'X', 'O',
      'O', 'X', 'O'
    ])
    output = StringIO.new
    ui = UserInterface.new(output, StringIO.new)
    ui.conclusion(board)
    expect(output.string).to eq("Game is tied\n")
  end
end
