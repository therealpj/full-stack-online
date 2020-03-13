require_relative 'slideable.rb'

class Bishop < Piece
    include Slideable
    
    def initialize(color, board, pos)
        super(color, board, pos)
    end

    def symbol
        '♗'
    end

    def move_dirs
        [:d]
    end

end