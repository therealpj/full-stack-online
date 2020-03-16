
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
        raise "Each hand must have 5 cards" unless cards.length == 0
        @cards = cards.sort
    end

    

end
