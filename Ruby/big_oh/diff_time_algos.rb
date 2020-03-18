

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
