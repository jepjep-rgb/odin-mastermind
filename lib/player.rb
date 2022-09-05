# frozen_string_literal: true

# Player class for the Mastermind project
class Player
  attr_reader :name, :type, :score

  def initialize(name, type)
    @name = name
    @type = type
    @score = 0
  end

  def score_point
    @score += 1
  end
end
