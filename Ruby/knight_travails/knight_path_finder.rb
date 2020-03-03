require_relative 'polytreenode.rb'
require 'byebug'
class KnightPathFinder
    def initialize(start)
        @start = start
        @considered_positions = Set.new
        @considered_positions.add(@start)
        
        # build_move_tree
    end
    

    def self.valid_moves(pos)
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

    def new_move_positions(pos)
        valid = KnightPathFinder::valid_moves(pos)
        new_moves = []
        valid.each do |pos|
            new_moves << pos unless @considered_positions.include?(pos)
            @considered_positions.add(pos)
        end
        new_moves
    end

    def self.valid_pos?(possible_pos)
        r, c = possible_pos
        return false unless r.between?(0, 7)
        return false unless c.between?(0, 7)
        return true
    end

   

    def build_move_tree
        start = PolyTreeNode.new(@start)
        queue = [start]
        while queue.length != 0
            next_pos = queue.shift
            moves = new_move_positions(next_pos.value)
            moves.each do |move|
                move_node = PolyTreeNode.new(move)
                move_node.parent = next_pos
                next_pos.add_child(move_node)
                queue.push(move_node) 
            
            end
        end
        start
    end


end
