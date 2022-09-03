class Breaker
    def initialize(player, code_array)
        @player = player
        @code_array = code_array
        @turn = 0
    end

    def next_turn
        @turn += 1
    end

    def guess_code()
        # 0000 to 5555 is used because there are only 6 colors
        puts "Input your guess to break the code (0000-5555): "
        guess = gets.chomp until guess.to_i.between?(0, 5555)
        @guess_result = Array.new()
        guess
    end

    
end