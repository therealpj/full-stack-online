require 'hand_type'
require 'hand'
require 'card'

describe '#HandType' do 
    let(:straight_flush_hand)  {Hand.new([
        Card.new(:spade, 3),
        Card.new(:spade, 2),
        Card.new(:spade, 5),
        Card.new(:spade, 1),
        Card.new(:spade, 4),
    ])}

    let(:four_of_a_kind_hand) {Hand.new([
        Card.new(:heart, 12),
        Card.new(:diamond, 12),
        Card.new(:club, 12),
        Card.new(:spade, 12),
        Card.new(:diamond, 4),
    ])}

    let(:full_house_hand) {Hand.new([
        Card.new(:diamond, 4),
        Card.new(:spade, 4),
        Card.new(:club, 4),
        Card.new(:heart, 10),
        Card.new(:spade, 10),
    ])}
    
    let(:flush_hand) {Hand.new([
        Card.new(:diamond, 11),
        Card.new(:diamond, 9),
        Card.new(:diamond, 8),
        Card.new(:diamond, 4),
        Card.new(:diamond, 3),
    ])}

    let(:straight_hand) {Hand.new([
        Card.new(:diamond, 10),
        Card.new(:club, 9),
        Card.new(:club, 8),
        Card.new(:heart, 7),
        Card.new(:spade, 6),
    ])}

    let(:three_of_a_kind_hand) {Hand.new([
        Card.new(:diamond, 4),
        Card.new(:heart, 4),
        Card.new(:spade, 4),
        Card.new(:spade, 10),
        Card.new(:club, 11),
    ])}

    let(:two_pair_hand) {Hand.new([
        Card.new(:heart, 11),
        Card.new(:spade, 11),
        Card.new(:club, 3),
        Card.new(:spade, 3),
        Card.new(:heart, 2),
    ])}

    let(:one_pair_hand) {Hand.new([
        Card.new(:diamond, 10),
        Card.new(:heart, 10),
        Card.new(:spade, 4),
        Card.new(:spade, 1),
        Card.new(:club, 2),
    ])}

    let(:high_card_hand1) {Hand.new([
        Card.new(:diamond, 4),
        Card.new(:heart, 8),
        Card.new(:spade, 6),
        Card.new(:spade, 12),
        Card.new(:club, 10),
    ])}

    it 'when instantiated should expect a card array' do
        expect {HandType.new(:high_card_hand)}.not_to raise_error
    end

    context '#type' do
        it 'when called with a hand returns the correct hand type' do 
            expect(straight_flush_hand.hand_type).to eq(:straight_flush)
            expect(four_of_a_kind_hand.hand_type).to eq(:four_of_a_kind)
            expect(full_house_hand.hand_type).to eq(:full_house)
            expect(flush_hand.hand_type).to eq(:flush)
            expect(straight_hand.hand_type).to eq(:straight)
            expect(three_of_a_kind_hand.hand_type).to eq(:three_of_a_kind)
            expect(two_pair_hand.hand_type).to eq(:two_pair)
            expect(one_pair_hand.hand_type).to eq(:one_pair)
            expect(high_card_hand.hand_type).to eq(:high_card)
        end
    end
end