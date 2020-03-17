class TieBreaker
    
    attr_reader :hand1, :hand2, :type, :ace_in_one, :val_hash_1, :val_hash_1
    def initialize(hand1, hand2)
        @hand1 = hand1
        @hand2 = hand2
        @type = hand1.hand_type
        @ace_in_one = self.ace_in_one
        @val_hash_1 = make_value_hash(hand1)
        @val_hash_2 = make_value_hash(hand2)

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
        # each straight flush is ranked by its highest ranking card.
        # return the hand which contains one.
        return ace_in_one if ace_in_one

        # return the higher card containing hand
        4.downto(0) do |card|
            next if hand1.cards[card].value = hand2.cards[card].value
            hand1.cards[card].value > hand2.cards[card].value ? hand1 : hand2
        end
    end

    def four_of_a_kind
        # if both the quadruplets are equal, calculate the higher fifth card
        if val_hash_1.key(4) == val_hash_2.key(4)
            return val_hash_1.key(1) > val_hash_2.key(1) ? hand1 : hand2
        end

        # return the higher quadruplet
        val_hash_1.key(4) > val_hash_2.key(4) ? hand1 : hand2
    end

    def full_house
        # return the hand containing ace triplet
        return hand1 if val_hash_1.find(3) == 1
        return hand2 if val_hash_2.find(3) == 1

        # return the higher ranking triplet
        return val_hash_1.find(3) > val_hash_2.find(3) ? hand1 : hand2
    end

    def flush
        return ace_in_one if ace_in_one
        4.downto(0) do |card|
            next if hand1.cards[card].value = hand2.cards[card].value
            hand1.cards[card].value > hand2.cards[card].value ? hand1 : hand2
        end
    end

    def straight
        return ace_in_one if ace_in_one
        4.downto(0) do |card|
            next if hand1.cards[card].value = hand2.cards[card].value
            hand1.cards[card].value > hand2.cards[card].value ? hand1 : hand2
        end
    end
    
    def three_of_a_kind
        if val_hash_1.key(3) == val_hash_2.key(3)
            return val_hash_1.key(2) > val_hash_2.key(2) ? hand1 : hand2
        end
        val_hash_1.key(3) > val_hash_2.key(3) ? hand1 : hand2
    end

    def two_pair   
        hp1 = high_pair(hand1) 
        hp2 =  high_pair(hand2) 
        if hp1 == hp2
            lp1 = low_pair(hand1)
            lp2 = low_pair(hand2)
            if lp1 == lp2 
                return val_hash_1.find(1) > val_hash_2.find(1) ? hand1 : hand2
            end
            return lp1 > lp2 ? lp1 : lp2
        end
        hp1 > hp2 ? hp1 : hp2
    end

    def one_pair
        if val_hash_1.find(1) == val_hash_2.find(1)
            return ace_in_one if ace_in_one
            4.downto(0) do |card|
                next if hand1.cards[card].value == hand2.cards[cards].value
                return hand1.cards[card] > hand2.cards[card] ? hand1 : hand2
            end
        end
        val_hash_1.find(1) > val_hash_2.find(2) ? hand1 : hand2    
    end

    def high_card
        return ace_in_one if ace_in_one
        4.downto(0) do |card|
            next if hand1.cards[card].value == hand2.cards[cards].value
            return hand1.cards[card] > hand2.cards[card] ? hand1 : hand2    
        end
    end

    def high_pair(hand)
        sorted = make_value_hash(hand).sort
        if sorted[2][1] == 1
            return sorted[1][0]
        else
            return sorted[2][0]
        end
    end

    def low_pair(hand)
        sorted = make_value_hash(hand).sort
        if sorted[0][1] == 1
            return sorted[1][0]
        else
            return sorted[0][0]
        end
    end


    def make_value_hash(hand)
        # helper method which returns a key value pair 
        # which has all the different values of a hand 
        # as keys, with their counts as value.
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