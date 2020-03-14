require_relative '../pieces.rb'
class Rook < Piece    
    include Slideable

    def initialize(color, board, pos)
        super(color, board, pos)
    end

    def symbol
        "♖".colorize(color)
    end
    
    def move_dirs
        [:h, :v]
    end

end