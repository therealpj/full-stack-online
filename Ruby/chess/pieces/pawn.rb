require_relative 'piece.rb'

class Pawn < Piece
    def initialize(color, board, pos)
        super(color, board, pos)
    end

    def symbol
        '♟'.colorize(color)
    end

    def at_start_row?
        return true if self.pos[0] == 1 && self.color == :white
        return true if self.pos[0] == 6 && self.color == :black
        return false
    end

    def forward_dir
        if self.color == :white
            return 1
        else
            return -1
        end
    end

    def moves
        moves = []
        row, col = self.pos
        #check if next position is blocked
        if valid_pos([row+forward_dir, col])
            if !board.rows[row + forward_dir][col].is_a?(NullPiece)
                return side_attacks
            end
        end

        if at_start_row?
            next_pos = [row + forward_dir + forward_dir, col]
            moves << next_pos if @board.rows[next_pos[0]][next_pos[1]].is_a?(NullPiece)
        end

        if valid_pos([row+forward_dir, col])
            if self.board.rows[row + forward_dir][col].is_a?(NullPiece)
                moves << [row + forward_dir, col]
            end
        end

        moves += side_attacks
        moves
    end

    
    def side_attacks
        moves = []
        row, col = self.pos
        lside = [row + 1, col + 1]
        rside =  [row + 1, col - 1]
        if valid_pos(lside) && !board.rows[lside[0]][lside[1]].is_a?(NullPiece)
            moves << lside if board.rows[lside[0]][lside[1]].color != self.color
        end

        if valid_pos(rside) && !board.rows[rside[0]][rside[1]].is_a?(NullPiece)
            moves << rside if board.rows[rside[0]][rside[1]].color != self.color
        end

        moves
    end

    def valid_pos(pos)
        r, c = pos
        return false unless r.between?(0, 7)
        return false unless c.between?(0, 7)
        return true
    end

end
















