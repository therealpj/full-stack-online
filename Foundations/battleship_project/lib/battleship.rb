require_relative "board"
require_relative "player"

class Battleship

    attr_reader :board, :player
    def initialize(n)
        @player = Player.new()
        @board = Board.new(n)
        @remaining_misses = (n * n) / 2
    end

    def start_game
        @board.place_random_ships
        puts 0.25 * @board.size
        @board.print
    end

    def lose?
        if @remaining_misses <= 0
            puts 'You lose'
            return true
        end
        return false
    end

    def win?
        if @board.num_ships == 0
        puts 'You win'
        return true
        end
        return false
    end
    
    def game_over?
        self.win? || self.lose?
    end

    def turn
        pos = @player.get_move
        success = @board.attack(pos)
        @board.print
        if !success 
            @remaining_misses -= 1
        end
        puts @remaining_misses
        return self.game_over?
    end

end
