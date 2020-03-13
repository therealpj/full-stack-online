require 'byebug'
module Slideable
    def moves
        all = []
        if self.move_dirs.include?(:v)
            all +=  valid_move_adder(0, 1) #up
            all +=  valid_move_adder(0, -1) #down
        end

        if self.move_dirs.include?(:h)
            all += valid_move_adder(1, 0)
            all += valid_move_adder(-1, 0)
        end

        if self.move_dirs.include?(:d)
            all += valid_move_adder(1, 1)
            all += valid_move_adder(-1, -1)
        end

        all
    end

    def valid_move_adder(dx, dy)
        row, col = self.pos
        moves = []
        new_row = row + dx
        new_col = col + dy
        
        # debugger
        a = valid_pos([new_row, new_col])
        b = board.rows[new_row][new_col].is_a?(NullPiece)
        
        while a && b
            moves << [new_row, new_col]
            new_row += dx
            new_col += dy
        end

        # if the next piece is an opponent, you can capture it
        if valid_pos([new_row, new_col]) && self.color != self.board.rows[new_row][new_col].color
            moves << [new_row, new_col]
        end
    
        moves
    end

    def valid_pos(pos)
        row, col = pos
        return false unless row.between?(0, 7)
        return false unless col.between?(0, 7)
        return true
    end



end















