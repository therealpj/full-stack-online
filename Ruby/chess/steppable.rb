module Steppable
    def moves
        all = []
        if self.move_dirs.include?(:ju)
            all += valid_move_horse
        end

        if self.move_dirs.include?(:one)
            all += valid_move_king
        end

        all
    end

    def valid_move_horse
        possible = [1, 2, -1, -2]
        row, col = self.pos
        moves = []

        possible.each do |dx|
            possible.each do |dy|
                next if dx.abs == dy.abs
                new_row = row + dx
                new_col = col + dy
                if valid_pos([new_row, new_col])
                    if self.board.rows[new_row][new_col].color == self.color
                        next
                    else
                        moves << [new_row, new_col]
                    end
                end
            end
        end
        
        moves
    end

    def valid_move_king
        possible = [1, -1, 0]
        row, col = self.pos
        moves = []
        possible.each do |dx|
            possible.each do |dy|
                next if dx == 0 && dy == 0
                new_row = row + dx
                new_col = col + dy
                if valid_pos([new_row, new_col])
                    if self.board.rows[new_row][new_col].color == self.color
                        next
                    else
                        moves << [new_row, new_col]
                    end
                end
            end
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