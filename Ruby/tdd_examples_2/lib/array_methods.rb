
def my_uniq(array)
    new_arr = []
    array.each do |ele|
        new_arr << ele unless new_arr.include?(ele) 
    end
    new_arr
end

def two_sum(array)
    raise ArgumentError unless array.is_a?(Array)
    pairs = []

    (0...array.length).each do |idx1|
        (idx1...array.length).each do |idx2|
            ele1 = array[idx1]
            ele2 = array[idx2]
            next if idx1 == idx2 
            pairs << [idx1, idx2] if (ele1 + ele2 == 0)
        end
    end
    
    pairs
end


def my_transpose(array)
    new_array = Array.new(array.length) {Array.new(array.length)}

    new_array.each.with_index do |arr, row|
        arr.each.with_index do |ele, col|
            new_array[col][row] = array[row][col]
        end
    end
    new_array
end




def stock_picker(prices)
    raise ArgumentError unless prices.is_a?(Array)
    profits = {}

    days = prices.length
    (0...days).each do |day1|
        cost_price = prices[day1]
        (day1...days).each do |day2|
            next if day1 == day2
            selling_price = prices[day2]
            profit = selling_price - cost_price
            profits[profit] = [day1, day2]
        end
    end

    profits[profits.keys.max]
end























