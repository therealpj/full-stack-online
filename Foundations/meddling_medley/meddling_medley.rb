# PHASE 1

def duos(string)
    count = 0
    string.each_char.with_index do |ele, idx|
        count += 1 if ele == string[idx+1]
    end
    count
end

# p duos('bootcamp')      # 1
# p duos('wxxyzz')        # 2
# p duos('hoooraay')      # 3
# p duos('dinosaurs')     # 0
# p duos('e')             # 0

def sentence_swap(sent, hash)
    newsent = []
    sent.split(" ").each do |word|
        if hash[word]
            newsent << hash[word]
        else
            newsent << word
        end
    end
    newsent.join(" ")
end


# p sentence_swap('anything you can do I can do',
#     'anything'=>'nothing', 'do'=>'drink', 'can'=>'shall'
# ) # 'nothing you shall drink I shall drink'

# p sentence_swap('what a sad ad',
#     'cat'=>'dog', 'sad'=>'happy', 'what'=>'make'
# ) # 'make a happy ad'

# p sentence_swap('keep coding okay',
#     'coding'=>'running', 'kay'=>'pen'
# ) # 'keep running okay'

def hash_mapped(hash, prc1, &prc2)
    newhash = {}
    hash.each do |key, val|
        newhash[prc2.call(key)] = prc1.call(val)
    end
    newhash
end

# double = Proc.new { |n| n * 2 }
# p hash_mapped({'a'=>4, 'x'=>7, 'c'=>-3}, double) { |k| k.upcase + '!!' }
# # {"A!!"=>8, "X!!"=>14, "C!!"=>-6}

# first = Proc.new { |a| a[0] }
# p hash_mapped({-5=>['q', 'r', 's'], 6=>['w', 'x']}, first) { |n| n * n }
# # {25=>"q", 36=>"w"}

def counted_characters(string)
    hash = Hash.new(0)
    string.each_char {|char| hash[char] += 1}
    hash.select {|key, val| val > 2}.keys
end

# p counted_characters("that's alright folks") # ["t"]
# p counted_characters("mississippi") # ["i", "s"]
# p counted_characters("hot potato soup please") # ["o", "t", " ", "p"]
# p counted_characters("runtime") # []

def triplet_true(string)
    (0..string.length-3).each do |idx|
        substring = string[idx..idx+2]
        return true if substring.count(string[idx]) == 3
    end
    return false
end

# p triplet_true('caaabb')        # true
# p triplet_true('terrrrrible')   # true
# p triplet_true('runninggg')     # true
# p triplet_true('bootcamp')      # false
# p triplet_true('e')             # false

def energetic_encoding(string, hash)
    newstr = ""
    string.each_char do |char|
        if hash[char]
            newstr += hash[char]
        elsif char == " "
            newstr += " "
        else
            newstr += "?"
        end
    end
    newstr
end

# p energetic_encoding('sent sea',
#     'e'=>'i', 's'=>'z', 'n'=>'m', 't'=>'p', 'a'=>'u'
# ) # 'zimp ziu'

# p energetic_encoding('cat',
#     'a'=>'o', 'c'=>'k'
# ) # 'ko?'

# p energetic_encoding('hello world',
#     'o'=>'i', 'l'=>'r', 'e'=>'a'
# ) # '?arri ?i?r?'

# p energetic_encoding('bike', {}) # '????'

def uncompress(string)
    newstr = ""
    i = 0
    while i != string.length
        newstr += string[i] * string[i+1].to_i
        i += 2
    end
    newstr
end

# p uncompress('a2b4c1') # 'aabbbbc'
# p uncompress('b1o2t1') # 'boot'
# p uncompress('x3y1x2z4') # 'xxxyxxzzz

# PHASE 2

def conjunct_select(arr, *prcs)
    newarr = []
    put = true
    arr.each do |ele|
        prcs.each do |prc|
            put = false if !prc.call(ele)
        end
        newarr << ele if put
        put = true
    end
    newarr
end

# is_positive = Proc.new { |n| n > 0 }
# is_odd = Proc.new { |n| n.odd? }
# less_than_ten = Proc.new { |n| n < 10 }

# p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive) # [4, 8, 11, 7, 13]
# p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive, is_odd) # [11, 7, 13]
# p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive, is_odd, less_than_ten) # [7]

def convert_pig_latin(sent)
    newsent = []
    sent.split(" ").each do |word|
        if word.length < 3
            newsent << word
        else
            if "aeiou".include?(word[0].downcase)
                newsent << (word + 'yay')
            else
                vidx = find_vowel(word)
                newsent << word[vidx...word.length] + word[0...vidx] + 'ay'
            end
        end
    end
    newsent = newsent.join(" ")
    newsent[0] = newsent[0].upcase
    newsent
end

def find_vowel(word)
    word.each_char.with_index do |char, idx|
        return idx if "aeiou".include?(char.downcase)
    end
    0
end

# p convert_pig_latin('We like to eat bananas') # "We ikelay to eatyay ananasbay"
# p convert_pig_latin('I cannot find the trash') # "I annotcay indfay ethay ashtray"
# p convert_pig_latin('What an interesting problem') # "Atwhay an interestingyay oblempray"
# p convert_pig_latin('Her family flew to France') # "Erhay amilyfay ewflay to Ancefray"
# p convert_pig_latin('Our family flew to France') # "Ouryay amilyfay ewflay to Ancefray"

def reverberate(sent)
    newsent = []
    sent.split(" ").each do |word|
        if word.length < 3
            newsent << word
        else
            if "aeiou".include?(word[-1].downcase)
                newsent << word + word
            else
                vidx = word.length - find_vowel(word.reverse)
                newsent << word + word[vidx-1..-1]
            end
        end
    end
    newsent.join(" ")
end

# p reverberate('We like to go running fast') # "We likelike to go runninging fastast"
# p reverberate('He cannot find the trash') # "He cannotot findind thethe trashash"
# p reverberate('Pasta is my favorite dish') # "Pastapasta is my favoritefavorite dishish"
# p reverberate('Her family flew to France') # "Herer familyily flewew to Francefrance"

def disjunct_select(arr, *prcs)
    put = false
    newarr = []
    arr.each do |ele|
        prcs.each do |prc|
            put = true if prc.call(ele)
        end
        newarr << ele if put
        put = false
    end
    newarr
end

# longer_four = Proc.new { |s| s.length > 4 }
# contains_o = Proc.new { |s| s.include?('o') }
# starts_a = Proc.new { |s| s[0] == 'a' }

# p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
#     longer_four,
# ) # ["apple", "teeming"]

# p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
#     longer_four,
#     contains_o
# ) # ["dog", "apple", "teeming", "boot"]

# p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
#     longer_four,
#     contains_o,
#     starts_a
# ) # ["ace", "dog", "apple", "teeming", "boot"]

def alternating_vowel(sent)
    newsent = []
    sent.split(" ").each.with_index do |word, idx|
        if idx % 2 == 0
            newsent << remove_ith_vowel(word, 1)
        else
            wordarr = word.split("")
            wordarr.delete_at(word.length - 1 -  find_vowel(word.reverse))
            newsent << wordarr.join("")
        end
    end
    newsent.join(" ")
end

def remove_ith_vowel(word, n)
    newword = ""
    word.each_char.with_index do |char, idx|
        if "aeiou".include?(char.downcase) && n == 1
            n -= 1
            next
        elsif "aeiou".include?(char.downcase)
            n -= 1
            newword += char
        else
            newword += char
        end
    end
    newword            
end


# p alternating_vowel('panthers are great animals') # "pnthers ar grat animls"
# p alternating_vowel('running panthers are epic') # "rnning panthrs re epc"
# p alternating_vowel('code properly please') # "cde proprly plase"
# p alternating_vowel('my forecast predicts rain today') # "my forecst prdicts ran tday"


def silly_talk(sent)
    newsent = []
    sent.split(" ").each do |word|
        if "aeiou".include?(word[-1].downcase)
            newsent << word + word[-1]
        else
            newsent << put_bvowel_after_vowels(word)
        end
    end
    newsent.join(" ")
end

def put_bvowel_after_vowels(word)
    newword = ""
    word.each_char do |char|
        if "aeiou".include?(char.downcase)
            newword += char + 'b' + char.downcase
        else
            newword += char
        end
    end
    newword
end

# p silly_talk('Kids like cats and dogs') # "Kibids likee cabats aband dobogs"
# p silly_talk('Stop that scooter') # "Stobop thabat scobooboteber"
# p silly_talk('They can code') # "Thebey caban codee"
# p silly_talk('He flew to Italy') # "Hee flebew too Ibitabaly"

def compress(string)
    count = 1
    newstr = ""
    idx = 0
    while idx < string.length
        char = string[idx]
        while char == string[idx + 1]
            count += 1
            idx += 1
        end
        newstr += char
        newstr += count.to_s if count != 1
        count = 1
        idx += 1
    end
    
    newstr

end


# p compress('aabbbbc')   # "a2b4c"
# p compress('boot')      # "bo2t"
# p compress('xxxyxxzzzz')# "x3yx2z4"