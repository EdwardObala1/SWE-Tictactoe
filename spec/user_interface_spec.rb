require 'rubygems'
require 'rspec'
require 'user_interface'
require 'stringio'

RSpec.describe UserInterface do
  
  it 'asks the user for their name' do
    ui = UserInterface.new
    output = StringIO.new
    input = StringIO.new("Alice\n")
    
    user_name = ui.get_user_name(output, input)

    expect(output.string).to eq("Please enter your name:\n")
    expect(user_name).to eq("Alice")
  end

  xit 'checks for user input and preffered symbol' do
    user = UserInterface.new

    expect(user.individual_user_values).to eq({ 'John' => 'X' })
  end

  xit 'Validate the player symbols' do
    user = Userinterface.new
    name = 'Ian'
    symbol = 'X'
    user_details = Hash ['Kim' => 'O']
    expect(user.player_validation(name, symbol, user_details)).to eq
  end
end
