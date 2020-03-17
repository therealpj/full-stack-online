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

    # def break_tie(hand2)
        
    #     if self.cards[0].value == 1 && hand2.value == 1
    #     elsif self.cards[0].value == 1
    #         return hand1
    #     elsif self.cards[0].value == 1
    #         return self
    #     elsif hand2.cards[0].value == 1
    #         return hand2
    #     end
        
    #     4.downto(0) do |card|
    #         self.cards[card].value > hand2.cards[card].value ? 
    #         self :
    #         hand2
    #     end

    # end
end
