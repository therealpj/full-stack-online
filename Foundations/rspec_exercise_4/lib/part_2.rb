def proper_factors(num)
    arr  = []
    (1..num/2).each do |fact|
        if num % fact == 0
            arr << fact
        end
    end
    arr
end

def aliquot_sum(num)
    proper_factors(num).sum
end

def perfect_number?(num)
    num == aliquot_sum(num)
end

def ideal_numbers(n)
    count = 0
    num = 1
    arr = []
    while count != n
        if perfect_number?(num)
            count += 1
            arr << num
        end
        num += 1
    end
    arr
end
