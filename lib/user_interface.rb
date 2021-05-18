require 'stringio'

class UserInterface

  def get_user_name(output, input)
    output.puts 'Please enter your name:'
    
    input.gets.chomp
  end
end
