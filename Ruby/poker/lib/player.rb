require_relative 'hand.rb'

class Player

    attr_reader :hand, :pot, :name
    def initialize(name, hand, pot)
        @name = name
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
        print "Poker player " + name + "discarded: "
        dicarded.each do |card|
            print card.symbol 
            puts " "
        end
        
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

    def get_input

        begin
            puts 'What do you want to do, ' + name
            puts "1. Fold"
            puts "2. Raise"
            puts "3. See the current bet"

            choice = gets.chomp
            valid?(choice)
        rescue 
            puts "Invalid choice. Please retry"
            retry 
        end
    end

    def valid?(choice)
        valid_choices = [
            '1', '2', '3', 
            'fold', 'Fold', 'f', 
            'raise', 'Raise', 'r',
            'see', 'See', 'S'
        ]
        raise "Invalid choice" unless valid_choices.include?(choice)
        return true
    end

end