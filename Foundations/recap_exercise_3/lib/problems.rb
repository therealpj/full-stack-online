def no_dupes?(arr)
    hash = Hash.new(0)
    arr.each {|ele| hash[ele] += 1}
    return hash.select {|k, v| v == 1}.keys 
end

def no_consecutive_repeats?(arr)
     arr.select.with_index {|ele, idx| ele == arr[idx + 1]}.length == 0
end

# p no_consecutive_repeats?(['cat', 'dog', 'mouse', 'dog'])     # => true
# p no_consecutive_repeats?(['cat', 'dog', 'dog', 'mouse'])     # => false
# p no_consecutive_repeats?([10, 42, 3, 7, 10, 3])              # => true
# p no_consecutive_repeats?([10, 42, 3, 3, 10, 3])              # => false
# p no_consecutive_repeats?(['x'])                              # => true

def char_indices(str)
    hash = Hash.new {|h, k| h[k] = []}
    str.each_char.with_index do |char, idx|
        hash[char] << idx
    end
    hash
end

# p char_indices('mississippi')   # => {"m"=>[0], "i"=>[1, 4, 7, 10], "s"=>[2, 3, 5, 6], "p"=>[8, 9]}
# p char_indices('classroom')     # => {"c"=>[0], "l"=>[1], "a"=>[2], "s"=>[3, 4], "r"=>[5], "o"=>[6, 7], "m"=>[8]}

def longest_streak(str)
    curr = ""
    longest = ""

    (0...str.length).each do |idx|
        if str[idx] == str[idx + 1] || idx == 0
            curr += str[idx]
        else
            curr = str[idx]
        end
        if longest.length < curr.length
            longest = curr
        end
    end
    longest
end


def bi_prime?(num)
    primef = []
    (3..num/2).each do |fact|
        if num % fact == 0 && prime?(fact)
            primef << fact
        end
    end
    p primef
    if primef.length == 1
        return primef[0] * primef[0] == num
    end

    return primef.length > 0
end

def prime?(num)
    return false if num < 2
    (2..num/2).each do |fact|
        if num % fact == 0
            return false
        end
    end
    return true
end

def vigenere_cipher(str, key)
    alphabet = ('a'..'z').to_a.join
    ciphertext = ""
    kidx = 0

    str.each_char do |char|
        current = alphabet.index(char)
        ciphertext += alphabet[(current + key[kidx].to_i) % 26]
        kidx += 1
        kidx = 0 if kidx == key.length
    end

    ciphertext
end

def vowel_rotate(str)
    newstr = ""
    vowels = "aeiou"
    
    vinstr = []
    str.each_char do |char|
        if vowels.include?(char)
            vinstr << char
        end
    end

    vidx = 0

    str.each_char do |char|
        if vowels.include?(char)
            newstr += vinstr[(vidx - 1) % vinstr.length] 
            vidx += 1
        else
            newstr += char
        end
    end

    newstr
end

class String

    def select(&prc)
        prc ||= Proc.new{}
        newstr = ""
        self.each_char do |char|
            newstr += char if prc.call(char)
        end
        newstr
    end

    def map!(&prc)
        self.each_char.with_index do |char, index|
            char = prc.call(char, index)
            self[index] = char
        end
        self
    end
end


def multiply(a, b)
    return a if b == 1
    a + multiply(a, b-1)
end

def lucas_sequence(len)
    return [] if len == 0
    return [2] if len == 1
    return [2 ,1] if len == 2

    seq = lucas_sequence(len-1)
    nex = seq[-1] + seq[-2]
    seq << nex
    seq
end

def prime_factorization(num)
    (2...num).each do |fact|
        if num % fact == 0
            of = num / fact
            return [*prime_factorization(fact) , *prime_factorization(of)]
        end
    end
    [num]
end

