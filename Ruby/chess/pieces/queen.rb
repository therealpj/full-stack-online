require_relative 'piece'
require_relative 'slideable'

class Queen < Piece
    include Slideable

    def initialize(color, board, pos)
        super(color, board, pos)
    end

    def symbol
        '♛'.colorize(color)
    end

    def move_dirs
        [:h, :v, :d]
    end
end

    