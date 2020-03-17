require_relative 'hand_type'
require_relative 'tie_breaker.rb'

class Hand
    HAND_PRIORITY = [
        :straight_flush,
        :four_of_a_kind,
        :full_house,
        :flush,
        :straight,
        :three_of_a_kind,
        :two_pair,
        :one_pair,
        :high_card
    ]
    
    attr_reader :cards
    def initialize(cards)
        raise "Each hand must have 5 cards" unless cards.length == 5
        @cards = cards.sort
    end

    def hand_type
        type = HandType.new(cards)
        type.type
    end

    def priority
        # a lower number means higher priority
        HAND_PRIORITY.index(hand_type)
    end

    def break_tie(hand2)
        tie_breaker = TieBreaker.new(self, hand2)
        return tie_breaker.break_tie
    end

end
