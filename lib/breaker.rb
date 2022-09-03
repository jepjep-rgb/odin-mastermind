class Breaker
    def initialize(player, code_array)
        @player = player
        @code_array = code_array
        @turn = 0
    end

    def next_turn
        @turn += 1
    end
end