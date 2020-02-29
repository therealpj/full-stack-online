#Problem 1: 

def sum_recur(array)
    if array.length == 0
        return nil
    elsif array.length == 1
        return array[0]
    end
    return array[0] + sum_recur(array[1..-1])
end

# p sum_recur([1,2,3,4,5])

#Problem 2: 

def includes?(array, target)
    if array.length == 0
    return nil
    elsif array.length == 1
        return array[0] == target
    end

    array[0] == target || includes?(array[1..-1], target)
end

# p includes?([1,2,3,4,5], 5)
#  p includes?([1,2,3,4], 5)

# Problem 3: 

def num_occur(array, target)
    if array.length == 0
        return  0
    elsif array.length == 1 && array[0] == target
        return 1
    end

    if array[0] == target
        return 1 + num_occur(array[1..-1], target)
    else
        return 0 + num_occur(array[1..-1], target)
    end
end

# p num_occur([1,2,3,4,4,4,4], 4)
# p num_occur([1,2,3,4,4,4,4], 5)

# Problem 4: 

def add_to_twelve?(array)
    if array.length == 2
        return array.sum == 12
    elsif array.length <= 1
        return false
    else
        array[0] + array[1] == 12 || add_to_twelve?(array[1..-1]) 
    end
end

# p add_to_twelve?([10,2,1,3,4,5,6])
# p add_to_twelve?([1,2,3,4,5])
# p add_to_twelve?([1,2,3,3,4,54,12,0])
# Problem 5: 

def sorted?(array)
    if array.length == 2 
        array[0] < array[1]
    else
        array[0] <= array[1] && sorted?(array[1..-1])
    end
end

# p sorted?([1,2,3,4,5])
# p sorted?([5,4,3,1])


# Problem 6: 

def reverse(string)
    return string if string.length <= 1
    reversed = ""
    reversed += string[-1] + reverse(string[0...-1])
end


# p reverse("hello")
# p reverse("racecar")