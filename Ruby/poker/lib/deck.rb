require 'card'

class Deck
    SUITS = [:spade, :club, :diamond, :heart]
    attr_reader :deck
    def initialize
        @deck = form_deck
    end

    def form_deck
        deck = []
        SUITS.each do |suit|
            (1..13).each do |value|
                card = Card.new(suit, value)
                deck << card
            end
        end
        deck
    end

end