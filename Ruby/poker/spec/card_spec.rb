require 'card'

describe Card do
    
    context '#initialize' do 
        subject(:spade4) {Card.new(:spade, 4)}
        subject(:heartking) {Card.new(:heart, 13)}
        it 'should accept a suit and card value as parameters' do
            expect { spade4 }.not_to raise_error
        end

        it 'when passed in a suit and card value should store it in instance variables' do
            expect(spade4.suit).to eq(:spade)
            expect(spade4.value).to eq(4)

            expect(heartking.suit).to eq(:heart)
            expect(heartking.value).to eq(13)
        end
    end

    context '#symbol' do
        subject(:clubking) {Card.new(:club, 13)}
        subject(:diamond1) {Card.new(:diamond, 1)}
        it 'when called should return the correct card' do
            expect(clubking.symbol).to eq('🃞'.colorize(:black))
            expect(diamond1.symbol).to eq('🃁'.colorize(:red))
        end
    end


end

