# frozen_string_literal: true

# Codemaker class for the Mastermind project
class Maker
  def initialize(player)
    @player = player
  end

  def randomize_code
    @code_array = Array.new(4) { rand(1...9) }
  end

  def create_code
    puts 'Please input the code to be decoded (0000-5555): '
    code = gets.chomp until code.to_i.between?(0,5555)
    # from '1234' to [1, 2, 3, 4]
    code.to_i.digits.reverse
  end
end
