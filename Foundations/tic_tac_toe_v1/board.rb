class Board
    def initialize
        @grid = Array.new(3) {Array.new(3, default='_')}
    end

    def valid?(pos)
        x, y = pos
         if x < 0 || x > 3 
            return false
        else
            return true
        end
    end

    def empty?(pos)
        return true if @grid[pos[0]][pos[1]] == '_'
        return false
    end

    def place_mark(pos, mark)
        x, y = pos
        if !empty?(pos) || !valid?(pos)
            raise "Wrong position" 
        else
            @grid[x][y] = mark
        end
    end

    def print
        @grid.each do |row|
            Kernel.print "            |"
            row.each do |ele|
                Kernel.print "   "
                Kernel.print ele
            end
            Kernel.print "   |"
            puts 
            Kernel.print "            |"
            Kernel.print "               |"
            puts
            
        end
    end

    def win_row?(mark)
        @grid.each do |row|
            return true if row.all? {|ele| ele == mark}
        end
        return false
    end

    def win_col?(mark)
        tgrid = @grid.transpose
        tgrid.each do |row|
            return true if row.all? {|ele| ele == mark}
        end
        return false
    end

    def win_diagonal?(mark)
        i = 0
        diag = true

        @grid.each do |row|
            diag = false if row[i] != mark
            i += 1
        end

        return true if diag

        i = 2
        diag = true

        @grid.each do |row|
            diag = false if row[i] != mark
            i -= 1
        end

        return diag
            
        
    end

    def win?(mark)
        win_row?(mark) || win_col?(mark) || win_diagonal?(mark)
    end
            
    def empty_positions?()
        @grid.each do |row|
            row.each do |ele|
                return true if ele == '_'
            end
        end
        return false
    end

end
