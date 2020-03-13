require_relative 'steppable.rb'

class King < Piece
    include Steppable
    def initialize(color, board, pos)
        super(color, board, pos)
    end

    def symbol
        '♔'	
    end

    def move_dirs
        [:one]
    end

end