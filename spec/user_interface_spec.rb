require 'user_interface'
require 'stringio'

RSpec.describe UserInterface do
  let(:output) { StringIO.new }

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

    expect(output.string).to eq ("Put in the position you want play\n")
    expect(position_of_play).to eq(2)
  end

end
