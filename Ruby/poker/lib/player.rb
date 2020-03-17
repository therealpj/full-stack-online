require 'hand.rb'

class Player

    attr_reader :hand, :pot
    def initialize(hand, pot)
        @pot = pot
        @hand = hand
    end

    def discard(positions)
        raise ArgumentError unless positions.length.between?(1, 3)
        positions.length.times do
            hand.cards.shift
        end
    end
end