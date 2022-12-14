# frozen_string_literal: true

# Mastermind class for the Mastermind project
class Mastermind
  def play
    play_game = true
    while play_game
      start
      game_loop
      play_game = restart?
    end
  end

  private

  def start
    name1 = player_name(1)
    type1 = player_type(name1)
    playstyle1 = player_playstyle(name1)
    @player1 = Player.new(name1, type1, playstyle1)

    name2 = player_name(2)
    type2 = player_type(name2)
    playstyle2 = player_playstyle(name1, playstyle1)
    @player2 = Player.new(name2, type2, playstyle2)
  end

  def player_name(num)
    puts "Player #{num}, please input your name: "
    gets.chomp
  end

  def player_type(name)
    puts "#{name}, please input if the player type (1 = human, 2 = computer): "
    type = gets.chomp until type.to_i == 1 || type.to_i == 2
    type_convert(type)
  end

  def type_convert(type)
    case type
    when 1
      'Human'
    when 2
      'Computer'
    else
      puts 'ERROR'
    end
  end

  def player_playstyle(name, other_playstyle = '')
    puts "#{name}, please input playstyle (1 = code maker, 2 = code breaker): "
    playstyle = gets.chomp until playstyle.between?(1, 2) && playstyle != other_playstyle
    playstyle_convert(playstyle)
  end

  def playstyle_convert(playstyle)
    case playstyle
    when 1
      'Maker'
    when 2
      'Breaker'
    else
      puts 'ERROR'
    end
  end

  def maker?(player, other_player)
    return player if player.playstyle == 'Maker'

    other_player
  end

  def breaker?(player, other_player)
    return player if player.playstyle == 'Breaker'

    other_player
  end

  def choose_rounds
    case @maker.player.type
    when 'Computer'
      randomize_rounds
    when 'Human'
      pick_rounds
    else
      puts 'ERROR'
    end
  end

  def pick_rounds
    puts 'Please choose from the following: '
    puts '1. Randomize number of rounds'
    puts '2. Manually input number of rounds'
    rounds = gets.chomp until rounds.to_i == 1 || coding_method.to_i == 2
    select_rounds(rounds.to_i)
  end

  def select_rounds(rounds)
    case rounds
    when 1
      randomize_code
    when 2
      input_rounds
    else
      puts 'ERROR'
    end
  end

  def input_rounds
    puts "#{@maker.player.name}, please input the number of rounds (3 to 20): "
    rounds = gets.chomp until rounds.to_i.between?(3, 20)
    rounds
  end

  def randomize_rounds
    rand(3..20)
  end

  def game_loop
    maker = maker?(@player1, @player2)
    @maker = Maker.new(maker)

    code_array = @maker.choose_type
    rounds = choose_rounds

    breaker = breaker?(@player1, @player2)
    @breaker = Breaker.new(breaker, code_array, rounds)
    # NOTE: break_code method loops until the game ends or the player wins
    @breaker.break_code
  end

  def restart?
    puts 'Do you want to restart the game? (y/n): '
    answer = gets.chomp until answer.downcase == 'y' || answer.downcase == 'n'
    answer == 'y'
  end
end
