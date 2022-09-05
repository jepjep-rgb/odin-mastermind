# frozen_string_literal: true

# Codemaker class for the Mastermind project
class Maker
  def initialize(player)
    @player = player
  end

  def choose_type
    case @player.type
    when 'Computer'
      randomize_code
    when 'Human'
      pick_method
    else
      puts 'ERROR'
    end
  end

  private

  def pick_method
    puts 'Please choose from the following: '
    puts '1. Randomize code'
    puts '2. Manually create code'
    coding_method = gets.chomp until coding_method.to_i == 1 || coding_method.to_i == 2
    select_method(coding_method.to_i)
  end

  def select_method(method)
    case method
    when 1
      randomize_code
    when 2
      create_code
    else
      puts 'ERROR'
    end
  end

  def randomize_code
    @code_array = Array.new(4) { rand(1...9) }
  end

  def create_code
    puts 'Please input the code to be decoded (0000-5555): '
    code = gets.chomp until code.to_i.between?(0, 5555)
    # from '1234' to [1, 2, 3, 4]
    code.to_i.digits.reverse
  end
end
