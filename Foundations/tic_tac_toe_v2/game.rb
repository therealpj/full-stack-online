require "./board.rb"
require "./human_player.rb"

class Game

    def initialize(*marks, size)
        @board = Board.new(size)
        
        @players = []
        marks.each do |mark|
            @players << HumanPlayer.new(mark)
        end

        @current_player = @players[0]
    end

    def switch_turn
        @players.rotate!
        @current_player = @players[0]
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