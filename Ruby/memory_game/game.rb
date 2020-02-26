require 'byebug'
require_relative 'board.rb'
require_relative 'humanplayer.rb'
require_relative 'computerplayer.rb'
class Game

    def initialize(name, n)
        @player = ComputerPlayer.new(name)
        @board = Board.new(n)
        @prev_guess = []
        @checking_another_card = false
        @flipped_cards = []
    end

    def play

        while !@board.won?
            system("clear")
            @board.render
            invalid_pos = true
            @player.board_size(@board.size)
            while invalid_pos
                @player.prompt
                guessed = @player.get_input
                invalid_pos = invalid(guessed)    
            end

            @board.reveal(guessed)
            make_guess(guessed)
        end

        system("clear")
        @board.render
        puts "\n*****Game Over*****\n!"
        puts "Well played!!"
    end

    def invalid(guessed)
        x, y = guessed
        x = x.to_i
        y = y.to_i
        return true if x < 0 || x >= @board.size
        return true if y < 0 || y >= @board.size

        if @flipped_cards.include?(guessed) 
            puts "Hey you flipped that already"
            sleep(1)
            return true
        end

        return false
    end

    def make_guess(guessed)
        if @checking_another_card
            if @board[guessed].eq(@board[@prev_guess])
                puts "Now thats a match :)"
                @player.recieve_matched_pair(@board[guessed].face_value, guessed, @prev_guess)
                @flipped_cards << guessed
                sleep(1)
            else
                system("clear")
                @board.render
                puts "Wrong guess :("
                sleep(1)
                @player.recieve_revealed_card(@board[guessed].face_value, guessed)
                @board.hide(guessed)
                @board.hide(@prev_guess)
            end
            prev = []
            @checking_another_card = false
        else
            @player.recieve_revealed_card(@board[guessed].face_value, guessed)
            @prev_guess = guessed.dup
            @checking_another_card = true
        end
        
    end

end




