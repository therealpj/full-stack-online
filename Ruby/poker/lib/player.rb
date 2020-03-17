require_relative 'hand.rb'

class Player

    attr_reader :hand, :pot
    def initialize(hand, pot)
        @pot = pot
        @hand = hand
    end

    def discard_at(positions)
        raise ArgumentError unless positions.length.between?(1, 3)
        raise ArgumentError unless positions.all? {|pos| pos.between?(0, 5)}
        dicarded = []
        hand.cards.each.with_index do |card, pos|
            if positions.include?(pos)
                dicarded << card
                hand.cards[pos] =  nil
            end
        end
        
        # printing out the discarded cards
        dicarded.each do |card|
            print card.symbol 
            print " "
        end
        print " :Discarded"
        
        hand.cards.select! {|card| card != nil}
        return positions.length
    end

    def get_cards_to_discard
        begin
            puts 'Enter cards to discard (upto 3), seperated by commas'
            puts '(e.g 0, 1, 2)'
            positions = gets.chomp.split(",").map! {|ele| ele.to_i}
            discard_at(positions)
        rescue StandardError => e
            puts 'Invalid input'
            retry
        end
    end

end