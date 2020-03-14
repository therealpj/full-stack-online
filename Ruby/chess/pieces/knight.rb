require_relative 'piece.rb'
require_relative 'steppable.rb'
class Knight < Piece
    include Steppable
    def initialize(color, board, pos)
        super(color, board, pos)
    end

    def symbol
        '♞'.colorize(color)
    end

    def move_dirs
        [:ju]
    end

end

