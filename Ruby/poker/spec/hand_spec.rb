require 'hand'
require 'card'

describe Hand do 
    let(:c2) {Card.new(:spade, 2)}
    let(:c1) {Card.new(:spade, 1)}
    let(:c3) {Card.new(:spade, 3)}
    let(:c4) {Card.new(:spade, 4)}
    let(:c5) {Card.new(:spade, 5)}

    let(:three_of_a_kind_hand) {Hand.new([
        Card.new(:diamond, 4),
        Card.new(:heart, 4),
        Card.new(:spade, 4),
        Card.new(:spade, 10),
        Card.new(:club, 11),
    ])}

    let(:high_card_hand1) {Hand.new([
        Card.new(:diamond, 4),
        Card.new(:heart, 8),
        Card.new(:spade, 6),
        Card.new(:spade, 12),
        Card.new(:club, 10),
    ])}

    let(:high_card_hand2) {Hand.new([
        Card.new(:spade, 1),
        Card.new(:club, 6),
        Card.new(:heart, 5),
        Card.new(:diamond, 3),
        Card.new(:club, 2),
    ])}

    subject(:hand) {Hand.new([c1, c2, c3, c4, c5])}
    context '#initialize' do 

        it 'when called with no arguments should raise error' do
            expect {Hand.new}.to raise_error(ArgumentError)
        end
        it 'when passed wrong number of cards should raise error' do 
            expect{ Hand.new([c1]) }.to raise_error(RuntimeError)
        end
        it 'when passed in an array of cards should store them in an instance variable' do
            expect(hand.cards).to eq([c1, c2, c3, c4, c5])
        end 
    end

    context '#hand_type' do
        it 'when called should return the correct hand type' do
            expect(hand.hand_type).to eq(:straight_flush)
        end
    end

    context '#priority' do 
        it 'when called should give the correct priority' do 
            expect(three_of_a_kind_hand.priority).to eq(5)
        end
    end

    context '#break_tie' do 
        it 'when called with 2 high card hands correctly returns the winner' do
            expect(high_card_hand1.break_tie(high_card_hand2)).to eq(high_card_hand2)
        end

        it 'when called with 2 three of a kind correctly returns the winner' do 
            
        end
    end

end


