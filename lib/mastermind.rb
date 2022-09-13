class Mastermind
  private

  def start
    name1 = player_name(1)
    type1 = player_type(name1)
    playstyle1 = player_playstyle(name1)
    @player1 = Player.new(name1,type1,playstyle1)

    name2 = player_name(2)
    type2 = player_type(name2)
    playstyle2 = player_playstyle(name1, playstyle1)
    @player2 = Player.new(name2,type2, playstyle2)
  end

  def player_name(num)
    puts "Player #{num}, please input your name: "
    gets.chomp
  end

  def player_type(name)
    puts "#{name}, please input if the player type (1 = human, 2 = computer): "
    type = gets.chomp until type.to_i == 1 || type.to_i == 2
    return type_convert(type)
  end

  def type_convert(type)
    case type
    when 1
      return 'Human'
    when 2
      return 'Computer'
    else
      puts 'ERROR'
    end
  end

  def player_playstyle(name, other_playstyle = '')
    puts "#{name}, please input playstyle (1 = code maker, 2 = code breaker): "
    playstyle = gets.chomp until playstyle.between?(1,2) && playstyle != other_playstyle
    return playstyle_convert(playstyle)
  end

  def playstyle_convert(playstyle)
    case playstyle
    when 1
      return 'Maker'
    when 2
      retunr 'Breaker'
    else
      puts 'ERROR'
    end
  end
end
