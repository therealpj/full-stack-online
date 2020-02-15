# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.

def largest_prime_factor(num)
    pf = num  / 2
    while pf != 1
        if prime?(pf)
            if num % pf == 0
                return pf
            end
        end
        pf -=1 
    end 
    num
end

def prime?(num)
    return false if num < 2

    (2...num).each do |factor|
        if num % factor == 0
            return false
        end
    end
    return true
end


def unique_chars?(string)
    arr = []
    string.each_char do |char|
        if arr.include?(char)
            return false
        end
        arr << char
    end
    return true
end

def dupe_indices(array)

    dupes = Hash.new { |h, ele| h[ele] = [] }
    (0..(array.length / 2)).each do |idx1|
        (idx1+1..(array.length-1)).each do |idx2|
            if array[idx1] == array[idx2]
                if !dupes[array[idx1]].include?(idx1)
                    dupes[array[idx1]] << idx1
                end
                if !dupes[array[idx2]].include?(idx2)
                    dupes[array[idx1]] << idx2
                end
            end

        end
    end
    dupes
end


def ana_array (arr1, arr2)
    return false if arr1.length != arr2.length
    hash1 = count(arr1)
    hash2 = count (arr2)
    hash1 == hash2
    
end


def count(array)
    hash = Hash.new(0)
    
    array.each do |ele|
        hash[ele] += 1
    end

    hash
end

        