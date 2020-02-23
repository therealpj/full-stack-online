require "byebug"
class Solver
    
    attr_reader :maze, :solved_maze
    def initialize(name)
        # Reading in the maze
        file = File.open(name)
        @maze = file.readlines.map(&:chomp)
        @solved_maze = Marshal.load(Marshal.dump(@maze))
    end

    def solver
        # Finding index of Start 
        start_line = @maze.find_index {|line| line.include?("S")}
        start_index = @maze[start_line].split("").find_index {|char| char == "S"}
        s = [start_line, start_index]

        puts "Pfft. Looks easy: "
        neighbors = find_neighbors(start_line, start_index)
        
        starting_choices = open_neighbors(neighbors)
        
        # Finding index of End 
        end_line = @maze.find_index { |line| line.include?("E") }
        end_index = @maze[end_line].split("").find_index {|char| char == "E"}
        e = [end_line, end_index]
        open = []
        starting = Path.new(s, nil)
        open << starting
        closed = []
        closed << starting
        while true
            current = open.shift
            open.each do |path|
                if path.f_cost(e) < current.f_cost(e)
                    current = path
                end
            end
            if current == nil
                break
            end
            closed << current if closed.none? { |path| path.pos == current.pos}
            
            open_neighbors(find_neighbors(current.pos[0], current.pos[1])).each do |possible|
                next_path = Path.new(possible, current)
                open << next_path if open.none? {|path| path.pos == next_path.pos } &&
                                        closed.none? {|path| path.pos == next_path.pos} 
            end
            if closed.include?(e)
                break
            end

            
        end

        start = closed.pop
        while start.parent != nil
            plot(start.pos)
            start = start.parent
            
        end

        puts @solved_maze

    end
    
    def min_dist(positions, e)
        dist = []
        positions.each do |pos|
            dist << distance(pos, e)
        end
        min_pos_idx = dist.find_index {|d| dist.min == d}
        positions[min_pos_idx]
    end

    def distance(a, b)
       
        x1 = a[0]
        y1 = a[1]
        x2 = b[0]
        y2 = b[1]

        dist = Math.sqrt( (x2 - x1)**2 + (y2 - y1)**2 )
        dist
    end
    
    # plotting a single [row, col]
    def plot(pos)
        # print pos
        @solved_maze[pos[0]][pos[1]] = '#'
    end

    def open_neighbors(neighbors)
        neighbors.select {|pos| open_path(pos)}
    end

    # checking that the index is inside the array
    def valid_index(row, col)
        if row < 0 || row > @maze.length
            return false
        elsif col < 0 || col > @maze[0].length
            return false
        end
        return true
    end


    # checking that the path is not blocked
    def open_path(position)
        # return true if @maze[position[0]][position[1]] == 'E'
        return false if @maze[position[0]][position[1]] != ' '
        return true
    end

    # returning all neighbors of the given index
    def find_neighbors(row, col)
        neighbors = []
        neighbors << [row - 1,     col] if valid_index(row - 1, col)         # up
        neighbors << [row + 1,     col] if valid_index(row + 1, col)         # down
        neighbors << [row    , col - 1] if valid_index(row,     col - 1)     # left
        neighbors << [row, col + 1] if valid_index(row,     col + 1)     # right

        neighbors
    end
end

class Path
    attr_reader :parent, :pos
    def initialize(pos, parent)
        @pos = pos
        @parent = parent
    end
    
    def f_cost(e)
        f = 10 + h_cost(e)
    end
    
    def h_cost(e)
        10 * ( (e[0] - @pos[0]).abs + (e[1] - @pos[1]).abs )
    end

end

