require 'deck'

describe Deck do
    
    context '#initialize' do
        subject(:deck) {Deck.new} 
        let(:card) {double("card")}
        it 'when called should not accept any arguments' do 
            expect{deck}.not_to raise_error
        end

        it 'when called should initialize a deck of 52 cards' do 
            expect(deck.deck.length).to eq(52)
        end
    end
end
