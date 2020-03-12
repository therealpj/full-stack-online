require 'colorize'

class Piece
    attr_reader :color, :board, :pos
    def initialize(color, board, pos)
        @color = color
        @board = board
        @pos = pos
    end

    def to_s
        symbol.to_s
    end

    def empty?
        row, col = @pos
        @board.rows[row][col].is_a?(Piece)
    end

    def valid_moves
        valid = []
        return valid
    end

    def pos=(val)
        row, col = pos
        @board[row][col] = val
    end
    
    def symbol
        :piece
    end

    def move_into_check?(end_pos)
        valid = valid_moves
        return valid.include?(end_pos)
    end

end

class NullPiece < Piece
    def initialize
    end

    def moves
        return nil
    end
    
    def symbol
        return " "
    end

end