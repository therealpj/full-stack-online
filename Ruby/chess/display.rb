require 'colorize'
require_relative 'cursor.rb'

class Display
    attr_reader :board, :cursor
    
    def initialize(board)
        @board = board
        @cursor = Cursor.new([0, 0], board)
    end
    
    def render
        system("clear")
        @board.rows.each.with_index do |arr, row|
            arr.each.with_index do |piece, col|
                tile_color = [row, col] == cursor.cursor_pos ? selected_or_not : tile_color(row, col)
                
                print " ".colorize(:background => tile_color)
                print piece.symbol.colorize(:background => tile_color)
                print " ".colorize(:background => tile_color)
            end
            puts
        end
        nil
    end
    
    def selected_or_not
        if @cursor.selected
            return :green
        else
            return :light_red
        end
        
    end

    def tile_color(row, col)
        color = (row + col).even? ? :light_blue : :light_black
        return color
    end

    def play
        while true
            render
            @cursor.get_input
        end
    end

end
require_relative 'board.rb'
b = Board.new
d = Display.new(b)
d.play