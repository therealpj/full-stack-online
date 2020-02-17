def my_reject(arry, &prc)
    newarr = []
    arry.each do |ele|
        if !prc.call(ele)
            newarr << ele
        end
    end
    newarr
end


def my_one?(array, &prc)
    count = 0
    array.each do |ele|
        if prc.call(ele)
            count += 1
            return false if count > 1
        end
    end
    if count == 1
        return true
    else
        return false
    end
end

def hash_select(hash, &prc)
    hashn = {}
    hash.each do |key, val|
        if prc.call(key, val)
            hashn[key] = val
        end
    end
    hashn
end

def xor_select(array, prc1, prc2)
    newarr = []
    array.each do |ele|
        newarr << ele if (!prc1.call(ele) && prc2.call(ele)) || (prc1.call(ele) && !prc2.call(ele))
    end
    newarr
end

def proc_count(val, arr)
    count = 0
    arr.each do |prc|
        count += 1 if prc.call(val)
    end
    count
end

