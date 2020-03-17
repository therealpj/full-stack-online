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

    context '#discard_at' do
        let(:pos) {[0, 1, 2]}
        let(:hand2) { Hand.new([
        Card.new(:spade, 3),
        Card.new(:spade, 2),
        Card.new(:spade, 5),
        Card.new(:spade, 1),
        Card.new(:spade, 4),
    ])}
        it 'should accept an array of poisitions as arguments' do
            expect {player1.discard_at(pos)}.not_to raise_error
        end

        it 'when passed in wrong number of positions raises error' do    
            expect {player1.discard_at([1,2,3,4])}.to raise_error(ArgumentError)
            expect {player1.discard_at([])}.to raise_error(ArgumentError)
        end

        it 'when passed in invalid positions raises error' do
            expect {player1.discard_at[-1]}.to raise_error(ArgumentError)
            expect {player1.discard_at[5]}.to raise_error(ArgumentError)
        end

        it 'when passed in an array of positions correctly discard_ats them from hand' do
            # pretty stupid of this guy to discard a straight flush
            expect(player1.discard_at([0, 1])).to eq(2)
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

    context '#valid?' do

        let(:valid_choices) {[
            '1', '2', '3', 
            'fold', 'Fold', 'f', 
            'raise', 'Raise', 'r',
            'see', 'See', 'S'
        ]}

        it 'accepts a choice as argument' do
            expect {player1.valid?('f')}.not_to raise_error
        end

        it 'when passed in an invalid option raises error' do
            expect {player1.valid?('not a valid option')}.to raise_error("Invalid choice")
            expect {player1.valid?('b')}.to raise_error("Invalid choice")
        end

        it 'when passed in a valid option returns true' do 
            valid_choices.each do |choice|
                expect(player1.valid?(choice)).to eq true 
            end
        end

        # it 'when passed in an ainvalid '
    end

end