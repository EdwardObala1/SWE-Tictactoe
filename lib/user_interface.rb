require '/Users/edward/Desktop/Software Engineering aspects/tictactoe_challenge/lib/board'
require 'stringio'

class UserInterface
  attr_accessor :name, :symbol, :user_details

  def initialize
    @user_details = {}
  end

  def get_user_name(output, input)
    output.puts 'Please enter your name:'
    
    input.gets.chomp
  end

end
