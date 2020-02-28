require_relative 'board.rb'
require_relative 'solver.rb'
class Game

    def initialize(file, solver=false)
        @board = Board.from_file(file)
        
        if solver
            @solver = Solver.new(@board)
        end
    end

    def render
        system("clear")
        @board.render
    end

    def play
        if @solver
            puts "Solving..."
            @solver.solve
            render
        else
            title
            until @board.solved?
                render
                pos  = get_position
                val = get_value
                @board[pos] = val
            end
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

if __FILE__ == $PROGRAM_NAME
    puts 'Enter sudoku file'
    file = gets.chomp 
    puts 'Do you want to me to solve it? (y/n)'
    n = gets.chomp.to_s
    
    until ["y", "n"].include?(n)
        puts 'Enter y or n'
        n = gets.chomp
    end

    if n == "y"
        solver = true 
    else
        solver = false
    end

    game = Game.new(file, solver)
    game.play
end
