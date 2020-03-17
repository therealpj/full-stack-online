require 'hand.rb'

class Player

    attr_reader :hand, :pot
    def initialize(hand, pot)
        @pot = pot
        @hand = hand
    end

    def discard(positions)
        raise ArgumentError unless positions.length.between?(1, 3)
        hand.cards.each.with_index do |card, pos|
            hand.cards[pos] =  nil if positions.include?(pos)
        end
        hand.cards.select! {|card| card != nil}
        return positions.length
    end

    # def get_cards_to_discard

end