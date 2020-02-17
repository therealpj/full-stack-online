def element_count(arr)
    hash = Hash.new(0)
    arr.each {|char| hash[char] += 1}
    hash
end

def char_replace!(string, hash)
    string.each_char.with_index do |ele, idx|
        string[idx] = hash[ele] || ele
    end
    string
end

def product_inject(array)
    array.inject(1) {|acc, ele| acc * ele}
end
