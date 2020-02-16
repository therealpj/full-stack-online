# Write a method, least_common_multiple, that takes in two numbers and returns the smallest number that is a mutiple
# of both of the given numbers
def least_common_multiple(num_1, num_2)
    start = num_1 > num_2 ? num_1 : num_2
    while true
        return start if start % num_1 == 0 && start % num_2 == 0
        start += 1
    end
end


# Write a method, most_frequent_bigram, that takes in a string and returns the two adjacent letters that appear the
# most in the string.
def most_frequent_bigram(str)
    count = 0
    bc = 0
    bigram = ""
    lbigram = ""
    (0...str.length - 1).each do |idx|
        bigram = str[idx..idx + 1]
        count = str.split(bigram).count - 1
        if count > bc
            bc = count
            lbigram = bigram
        end
    end
    lbigram
end


class Hash
    # Write a method, Hash#inverse, that returns a new hash where the key-value pairs are swapped
    def inverse
        newhash = {}
        self.each do |key, val|
            newhash[val] = key
        end
        newhash
    end
end


class Array
    # Write a method, Array#pair_sum_count, that takes in a target number returns the number of pairs of elements that sum to the given target
    def pair_sum_count(num)
        count = 0
        self.each.with_index do |num1, idx1|
            self.each.with_index do |num2, idx2|
                count += 1 if num1 + num2 == num && idx1 != idx2
            end
        end
        count / 2

    end

    # Write a method, Array#bubble_sort, that takes in an optional proc argument.
    # When given a proc, the method should sort the array according to the proc.
    # When no proc is given, the method should sort the array in increasing order.
    #
    # Sorting algorithms like bubble_sort, commonly accept a block. That block accepts
    # two parameters, which represents the two elements in the array being compared.
    # If the block returns 1, it means that the second element passed to the block
    # should go before the first (i.e. switch the elements). If the block returns -1,
    # it means the first element passed to the block should go before the second
    # (i.e. do not switch them). If the block returns 0 it implies that
    # it does not matter which element goes first (i.e. do nothing).
    #
    # This should remind you of the spaceship operator! Convenient :)
    def bubble_sort(&prc)
        prc ||= Proc.new { |n1, n2| n1 <=> n2}
        for i in (0...self.length) do 
            for j in (i...self.length) do 
                if prc.call(self[i],self[j]) == 1
                    temp = self[i]
                    self[i] = self[j]
                    self[j] = temp
                end
            end
        end
        self
    end
end
