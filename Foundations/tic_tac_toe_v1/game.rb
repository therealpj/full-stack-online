require "./board.rb"
require "./human_player.rb"

class Game

    def initialize(player1_mark, player2_mark)
        @board = Board.new()
        @p1 = HumanPlayer.new(player1_mark)
        @p2 = HumanPlayer.new(player2_mark)
        @current_player = @p1
    end

    def switch_turn
        if @current_player == @p1
            @current_player = @p2
        else
            @current_player = @p1
        end
        return @current_player
    end

    def play
        won = false
        while @board.empty_positions? 
            @board.print
            pos = @current_player.get_position
            @board.place_mark(pos, @current_player.mark_value)
            if @board.win?(@current_player.mark_value)
                puts "Congratulations"
                puts @current_player.mark_value.to_s + " won!"
                won = true
                break
            else
                switch_turn
            end
        end

        puts "That's a draw!" if !won

        
    end



end