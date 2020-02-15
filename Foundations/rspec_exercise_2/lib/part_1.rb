def partition(arr, n)
    twod = [[], []]
    arr.each do |ele|
        if ele < n
            twod[0] << ele
        else
            twod[1] << ele
        end
    end
    twod

end

def merge(hash1, hash2)
    hash = {}
    hash1.each do |key, val|
        hash[key] = val
    end
    hash2.each do |key, val|
        hash[key] = val
    end
    hash
end

def censor(sent, arr)
    sarr = sent.split(" ")
    sarr.each do |word|
        arr.each do |cuss|
            if word.downcase == cuss.downcase
                word.each_char.with_index do |char, index|
                    if "aeiou".include?(char.downcase)
                        word[index] = "*"
                    end
                end
            end
        end
    end
    sarr.join(" ")
end


def power_of_two?(num)
    check = 1
    while num >= check
        if num == check
            return true
        end
        check *= 2
    end
    return false

end

