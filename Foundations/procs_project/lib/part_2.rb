def reverser(string, &prc)
    prc.call(string.reverse)
end

def word_changer(sent, &prc)
    arr = sent.split(" ")
    newsent = []
    arr.each do |word|
        newsent << prc.call(word)
    end
    newsent.join(" ")
end

def greater_proc_value(num, proc1, proc2)
    proc1.call(num) > proc2.call(num)? proc1.call(num) : proc2.call(num)
end

def and_selector(array, proc1, proc2)
    newarr = []
    array.each do |ele|
        if proc1.call(ele) && proc2.call(ele)
            newarr << ele
        end
    end
    newarr
end

def alternating_mapper(array, proc1, proc2)
    newarr = []
    array.each.with_index do |ele, index|
        if index % 2 == 0
            newarr << proc1.call(ele)
        else
            newarr << proc2.call(ele)
        end
    end
    newarr
end
