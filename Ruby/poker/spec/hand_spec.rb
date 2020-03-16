require 'hand'

describe Hand do 
    context '#initialize' do 
        let(:c1) {double("card", value=>1, suit=>:spade)}
        let(:c2) {double("card", value=>2, suit=>:spade)}
        let(:c3) {double("card", value=>3, suit=>:spade)}
        let(:c4) {double("card", value=>4, suit=>:spade)}
        let(:c5) {double("card", value=>5, suit=>:spade)}
        subject(:hand) {Hand.new([c1, c2, c3, c4, c5])}

        it 'when called with no arguments should raise error' do
            expect {Hand.new}.to raise_error
        end
        it 'when passed wrong number of cards should raise error' do 
            expect( Hand.new([c1]) ).to raise_error
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


