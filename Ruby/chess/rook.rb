load 'piece.rb'
load 'slideable.rb'

class Rook < Piece    
    include Slideable

    def initialize(color, board, pos)
        super(color, board, pos)
    end

    def symbol
        "♖"
    end
    
    def move_dirs
        [:h, :v]
    end

end