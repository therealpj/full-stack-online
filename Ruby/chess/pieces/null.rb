require 'singleton'
require_relative 'piece.rb'

class NullPiece < Piece
    include Singleton

    attr_reader :symbol, :color
    def initialize
        @symbol = " "
        @color = :none        
    end

    def moves
        return []
    end
    
    def symbol
        return " "
    end

end