require 'colorize'
require_relative 'cursor.rb'

class Display
    attr_reader :board, :cursor
    
    def initialize(board)
        @board = board
        @cursor = Cursor.new([0, 0], board)
    end
    
    def render
        alphabets = ('a'..'h').to_a #
        num = (1..8).to_a   #
        system("clear")
        print " "
        num.each do |n|
            print " " + (n - 1).to_s + " "
        end
        puts
        @board.rows.each.with_index do |arr, row|
            print num[7 - row]  #
            arr.each.with_index do |piece, col|
                tile_color = [row, col] == cursor.cursor_pos ? selected_or_not : tile_color(row, col)
                
                print " ".colorize(:background => tile_color)
                print piece.symbol.colorize(:background => tile_color)
                print " ".colorize(:background => tile_color)
            end
            print num[row] - 1
            puts
        end

        print " " #
        alphabets.each do |a|   #
            print " " + a + " "#
        end#

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