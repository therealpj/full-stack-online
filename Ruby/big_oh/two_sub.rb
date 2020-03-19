require 'byebug'
# brute force two sum.
# Why use a drawing hammer when use can use a sledge hammer?
# Time complexity: O(n^2)
def bad_two_sum?(arr, target)
    arr.each.with_index do |ele, idx|
        arr.each.with_index do |ele2, idx2|
            next if idx == idx2
            return true if ele + ele2 == target
        end
    end
    return false
end

# p bad_two_sum?([1,2,3,4,5], 7)
# p bad_two_sum?([1,2,3,4,5], 100)
# p bad_two_sum?([0, 1, 2, -1, -5, -7, 3], -2)


# Sorting two sum.
# When you need a little more grace than the sledge hammer.
# Time complexity: O(n log*n)
def okay_two_sum(arr, target)
    arr.sort!
    low, high = 0, arr.length - 1

    loop do
        mid =(low + high) / 2
        sum = arr[low] + arr[high]
        return true if sum == target
        
        #condition for breaking out
        return false if (high - low).abs == 1

        if sum > target
            high = mid
        else
            low = mid
        end
    end

end
