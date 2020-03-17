require 'player'
require 'hand'
require 'deck'
require 'card'

describe 'Player' do
    let(:deck) { Deck.new }

    let(:hand)  { Hand.new([
        Card.new(:spade, 3),
        Card.new(:spade, 2),
        Card.new(:spade, 5),
        Card.new(:spade, 1),
        Card.new(:spade, 4),
    ])}

    subject(:player1) { Player.new(hand, 100)} 
    context '#initialize' do
        it 'should accept a hand and pot as arguments' do
            expect {player1}.not_to raise_error
            expect {Player.new}.to raise_error(ArgumentError)
        end
    end

    context '#discard' do
        let(:pos) {[0, 1, 2]}
        let(:hand2) { Hand.new([
        Card.new(:spade, 3),
        Card.new(:spade, 2),
        Card.new(:spade, 5),
        Card.new(:spade, 1),
        Card.new(:spade, 4),
    ])}
        it 'should accept an array of poisitions as arguments' do
            expect {player1.discard(pos)}.not_to raise_error
        end

        it 'when passed in wrong number of positions raises error' do    
            expect {player1.discard([1,2,3,4])}.to raise_error(ArgumentError)
            expect {player1.discard([])}.to raise_error(ArgumentError)
        end

        it 'when passed in invalid positions raises error' do
            expect {player1.discard[-1]}.to raise_error(ArgumentError)
            expect {player1.discard[5]}.to raise_error(ArgumentError)
        end

        it 'when passed in an array of positions correctly discards them from hand' do
            expect(player1.discard([0, 1])).to eq(2)
            expect(player1.hand.cards.length).to eq(3)
            hand2.cards.shift
            hand2.cards.shift
            values_orig = []
            player1.hand.cards.each do |card| 
                values_orig <<[card.value, card.suit]
            end
            values_doub = []
            hand2.cards.each do |card| 
                values_doub <<[card.value, card.suit]
            end
            expect(values_orig).to eql(values_doub)

        end

    end
end