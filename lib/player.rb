# frozen_string_literal: true

# Player class for the Mastermind project
class Player
  attr_reader :name, :type, :score, :playstyle

  def initialize(name, type, playstyle)
    @name = name
    @type = type
    @playstyle = playstyle
    @score = 0
  end

  def score_point
    @score += 1
  end
end
