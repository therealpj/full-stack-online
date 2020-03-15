require 'rspec'
require 'array_methods'

describe 'array_methods' do
    context 'when testing the my_uniq function' do
        subject(:array) {[1,2,3,4,5,1,1,2,2]}
        subject(:array_dup) {[1,2,3,4,5,1,1,2,2]}
        it 'accepts an array as argument' do
            expect {my_uniq(array)}.not_to raise_error
        end

        it 'does not mutate the original array' do 
            my_uniq(array)
            expect(array).to eq(array_dup)
        end

        it 'returns a new array where no duplicates exist' do
            expect(my_uniq(array)).to eq([1,2,3,4,5])
        end
    end

    context 'when testing #two_sum' do
        subject(:array1) {[-1, 0, 2, -2, 1]}

        it 'accepts an array as an argument' do 
            expect {two_sum(array1)}.not_to raise_error
        end

        it 'returns all pairs of positions where the elements at those positions
            sum to zero' do
            expect(two_sum(array1).sort).to eq([[0, 4], [2, 3]].sort)
        end

        it 'should maintain the ordering of the indexes' do
            expect(two_sum(array1)).to eq([[0, 4], [2, 3]])
        end

        it 'should raise error if the parameter passed is not an array' do
            expect {two_sum('string')}.to raise_error(ArgumentError)
        end

        it 'should return an empty array if no such pair exists' do 
            expect(two_sum([1, 2])).to eq([])
        end
    end

    context 'when testing #my_transpose' do
        subject(:array) {[
            [0, 1, 2],
            [3, 4, 5],
            [6, 7, 8]
        ]}
        it 'should accept an array as an argument' do 
            expect {my_transpose(array)}.not_to raise_error
        end

        it 'should transpose the given array' do 
            expect(my_transpose(array)).to eq([
                [0, 3, 6],
                [1, 4, 7],
                [2, 5, 8]
            ])
        end

    end

    context 'when testing #stock_picker' do
        subject(:prices1) {[100, 1000, 200, 0, 10000]}
        subject(:prices2) {[10000, 300, 10000, 1231, 1, 23, 0 ]}
        
        it 'should accept an array of stock prices' do
            expect {stock_picker(prices1)}.not_to raise_error
        end

        it 'should return the most profitable days to buy and then to 
            sell the stock' do
            expect(stock_picker(prices1)).to eq([3, 4])
            expect(stock_picker(prices2)).to eq([1, 2])
        end
        
    end 
end




































