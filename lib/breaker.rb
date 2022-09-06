# frozen_string_literal: true

# Codebreaker class for the Mastermind project
class Breaker
  def initialize(player, code_array, rounds)
    @player = player
    @code_array = code_array
    @rounds = rounds
    @turn = 1
  end

  def break_code
    until end_game?
      guess = guess_code
      break if correct_guess?(guess)

      compare_digits(guess)
      display_guess_results(guess)
      next_turn
    end
  end

  private

  def next_turn
    @turn += 1
  end

  def end_game?
    @turn == @rounds
  end

  def guess_code
    # 1111 to 6666 is used because there are only 6 colors
    puts 'Input your guess to break the code (1111-6666): '
    display_color
    guess = gets.chomp until guess.to_i.between?(1111, 6666)
    @guess_result = []
    guess.to_i.digits.reverse
  end

  def correct_guess?(guess)
    @code_array == guess
  end

  def compare_key_value(guess_value, index, code_index)
    if guess_value == @code_array[code_index] && code_index == index
      @guess_result.append(1)
    elsif guess_value == @code_array[code_index] && code_index != index
      @guess_result.append(0)
    elsif guess_value != @code_array[code_index]
      @guess_result.append(-1)
    else
      puts 'ERROR'
    end
  end

  def compare_digits(guess)
    # correct value and position = 1, correct value but wrong position = 0
    # wrong value = -1
    guess.each_with_index do |guess_val, index|
      4.times do |code_index|
        compare_key_value(guess_val, index, code_index)
      end
    end
  end

  def display_color
    puts "#{'1'.bg_red} #{'2'.bg_green} #{'3'.bg_cyan} #{'4'.bg_blue} #{'5'.bg_magenta} #{'6'.bg_brown}"
  end

  def color_player_guess(guess)
    guess.each_with_index do |guess, index|
      case guess
      when 1
        guess[index] = '1'.bg_red
      when 2
        guess[index] = '2'.bg_green
      when 3
        guess[index] = '3'.bg_cyan
      when 4
        guess[index] = '4'.bg_blue
      when 5
        guess[index] = '5'.bg_blue
      when 6
        guess[index] = '6'.bg_brown
      else
        puts 'ERROR'
      end
    end
  end
  
  def color_guess_results
    @guess_result.each_with_index do |result, index|
      case result
      when 1
        @guess_result[index] = ''.bg_green
      when 0
        @guess_result[index] = ''.bg_brown
      when -1
        @guess_result[index] = ''.bg_red
      else
        puts 'ERROR'
      end
    end
  end

  def display_guess_results(guess)
    puts 'Player guess: '
    color_player_guess(guess)
    puts "#{guess[0]} #{guess[1]} #{guess[2]} #{guess[3]}"
    puts ''
    puts 'Player guess results: '
    color_guess_results
    puts "#{@guess_result[0]} #{@guess_result[1]} #{@guess_result[2]} #{@guess_result[3]}"
  end
end
