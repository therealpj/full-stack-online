class Board


    def initialize(n)
        @grid = Array.new(n) {Array.new(n, default=:N)}
        @size = n * n
    end

    def [](arr)
        @grid[arr[0]][arr[1]]
    end

    def size
        @size
    end

    def []=(pos, val)
        @grid[pos[0]][pos[1]] = val
    end

    def num_ships
        @grid.flatten.count(:S)
    end

    def attack(pos)
        row, col = pos
        if self[pos] == :S
            self[pos] = :H
            puts "You sunk my battleship!"
            return true
        else
            self[pos] = :X
            return false
        end
    end

    def place_random_ships
        ships = 0.25 * size
        n = Math.sqrt(size)
        ships.to_i.times do
            pos = [rand(0..n), rand(0..n)]
            while self[pos] == :S
                pos = [rand(0..n), rand(0..n)]
            end
            self.[]=(pos, :S)
        end
    end

    def hidden_ships_grid
        @grid.map do |row|
            row.map do |ele|
                if ele == :S
                    ele = :N
                else
                    ele
                end
            end
        end
    end

    def Board::print_grid(grid)
        grid.each do |row|
            puts row.join(" ")
        end
    end

    def cheat
        Board.print_grid(@grid)
    end

    def print
        Board.print_grid(hidden_ships_grid)
    end


end
