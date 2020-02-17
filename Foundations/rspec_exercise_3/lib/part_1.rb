def is_prime?(num)
    return false if num < 2 

    (2..num/2).each do |fact|
        return false if num % fact == 0
    end
    
    return true
end

def nth_prime(num)
    curr = 1
    while num != 0
        if is_prime?(curr)
            prime = curr
            num -= 1
        end
        curr += 1
    end
    prime
end



def prime_range(min, max)
    arr = []
    (min..max).each do |fact|
        if is_prime?(fact)
            arr << fact
        end
    end
    return arr
end
