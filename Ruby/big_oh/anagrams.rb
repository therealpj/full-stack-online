def first_anagram?(original, anagram)
    anagram_factorial(original).include?(anagram)
end

# recursive function to find anagrams of string
def anagram_factorial(string)
    string_arr = string.split("")
    
    # only one anagram exists if length of given string is less than 1
    return [string] if string.length <= 1
    all_anagrams = []

    # for each char we calculate the character + anagrams of rest of the string
    string_arr.each.with_index do |char, idx|

        # cloning the string, so as to not mutate the original array
        clone = string_arr.clone

        # the string without the current character
        clone.delete_at(idx)

        # anagrams of the rest of the string
        sub_anagrams = anagram_factorial(clone.join(""))
        
        # for each anagram, we prepend the current character at start.
        sub_anagrams.each do |sub|
            all_anagrams << char + sub
        end
    end
    all_anagrams
end


# p first_anagram?('octopus', 'octopus'.split("").shuffle.join(""))
# p first_anagram?('octopus', 'octopus'.split("").shuffle.join(""))
# p first_anagram?('octopus' ,'octopussy')


def second_anagram?(original, anagram)
    anagram_arr = anagram.split("")
    original.each_char.with_index do |char, idx|
        char_idx = anagram_arr.find_index(char)
        anagram_arr.delete_at(char_idx) if char_idx
    end
    return false unless anagram_arr == []
    return true
end

# p second_anagram?('octopus', 'octopus'.split("").shuffle.join(""))
# p second_anagram?('HelloFromTheOtherSide', 'AtleastICanSayThatITried')

def third_anagram?(original, anagram)
    return original.split("").sort == anagram.split("").sort
end

# p third_anagram?("abcdefghi", "ihgfedcba")


def fourth_anagram?(original, anagram)
    hash = Hash.new(0)
    original.each_char do |char|
        hash[char] += 1
    end

    anagram.each_char do |char|
        hash[char] -= 1
    end

    return false if hash.all? {|key, val| val!= 0}
    return true
end

# p fourth_anagram?('abcdefghijklmnop', 'ponmlkjihgfedcba')
# p second_anagram?('octopus', 'octopus'.split("").shuffle.join(""))
# p second_anagram?('HelloFromTheOtherSide', 'AtleastICanSayThatITried')








