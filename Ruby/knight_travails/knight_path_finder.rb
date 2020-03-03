require_relative 'polytreenode.rb'

class KnightPathFinder
    def initialize(start)
        @root = PolyTreeNode.new(start)
        @considered_positions = Set.new
    end
    

    def KnightPathFinder::valid_moves(pos)
        r, c = pos
        valid = []
        moves = [2, 1, -2, -1]
        moves.each do |m|
            moves.each do |move|
                next if m.abs == move.abs
                possible_pos = [r + move, c + m]
                valid << possible_pos if valid_pos?(possible_pos)
            end
        end
        valid
    end


    def KnightPathFinder::valid_pos?(possible_pos)
        r, c = possible_pos
        return false unless r.between?(0, 7)
        return false unless c.between?(0, 7)
        return true
    end

end
