def zip(*arrays)
    length = arrays.first.length

    (0...length).map do |i|
        arrays.map { |array| array[i] }
    end
end



def prizz_proc(arr, prc1, prc2)
    new = []
    arr.each do |ele|
        new << ele if (prc1.call(ele) && !prc2.call(ele)) || (!prc1.call(ele) && prc2.call(ele))
    end
    new
end

def zany_zip(*arrays)
    length = arrays.map(&:length).max
    newtwod = Array.new(length) {Array.new(length, default = nil)}

   (0...length).map do |i|
        arrays.map { |array| array[i] }
    end
end


def maximum(array, &prc)
    res = 0
    mele = 0
    return nil if array.length == 0
    array.each do |ele|
        cur = prc.call(ele)
        if res <= cur
            res = cur
            mele = ele
        end
    end
    mele
end

def my_group_by(arr, &prc)
    hash = Hash.new {|h, k| h[k] = []}
    arr.each do |ele|
        hash[prc.call(ele)] << ele
    end
    hash
end

def max_tie_breaker(arr, prc1, &prc2)
    lele = 0
    lres = 0
        return nil if arr == []
    arr.each do |ele|
        if lres < prc2.call(ele)
            lres = prc2.call(ele)
            lele = ele
        elsif lres == prc2.call(ele)
            if lres < prc1.call(ele)
                lres = prc1.call(ele)
                lele = ele
            end
        end
    end

    lele
end

def silly_syllables(sent)
    arr = sent.split(" ")
    newsent = []
    arr.each do |word|
        vowels = word.split("").each_index.select {|letter| "aeiou".include?(word[letter])}
        if vowels.length < 2
            newsent << word
        else
            newsent << word[vowels[0]..vowels[-1]]
        end
    end
    newsent.join(" ")
end


