require 'byebug'
class Solver

    # Solving a sudoku board using backtracking.
    # The purpose is the find the first empty spot, and fill it with a value sta-
    # -rting from 1-9. The move should be legal, i.e. no row, col or sub-grid
    # should have the same value.
    attr_reader :board
    def initialize(board)
        @board = board
    end

    def solve
        pos = find_first_empty
        return true if pos == nil
        row = pos[0]
        col = pos[1]

        (1...10).each do |value|
            # debugger
            if safe?(value, row, col)
                @board[pos] = value
                if solve
                    return true
                end
                @board[pos] = 0
            end
        end
        return false
    end

    def safe?(val, row, col)
        return false if  value_in_column?(val, col)
        return false if value_in_sub_grid?(val, mapper(row, col))
        return false if value_in_row?(val, row)
        return true
    end

    def mapper(row, col)
        row /= 3
        col /= 3
        row * 3 + col
    end

    def find_first_empty
        @board.board.each.with_index do |arr, row|
            arr.each.with_index do |ele, col|
                return [row, col] if ele.value.to_i == 0
            end
        end
        return nil 
    end

    def value_in_row?(val, row)
        values = []
        @board.board[row].each do |tile|
            values << tile.value.to_i
        end
        return values.include?(val)
    end

    def value_in_column?(val, col)
        @board.board.each.with_index do |arr, row|
            return true if @board[[row, col]].value.to_i == val
        end
        return false
    end

    def value_in_sub_grid?(val, n)
        sub_grid = @board.sub_grid(n)
        values = []
        sub_grid.each do |tile|
            values << tile.value.to_i
        end
        values.include?(val)
    end
end










