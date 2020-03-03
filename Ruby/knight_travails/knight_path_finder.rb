require_relative 'polytreenode.rb'

class KnightPathFinder
    def initialize(start)
        @root = PolyTreeNode.new(start)
        @considered_positions = Set.new
    end
end
