require_relative 'piece'

class Board
    attr_reader :rows

    def initialize()
        @rows = Array.new(9) {Array.new(9, default=nil)}
        @rows.each.with_index do |arr, row|
            arr.each_with_index do |tile, col|
                if row == 1 || row == 7 || row == 0 || row == 8
                    @rows[row][col] = Piece.new
                end
            end
        end
    end

    def move_piece(start_pos, end_pos)
        row, col = start_pos
        newrow, newcol = end_pos
        raise "No piece at specified position" if @rows[row][col] == nil
        raise "Cannot move to end pos" if @rows[newrow][newcol] != nil
        
        @rows[newrow][newcol] = Piece.new
        @rows[row][col] = nil
    end
    
end