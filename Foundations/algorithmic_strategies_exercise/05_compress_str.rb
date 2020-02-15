# Write a method, compress_str(str), that accepts a string as an arg.
# The method should return a new str where streaks of consecutive characters are compressed.
# For example "aaabbc" is compressed to "3a2bc".

def compress_str(str)
    count = 1
    newstr = ''
    idx = 0

    while idx < str.length
        char = str[idx]

        if char == str[idx + 1]

            while char == str[idx + 1]
                count += 1
                idx += 1
            end
            
            newstr = newstr + count.to_s + char
            count = 1

        else
            newstr += char
        end
        idx += 1
    end

    return newstr

end

p compress_str("aaabbc")        # => "3a2bc"
p compress_str("xxyyyyzz")      # => "2x4y2z"
p compress_str("qqqqq")         # => "5q"
p compress_str("mississippi")   # => "mi2si2si2pi"
