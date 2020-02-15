def my_map(array, &prc)
    new_arr = []
    array.each do |ele|
        new_arr << prc.call(ele)
    end
    new_arr
end

def my_select(array, &prc)
    new_arr = []
    array.each do |ele|
        if prc.call(ele)
            new_arr << ele
        end
    end
    new_arr
end

def my_count(array, &prc)
    my_select(array, &prc).length
end

def my_any?(array, &prc)
    array.each do |ele|
        if prc.call(ele)
            return true
        end
    end
    return false
end

def my_all?(array, &prc)
    array.each do |ele|
        if !prc.call(ele)
            return false
        end
    end
    return true
end

def my_none?(array, &prc)
    array.each do |ele|
        if prc.call(ele)
            return false
        end
    end
    return true
end