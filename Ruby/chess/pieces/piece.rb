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
        self.moves.reject {|move| move_into_check?(move)}
    end

    def pos=(val)
        row, col = pos
        @pos = val
    end
    
    def symbol
        raise NotImplementedError
    end

    def move_into_check?(end_pos)
        dup_board = @board.dup
        dup_board.move_piece(self.pos, end_pos)
        return true if dup_board.in_check?(self.color)
        return false
    end

    def convert(*n)
        moves = []
        n.each do |notation|

            col = notation[0]
            row = notation[1]

            col = col.ord - 'a'.ord
            row = row.to_i - 1
            moves <<  [row, col]
        end
        moves
    end


end