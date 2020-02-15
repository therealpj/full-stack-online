def palindrome?(str)
    palin = ""
    (0...str.length).each do |idx|
        palin += str[str.length - idx.to_i- 1]
    end
    palin == str
end


def substrings(str)
    ss = []
    start = 0
    (0..str.length-1).each do |idx1|
        (0..str.length-1).each do |idx2|
            if str[idx1.to_i..idx2.to_i] == ""
                next
            else
                ss << str[idx1.to_i..idx2.to_i]
            end
        end
    end
    ss
end

def palindrome_substrings(str)
    ss = substrings(str)
    pss = []
    ss.each do |word|
        if word.length > 1 && palindrome?(word)
            pss << word
        end
    end
    pss
end

