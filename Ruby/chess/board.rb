require_relative 'pieces.rb'

class Board
    attr_reader :rows

    def initialize()
        @rows = Array.new(8) {Array.new(8, default=nil)}
        @rows.each.with_index do |arr, row|
            arr.each_with_index do |tile, col|
                if row.between?(2, 5)
                    @rows[row][col] = NullPiece.instance
                elsif row == 1
                    @rows[row][col] = Pawn.new(:white, self, [row, col])
                elsif row == 6
                    @rows[row][col] = Pawn.new(:black, self, [row, col])
                elsif row == 0
                    if col == 0 || col == 7
                        @rows[row][col] = Rook.new(:white, self, [row, col])
                    elsif col == 1 || col == 6
                        @rows[row][col] = Knight.new(:white, self, [row, col])
                    elsif col == 2 || col == 5
                        @rows[row][col] = Bishop.new(:white, self, [row, col])
                    elsif col == 3
                        @rows[row][col] = Queen.new(:white, self, [row, col])
                    else
                        @rows[row][col] = King.new(:white, self, [row, col])
                    end
                elsif row == 7
                    if col == 0 || col == 7
                        @rows[row][col] = Rook.new(:black, self, [row, col])
                    elsif col == 1 || col == 6
                        @rows[row][col] = Knight.new(:black, self,[row, col])
                    elsif col == 2 || col == 5
                        @rows[row][col] = Bishop.new(:black, self, [row, col])
                    elsif col == 3
                        @rows[row][col] = Queen.new(:black, self, [row, col])
                    else
                        @rows[row][col] = King.new(:black, self, [row, col])
                    end
                end
            end
        end
    end

    def move_piece(start_pos, end_pos)
        row, col = start_pos
        newrow, newcol = end_pos
        raise "No piece at specified position" if @rows[row][col].is_a?(NullPiece)
        
        piece = self.rows[row][col]
        moves = piece.moves

        raise "Cannot move to end position" unless moves.include?(end_pos)

        @rows[newrow][newcol] = piece
        @rows[row][col] = NullPiece.instance
    end

    def in_check?(color)
        king_pos = find_king(color)
    end

    def find_king
    end


end