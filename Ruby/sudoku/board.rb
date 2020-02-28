require 'colorize'
require_relative 'tile.rb'

class Board
    attr_reader :board
    def initialize(grid)
        @board = grid
    end

    def render  
        border
        puts
        @board.each.with_index do |arr, row|
            print "| ".colorize(:black)
            arr.each.with_index do |tile, col|
                print tile.to_s
                if col % 3 == 2
                    print " | ".colorize(:black)
                else
                    print "  "
                end
            end


            print "\r" # carriage return for last hanging " "
            print " |".colorize(:black)
            puts
            if row % 3 == 2
                border
                puts
            end
        
        end
        return
    end

    def border
        32.times do
            print "-".colorize(:black)
        end
    end

    def Board::from_file(name)
        file = File.open(name)
        lines = file.readlines.map(&:chomp)
        grid = Array.new(9) {Array.new(9)}
        lines.each.with_index do |line, row|
            line.each_char.with_index do |num, col|
                grid[row][col] = Tile.new(num, num.to_i == 0)
            end
        end
        self.new(grid)
    end

    
    
    def mapper(i)
        row = i / 3
        col = i % 3
        return [row, col]
    end

    def sub_grid(index)
        r, c = mapper(index).map {|val| val * 3}
        row = []
        sub_grid = []
        
        @board[r..(r+2)].each do |rows|
            rows[c..(c+2)].each do |tile|
                row << tile
            end
            sub_grid << row
            row = []
        end
        return sub_grid.flatten
    end

    def solved?
        sub_grids_solved? && rows_solved? && columns_solved?
    end

    def sub_grids_solved?
        (0...9).each do |n|
            sub_grid = sub_grid(n)
            return sub_grid.map {|tile| tile.value.to_i}.sort == (1..9).to_a
        end

        return true
    end

    def rows_solved?
        @board.each do |row|
            return false unless row.map {|tile| tile.value.to_i}.sort == (1..9).to_a
        end
        return true
    end

    def columns_solved?
        column = []

        @board.each.with_index do |arr, row|
            arr.each.with_index do |tile, col|
                column << @board[col][row].value.to_i
            end
            return false unless column.sort == (1..9).to_a
            column = []
        end
        return true
    end

    def [](pos)
        pos.map! {|ele| ele.to_i }
        x, y = pos
        @board[x][y]
    end

    def []=(pos, value)
        pos.map! {|ele| ele.to_i}
        x, y = pos
        @board[x][y].value = value
    end


end

