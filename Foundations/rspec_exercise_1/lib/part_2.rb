

def hipsterfy(word)
    vowel = false
    vidx = 0

    word.each_char.with_index do |char, idx|
        if "aeiou".include?(char)
            vidx = idx
            vowel = true
        end
    end
    if vowel
        word[vidx] = ""
    end
    word

end

def vowel_counts(str)
    hash = {}
    vowels = "aeiou"
    str.downcase!
    str.each_char do |char|
        if vowels.include?(char)
            if hash.has_key?(char)
                hash[char] += 1
            else
                hash[char] = 1
            end
        end
    end

    hash

end

def caesar_cipher(msg, n)
    alphabet = "abcdefghijklmnopqrstuvwxyz"
    cipher = ""
    msg.each_char.with_index do |char, idx|
        if alphabet.include?(char)
            cipher += alphabet[(alphabet.index(char) + n)  % 26]
        else
            cipher += char
        end
    end
    cipher
end