class TieBreaker
    
    attr_reader :hand1, :hand2, :type, :ace_in_one
    def initialize(hand1, hand2)
        @hand1 = hand1
        @hand2 = hand2
        @type = hand1.hand_type
        @ace_in_one = self.ace_in_one
    end

    def break_tie
        case type
        when :straight_flush
            straight_flush  
        when :four_of_a_kind
            four_of_a_kind

        when :full_house
            full_house

        when :flush
            flush

        when :straight
            straight

        when :three_of_a_kind
            three_of_a_kind

        when :two_pair
            two_pair

        when :one_pair
            one_pair

        else
            high_card
        end
    end

    def straight_flush
        return ace_in_one if ace_in_one
        4.downto(0) do |card|
            hand1.cards[card].value > hand2.cards[card].value ? hand1 : hand2
        end
    end

    def four_of_a_kind
        val_hash_1 = make_value_hash(hand1)
        val_hash_2 = make_value_hash(hand2)

        # if both the quadruplets are equal, calculate the higher fifth card
        if val_hash_1.key(4) == val_hash_2.key(4)
            return val_hash_1.key(1) > val_hash_2.key(1) ? hand1 : hand2
        end

        # return the higher quadruplet
        val_hash_1.key(4) > val_hash_2.key(4) ? hand1 : hand2
    end

    def make_value_hash(hand)
        hash = Hash.new(0)
        hand.cards.each do |card|
            hash[card.value] += 1
        end
        hash
    end

    def ace_in_one
        # if both have aces
        return false if hand1.cards[0].value == hand2.cards[0].value && hand1[0].value == 1
        
        # return the respective hand containing ace
        return hand1 if hand1.cards[0].value == 1
        return hand2 if hand2.cards[0].value == 1

        # no hand has an ace
        return false
    end

end