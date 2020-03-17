require 'hand'
require 'card'

describe Hand do 
    let(:c2) {Card.new(:spade, 2)}
    let(:c1) {Card.new(:spade, 1)}
    let(:c3) {Card.new(:spade, 3)}
    let(:c4) {Card.new(:spade, 4)}
    let(:c5) {Card.new(:spade, 5)}

    subject(:hand) {Hand.new([c1, c2, c3, c4, c5])}
    context '#initialize' do 

        it 'when called with no arguments should raise error' do
            expect {Hand.new}.to raise_error(ArgumentError)
        end
        it 'when passed wrong number of cards should raise error' do 
            expect{ Hand.new([c1]) }.to raise_error
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


end


