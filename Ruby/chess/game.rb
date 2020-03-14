require_relative 'board.rb'
require_relative 'display.rb'
require_relative 'player.rb'

class Game

    def initialize
        @board = Board.new
        @display = Display.new(@board)
        @p1 = HumanPlayer.new(:white, @display)
        @p2 = HumanPlayer.new(:black, @display)
        @current_player = @p1
    end

    def play
        until game_over
            @display.render
            start_pos = get_input.dup
            @display.render
            end_pos = get_input.dup
            @board.move_piece(start_pos, end_pos)
            swap_turn!
        end
        
        puts "GAME OVER"
        puts @current_player.color.to_s.capitalize + " WINS!"
    end

    def get_input
        input = @current_player.make_move
        while input == nil
            @display.render
            input = @current_player.make_move
        end
        input 
    end

    def game_over
        @board.checkmate?(:white) || @board.checkmate?(:black)
    end

    def swap_turn!
        @current_player =  @current_player == @p2 ? @p1 : @p2
    end

    
end