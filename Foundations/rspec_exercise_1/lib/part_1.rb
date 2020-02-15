

def average(n1, n2)
    return (n1 + n2) / 2.0
end

def average_array(arr)
    (arr.inject(0) {|acc, ele| acc + ele}) / (arr.length).to_f
end

def repeat(str, n)
    str * n
end

def yell(str)
    str.upcase + "!"
end

def alternating_case(str)
    arr = str.split(" ")
    arr.each.with_index do |word, i|
        if i % 2 == 0
            arr[i].upcase!
        else
            arr[i].downcase!
        end
    end
    arr.join(" ")
end
    
