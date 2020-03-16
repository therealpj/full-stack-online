require 'colorize'

class Card
    attr_reader :suit, :value

    # a key value pair containing the starting value of respective unicodes.
    # spades start at 127136. We then convert this value to utf-8 (unicode)
    SUITS = {
        :spade => [127136, :black], 
        :heart => [127152, :red], 
        :club => [127184, :black],
        :diamond => [127168, :red]
        }

    def initialize(suit, value)
        @suit = suit
        @value = value
    end

    # returns the unicode of the card.
    def symbol
        suit_start = SUITS[suit][0]
        color = SUITS[suit][1]

        card = suit_start + value

        # exception at value 12 of every suit in unicode,
        # a face card "C" is present. We ignore that.
        if value > 11
            card += 1
        end

        card_unicode  = card.chr('utf-8')
        return card_unicode.colorize(color)
    end

    def print_all
        SUITS.each do |suit|
            (1..13).each do |value|
                card = Card.new(suit[0], value)
                puts card.symbol
            end
        end
    end


end


