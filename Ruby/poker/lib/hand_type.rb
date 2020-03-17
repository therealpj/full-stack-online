class HandType

    attr_reader :cards
    
    def initialize(cards)
        @cards = cards
    end

    def straight_flush
        # in a straight_flush, we check for continous cards.
        i = cards[0].value
        suit = cards[0].suit
        cards.each do |card|
            return false if card.value != i || card.suit != suit
            i += 1
        end
        return :straight_flush
    end

    def four_of_a_kind
        values = self.values
        # not four of a kind if more than 2 types of values
        return false unless values.uniq.length == 2

        # could also be a full house
        val1 = values.uniq[0]
        val2 = values.uniq[1]
        return :four_of_a_kind if (values.count(val1) == 4) || (values.count(val2) == 4)

        
        # if there are 2 different values in a hand, and no value has one card of 
        # every suit, it must be a full house.
        return :full_house
    end

    def full_house
        four_of_a_kind
    end

    def flush
        suit = cards[0].suit
        return false unless cards.all? {|card| card.suit == suit}
        return :flush
    end

    def straight
        # a straight is just consecutive values.
        # the cards are already sorted, so we don't need to sort them here.
        values = self.values
        return false unless values.uniq.length == 5

        start = values[0]
        values.each do |val|
            return false unless val == start
            start += 1
        end

        return :straight
    end

    def three_of_a_kind
        values = self.values

        return false unless values.uniq.length == 3
        
        values.uniq.each do |val|
            return :three_of_a_kind if values.count(val) == 3
        end

        return false
    end

    def pairs
        return false if values.uniq.length == 5
        # for each value, we check if it has a pair.
        values = self.values
        pairs = 0
        values.uniq.each do |val|
            pairs += 1 if values.count(val) == 2
        end

        return :two_pair if pairs == 2
        return :one_pair if pairs == 1
        return false
    end

    def type
        # using the lazy evaluation of ruby
        # the cards will be checked one by one for each card type.
        # if no type is matched, we don't have a particular hand, 
        # hence returning high card.
        straight_flush || four_of_a_kind || full_house || flush || straight || 
        three_of_a_kind || pairs || :high_card
    end


    def values
        # helper method to return the values of all the cards
        values = []
        cards.each do |card|
            values << card.value
        end
        values
    end

end
