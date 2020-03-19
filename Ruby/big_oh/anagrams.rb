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
