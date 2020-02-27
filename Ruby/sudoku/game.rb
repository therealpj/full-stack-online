require_relative 'board.rb'

class Game

    def initialize(file)
        @board = Board.from_file(file)
    end

    def render
        system("clear")
        @board.render
    end

    def play
        title
        until @board.solved?
            render
            pos  = get_position
            val = get_value
            @board[pos] = val
        end
        
        render
        puts "**********************"
        puts "********SOLVED********"
        puts "**********************"
         
    end

    def title
        system("clear")
        puts "**************************"
        puts "**********SUDOKU**********"
        puts "**************************"
        sleep(1)
    end

    def prompt_pos
        puts "Enter a valid position (e.g. 0, 0 ) "
    end

    def prompt_val
        puts "Enter value (e.g. 9)"
    end

    def get_position
        invalid = true
        while invalid
            prompt_pos
            pos = gets.chomp.split(',')
            invalid = invalid?(pos)
        end
        pos
    end

    def invalid?(pos)
        pos.map! {|ele| ele.to_i}
        x = pos[0] || -1
        y = pos[1] || -1
        return true if x < 0 || y < 0
        return true if x > 8 || y > 8
        return false
    end

    def get_value
        val = 0
        while val < 1 || val > 9
            prompt_val
            val = gets.chomp.to_i
        end
        return val
    end

end

