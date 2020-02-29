require 'byebug'
def range(start, fin)   
    return [] if start >= fin
    if start == fin - 1
        return [start]
    end

    return [start] + range(start+1, fin)
end
    

def sum_array_recur(arr)
    return nil if arr.length == 0
    return arr[0] if arr.length == 1
    arr[0] + sum_array_recur(arr[1..-1])
end

def sum_array_iter(arr)
    return nil if arr.length == 0
    sum = 0
    arr.each do |ele|
        sum += ele
    end
    sum
end

# p sum_array_iter([])
# p sum_array_recur([])

# p sum_array_recur((0..100).to_a)
# p sum_array_recur((0..100).to_a)

def exp1(b, n)
    return 1 if n == 0
    return b if n == 1
    b * exp1(b, n - 1)
end

def exp2(b, n)
    return 1 if n == 0
    return b if n == 1
    if n % 2 == 0
        exp2(b, n / 2) ** 2
    else
        (b * exp2(b, (n - 1) / 2) ** 2)
    end
end

# p exp1(10, 11)
# p exp1(10, 2)

# p exp2(10, 11)
# p exp2(10, 2)

def deep_dup(arr)
    newarr = Array.new

    arr.each do |ele|
        if ele.is_a?(Array)
            newarr << deep_dup(ele)
        else
            newarr << ele
        end
    end
    newarr
end


# robot_parts = [
#   ["nuts", "bolts", "washers"],
#   ["capacitors", "resistors", "inductors"]
# ]

# deep_arr = [1, [2], [3, [4]]]

# copy1 = deep_dup(robot_parts)
# copy2 = deep_dup(deep_arr)
# p copy1
# p copy2


def recur_fib(n)
    if n == 1
        return [1]
    end
    recur_fib(n-1) + [fib(n)] 
end

def fib(n)
    if n == 1
        return 1
    elsif n == 2
        return 1
    else
        return fib(n-1) + fib(n - 2)
    end
end

def iter_fib(n)
    if n == 1
        return [1]
    elsif n == 2
        return [1,1]
    end
    arr = [1,1]
    (2...n).each do |idx|
        arr << arr[idx - 1] + arr[idx - 2]
    end
    arr
end

# p recur_fib(10)
# p iter_fib(10)

def binary_search(arr, target)
    # debugger
    if arr.length == 1
        if arr[0] == target
            return 1
        else
            return nil
        end
    end

    mid = arr.length / 2
    n = arr.length
    if target == arr[mid]
        return mid
    elsif target > arr[mid]
        idx = binary_search(arr[mid..-1], target)
        return nil if idx == nil
        return n / 2 + idx
    else
        idx =   binary_search(arr[0...mid], target)
        return nil if idx == nil
        return n / 2 - idx
    end

end


# p binary_search([1, 2, 3], 1) # => 0
# p binary_search([2, 3, 4, 5], 3) # => 1
# p binary_search([2, 4, 6, 8, 10], 6) # => 2
# p binary_search([1, 3, 4, 5, 9], 5) # => 3
# p binary_search([1, 2, 3, 4, 5, 6], 6) # => 5
# p binary_search([1, 2, 3, 4, 5, 6], 0) # => nil
# p binary_search([1, 2, 3, 4, 5, 7], 6) # => nil

def merge_sort(arr)
    if arr.length == 1
        return arr
    elsif arr.length == 0
        return []
    end

    n = arr.length
    mid = n / 2

    left = merge_sort(arr[0...mid])
    right = merge_sort(arr[mid..-1])
    sorted = merge(left, right)
    return sorted
end

def merge(left, right)
    i = 0
    j = 0
    sorted = []
    while i < left.length && j < right.length
        if left[i] < right[j]
            sorted << left[i]
            i += 1
        else
            sorted << right[j]
            j += 1
        end
    end

    while i < left.length
        sorted << left[i]
        i += 1
    end
    

    while j < right.length
        sorted << right[j]
        j += 1
    end
    return sorted
end


#  p merge([1,2,3,4,5], [4,5,6])

#  a = (0..100).to_a.shuffle
# p merge_sort(a)

def subsets(arr)
    if arr.length == 1
        return [arr, []]
    elsif arr.length == 0
        return [[]]
    end

    without_last = subsets(arr[0...-1])
    with_last = deep_dup(without_last)

    with_last.each do |sub|
        sub << arr[-1]
    end
    (without_last + with_last).sort

end

# p subsets([]) # => [[]]
# p subsets([1]) # => [[], [1]]
# p subsets([1, 2]) # => [[], [1], [2], [1, 2]]
# p subsets([1, 2, 3])
# # => [[], [1], [2], [1, 2], [3], [1, 3], [2, 3], [1, 2, 3]]

def permutations(arr)
    if arr.length == 1
        return [arr]
    end
    first = arr.shift
    rest_perm = permutations(arr)
    perms = []   
    rest_perm.each do |perm|
        (0..perm.length).each do |i|
            perms << perm[0...i] + [first] +  perm[i..-1] 
        end
    end
    perms
end

# [1,2] => [[1,2], [2, 1]]
# [1,2,3] => [ [1,2,3], [1,3,2]...]
# p permutations([1,2,3])

    def make_change(amount, coins=[25,10,5,1])
    if amount == 0
        return [0]
    elsif amount == 1
        return [1]
    end
    
    total_coins = []
    
    biggest = coins.sort {|a, b| b <=> a}.select {|coin| amount >= coin}[0]
    total_coins << biggest

    total_coins +=  make_change(amount- biggest, coins)
    total_coins.pop if total_coins[-1] == 0
    total_coins

end

