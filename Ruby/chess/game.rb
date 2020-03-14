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

        until @board.checkmate?(:white) || @board.checkmate?(:black)
            @display.render
            input = @current_player.make_move
            while input == nil
                @display.render
                start_pos = ignore_movement(input)
                @display.render
                end_pos = ignore_movement(@current_player.make_move)
                @display.render
                @board.move_piece(start_pos, end_pos)
            end
            swap_turn!
        end
        
        puts "GAME OVER"
        puts @current_player.color.to_s.capitalize + " WINS!"
    end

    def swap_turn!
        @current_player =  @current_player == @p2 ? @p1 : @p2
    end

    # helper method that waits for user to press enter or space
    def ignore_movement(input)
        while input == nil
            @display.render
            input = @display.cursor.get_input
        end
        input
    end

end