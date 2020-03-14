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
            start_pos = handle_input
            @display.render

            begin
                end_pos = get_input.dup
                check_end_position(start_pos, end_pos)
            rescue
                puts
                row, col = start_pos
                piece = @board.rows[row][col]
                puts "Are you sure " + piece.to_s +  "  moves that way?"
                retry
            end
            @board.move_piece(start_pos, end_pos)

            if @board.in_check?(:white) || @board.in_check?(:black)
                puts 
                puts "CHECK"
            end
            
            swap_turn!
        end
        
        puts "GAME OVER"
        puts @current_player.color.to_s.capitalize + " WINS!"
    end

    def check_end_position(start_pos, end_pos)
        row, col = start_pos
        piece = @board.rows[row][col]
        moves = piece.moves
        raise "WrongMoveError"  unless moves.include?(end_pos)
    end

    def handle_input
        begin
            pos = get_input.dup
            check_correct_turn(pos)
        rescue 
            puts
            color = @board.rows[pos[0]][pos[1]].color
            if color == :none
                puts "No piece selected"
            else
                puts "It is not " + color.to_s.capitalize + "'s turn"
            end
            retry
        end
        pos
    end

    def get_input
        input = @current_player.make_move
        while input == nil
            @display.render
            input = @current_player.make_move
        end
        input 
    end

    def check_correct_turn(pos)
        unless @board.rows[pos[0]][pos[1]].color == @current_player.color
            raise "Wrong turn"
        end
    end

    def game_over
        @board.checkmate?(:white) || @board.checkmate?(:black)
    end

    def swap_turn!
        @current_player =  @current_player == @p2 ? @p1 : @p2
    end

    
end