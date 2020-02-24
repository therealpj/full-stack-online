class Board

    def initialize(n)
        @side = n
        @board = Array.new(n) {Array.new(n, default=0)}
    end

    def print
        puts "--------------------------"
        puts "Board: "
        @board.each do |arr|
            Kernel.print arr
            puts
        end
    end

    def safe_row(row)
        0.upto(@side - 1) do |col|
            return false if @board[row][col] ==   'Q'
        end
    end

    def safe_col(col)
        0.upto(@side - 1) do |row|
            return false if @board[row][col] ==   'Q'
        end
    end

    def safe_diag(row, col)
        diag = diagonal_elements(row, col)
        diag.each do |r, c|
            return false if @board[r][c] ==   'Q'
        end
        return true 
    end


    def diagonal_elements(row, col)
        return (find_at_diagonal(row, col, 1, 1) + 
        find_at_diagonal(row, col, 1, -1) + 
        find_at_diagonal(row, col, -1, 1) +
        find_at_diagonal(row, col, -1, -1)).sort 
        
    end

    def find_at_diagonal(row, col, rinc, cinc)
        diag = []
        valid_index = true
        diag_c = col
        diag_r = row
        while valid_index
            diag_r += rinc
            diag_c += cinc
            if (valid_indices(diag_r, diag_c))
                diag << [diag_r, diag_c]
            else
                valid_index = false
            end
        end
        diag
    end

    def valid_indices(a, b)
        return false if a < 0 || a >= @side
        return false if b < 0 || b >= @side
        return true
    end

    def safe(row, col)
        return false if !safe_row(row)
        return false if !safe_col(col)
        return false if !safe_diag(row, col)
        return true
    end

    def solve(row)
        0.upto(@side - 1) do |col|
            if safe(row, col)
                @board[row][col] =   'Q'
                if row == (@side - 1)
                    print
                else
                    solve(row + 1)
                end
                @board[row][col] = 0
            end
        end
    end
    
end

puts "Enter board size: "
n = gets.chomp.to_i
board = Board.new(n)
board.solve(0)

