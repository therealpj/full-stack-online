require "problems"

describe "no_dupes?" do
    it "should return a new array with elements that are not repeated" do
        expect(no_dupes?([1, 1, 2, 1, 3, 2, 4])).to eq([3,4])
        expect(no_dupes?(['x', 'x', 'y', 'z', 'z'])).to eq(['y'])
    end
end