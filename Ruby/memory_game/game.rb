require 'byebug'
require_relative 'board.rb'

class Game

    def initialize(n)
        @board = Board.new(n)
        @prev_guess = []
        @checking_another_card = false
    end

    def play

        while  !@board.won?
            system("clear")
            @board.render
            puts "Enter position of the card you'd like to flip (e.g., '1,2') "
            invalid_pos = true
            
            while invalid_pos
                guessed = gets.chomp.split(',')
                invalid_pos = invalid(guessed)    
            end
            @board[guessed].reveal
            make_guess(guessed)
        end
    end

    def invalid(guessed)
        x, y = guessed
        x = x.to_i
        y = y.to_i
        return true if x < 0 || x >= @board.size
        return true if y < 0 || y >= @board.size
        return false
    end

    def make_guess(guessed)
        
        if @checking_another_card
            if @board[guessed].eq(@board[@prev_guess])
                puts "Now thats a match :)"
            else
                puts "Wrong guess :("

                sleep(1)
                @board[guessed].hide
                @board[@prev_guess].hide
            end

            @checking_another_card = false
        else
            @prev_guess = guessed.dup
            @checking_another_card = true
        end
    end

end




