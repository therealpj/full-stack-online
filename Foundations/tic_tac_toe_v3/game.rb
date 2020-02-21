require "./board.rb"
require "./human_player.rb"
require "./computer_player.rb"

class Game

    def initialize(size, hash)
        @board = Board.new(size)
        
        @players = []
        hash.each do |key, val|
            if val
                @players << ComputerPlayer.new(key) 
            else
                @players << HumanPlayer.new(key)
            end
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
            legal = @board.legal_positions
            pos = @current_player.get_position(legal)
            @board.place_mark(pos, @current_player.mark_value)
            if @board.win?(@current_player.mark_value)
                @board.print
                puts "Congratulations"
                puts @current_player.mark_value.to_s + " won!"
                won = true
                break
            else
                switch_turn
            end
        end


        if !won
            @board.print
            puts "That's a draw!" 
        end


        
    end



end