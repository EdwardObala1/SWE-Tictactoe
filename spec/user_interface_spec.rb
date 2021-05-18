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
end
