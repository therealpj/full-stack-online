require 'byebug'

def my_min_quadratic(list)
    
    list.each do |first|
        min = true
        list.each do |second|
            if second < first
                min = false
            end
        end
        return first if min
    end
end

# feel the pain of this quadratic algorithm
# p my_min_quadratic((1..10000).to_a.shuffle)

def my_min_linear(arr)
    min = arr[0]
    arr.each do |ele|
        if ele < min
            min = ele
        end
    end
    min
end

# a little better now.
# p my_min_linear((1..1000000).to_a.shuffle)


def find_max_sum(arrays)
    max = arrays[0].sum
    arrays.each do |arr|
        sum = arr.sum
        if sum > max
            max = sum
        end
    end
    max
end



def find_contiguous_sub_array(arr, len)
    sub_arrays = []
    while arr.length >= len
        sub_array = []
        len.times do |i|
            sub_array << arr[i]
        end
        arr.shift
        sub_arrays << sub_array
    end
    sub_arrays
end

# p find_contiguous_sub_array([1,2,3,4], 5)

def largest_contigous_sum(arr)
    length = arr.length
    max = arr[0]
    (1..length).each do |len|
        sub_arrays = find_contiguous_sub_array(arr.clone, len)
        arr_sum = find_max_sum(sub_arrays)
        if arr_sum > max
            max = arr_sum
        end    
    end
    max
end

# p largest_contigous_sum([2,3,-6,7,-6,7])


def largest_contigous_sum_linear(arr)
    largest = arr[0]
    cur = arr[0]
    (1...arr.length).each do |i|
        cur = 0 if cur <= 0
        cur += arr[i]
        largest = cur if largest < cur
    end
    largest
end

p largest_contigous_sum_linear([1,2,-3, 2, 1].to_a.shuffle)