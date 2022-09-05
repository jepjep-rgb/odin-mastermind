class Breaker
    def initialize(player, code_array, rounds)
        @player = player
        @code_array = code_array
        @rounds = rounds
        @turn = 1
    end

    def next_turn
        @turn += 1
    end

    def end_game?
        @turn == @rounds
    end

    def guess_code()
        # 0000 to 5555 is used because there are only 6 colors
        puts "Input your guess to break the code (0000-5555): "
        guess = gets.chomp until guess.to_i.between?(0, 5555)
        @guess_result = Array.new()
        guess
    end

    def correct_guess?(guess)
        @code_array == guess
    end

    def compare_digits(guess)
        # correct value and position = 1, correct value but wrong position = 0
        # wrong value = -1
        guess.digits.reverse.each_with_index do |guess_val, index|
            4.times do |code_index|
                if guess_val == @code_array[code_index] && code_index == index
                    @guess_result.append(1)
                elsif guess_val == @code_array[code_index] && code_index != index
                    @guess_result.append(0)
                elsif guess_val != @code_array[code_index]
                    @guess_result.append(-1)
                else
                    puts "ERROR"
                end
            end
        end
    end

    def break_code
        until end_game?
            guess = guess_code
            break if correct_guess?(guess)
            compare_digits(guess)
            puts @guess_result
            next_turn
        end
    end

end