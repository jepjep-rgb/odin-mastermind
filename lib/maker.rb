# frozen_string_literal: true

# Codemaker class for the Mastermind project
class Maker
  def initialize(player)
    @player = player
  end

  def randomize_code
    @code_array = Array.new(4) { rand(1...9) }
  end
end
