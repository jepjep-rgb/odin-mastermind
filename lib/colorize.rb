# frozen_string_literal: true

# Colorize method in String class for the Mastermind project
class String
  def colorize(color_code)
    "\e[#{color_code}m#{self}\e[0m"
  end

  def bg_red
    colorize(41)
  end

  def bg_green
    colorize(42)
  end

  def bg_brown
    colorize(43)
  end

  def bg_blue
    colorize(44)
  end

  def bg_magenta
    colorize(45)
  end

  def bg_cyan
    colorize(46)
  end
end
