# PHASE 1

def strange_sums(arr)
    count = 0
    (0...arr.length).each do |idx1|
        (idx1...arr.length).each do |idx2|
            count += 1 if arr[idx1] + arr[idx2] == 0
        end
    end
    count
end

# p strange_sums([2, -3, 3, 4, -2])     # 2
# p strange_sums([42, 3, -1, -42])      # 1
# p strange_sums([-5, 5])               # 1
# p strange_sums([19, 6, -3, -20])      # 0
# p strange_sums([9])                   # 0

def pair_product(arr, prod)
    (arr.permutation(2)).select {|arr| arr[0] * arr[1] == prod}.length > 1
end

# p pair_product([4, 2, 5, 8], 16)    # true
# p pair_product([8, 1, 9, 3], 8)     # true
# p pair_product([3, 4], 12)          # true
# p pair_product([3, 4, 6, 2, 5], 12) # true
# p pair_product([4, 2, 5, 7], 16)    # false
# p pair_product([8, 4, 9, 3], 8)     # false
# p pair_product([3], 12)             # false


def rampant_repeats(string, hash)
    newstr = ""
    string.each_char do |char|
        chars = hash[char] || 1
        newstr += char * chars
    end
    newstr
end
# p rampant_repeats('taco', {'a'=>3, 'c'=>2})             # 'taaacco'
# p rampant_repeats('feverish', {'e'=>2, 'f'=>4, 's'=>3}) # 'ffffeeveerisssh'
# p rampant_repeats('misispi', {'s'=>2, 'p'=>2})          # 'mississppi'
# p rampant_repeats('faarm', {'e'=>3, 'a'=>2})            # 'faaaarm'

def perfect_square(num)
    return true if num == 1
    (2..num/2).each do |ele|
       return true if ele * ele == num
    end
    return false
end

# p perfect_square(1)     # true
# p perfect_square(4)     # true
# p perfect_square(64)    # true
# p perfect_square(100)   # true
# p perfect_square(169)   # true
# p perfect_square(2)     # false
# p perfect_square(40)    # false
# p perfect_square(32)    # false
# p perfect_square(50)    # false


# PHASE 2

def anti_prime?(num)
    divisors = []
    (2..num - 1).each do |n|
        divisors << divisors(n)
    end
    return divisors.all? {|arr| arr.length < divisors(num).length}

end

def divisors(n)
    div = []
    (2..n/2).each do |ele|
        if n % ele == 0
            div << ele
        end
    end
    div
end

# p anti_prime?(24)   # true
# p anti_prime?(36)   # true
# p anti_prime?(48)   # true
# p anti_prime?(360)  # true
# p anti_prime?(1260) # true
# p anti_prime?(27)   # false
# p anti_prime?(5)    # false
# p anti_prime?(100)  # false
# p anti_prime?(136)  # false
# p anti_prime?(1024) # false

def tribonacci_number(n)
    if n == 1 || n == 2
        return 1
    elsif n == 3
        return 2
    end
    return tribonacci_number(n-1) + tribonacci_number(n-2) + tribonacci_number(n-3)
end
    
# p tribonacci_number(1)  # 1
# p tribonacci_number(2)  # 1
# p tribonacci_number(3)  # 2
# p tribonacci_number(4)  # 4
# p tribonacci_number(5)  # 7
# p tribonacci_number(6)  # 13
# p tribonacci_number(7)  # 24
# p tribonacci_number(11) # 274

# PHASE 3

def matrix_addition_reloaded(*matrices)
    matrix = matrices.first
    row = matrix.length
    col = matrix[0].length

    summat = Array.new(row) {[0] * col}
    matrices.inject(summat) do |m1, m2|
        return nil if m2.length != row || m2[0].length != col
        matrix_addition(m1, m2)
    end 
end

def matrix_addition(m1, m2)
    height = m1.length
    width = m1[0].length
    sum = Array.new(height) {[0] * width}

    (0...height).each do |row|
        (0...width).each do |col|
            sum[row][col] = m1[row][col] + m2[row][col]
        end
    end
    sum
end
matrix_a = [[2,5], [4,7]]
matrix_b = [[9,1], [3,0]]
matrix_c = [[-1,0], [0,-1]]
matrix_d = [[2, -5], [7, 10], [0, 1]]
matrix_e = [[0 , 0], [12, 4], [6,  3]]

# p matrix_addition_reloaded(matrix_a, matrix_b)              # [[11, 6], [7, 7]]
# p matrix_addition_reloaded(matrix_a, matrix_b, matrix_c)    # [[10, 6], [7, 6]]
# p matrix_addition_reloaded(matrix_e)                        # [[0, 0], [12, 4], [6, 3]]
# p matrix_addition_reloaded(matrix_d, matrix_e)              # [[2, -5], [19, 14], [6, 4]]
# p matrix_addition_reloaded(matrix_a, matrix_b, matrix_e)    # nil
# p matrix_addition_reloaded(matrix_d, matrix_e, matrix_c)    # nil

def squarocol?(matrix)
    checkrow(matrix.transpose) || checkrow(matrix)
end

def checkrow(matrix)
    (0...matrix.length).each do |row|
        if matrix[row].uniq.size <= 1
            return true
        end
    end    
    return false
end




# p squarocol?([
#     [:a, :x , :d],
#     [:b, :x , :e],
#     [:c, :x , :f],
# ]) # true

# p squarocol?([
#     [:x, :y, :x],
#     [:x, :z, :x],
#     [:o, :o, :o],
# ]) # true

# p squarocol?([
#     [:o, :x , :o],
#     [:x, :o , :x],
#     [:o, :x , :o],
# ]) # false

# p squarocol?([
#     [1, 2, 2, 7],
#     [1, 6, 6, 7],
#     [0, 5, 2, 7],
#     [4, 2, 9, 7],
# ]) # true

# p squarocol?([
#     [1, 2, 2, 7],
#     [1, 6, 6, 0],
#     [0, 5, 2, 7],
#     [4, 2, 9, 7],
# ]) # false


def pascals_triangle(levels)
    tri = [[1], [1, 1]]
    return [[1]] if levels == 1 
    i = -1
    (2...levels).each do |level|
        row = []
        (0..level).each do |ele|

            if i < 0 
                ele1 = 0
            else
                ele1 = tri[level-1][i]
            end

            ele = ele1 + (tri[level-1][i + 1] || 0)
            row << ele
            i += 1
        end
        i = -1
        tri << row
    end
    tri

end

# p pascals_triangle(5)



# PHASE 4

def mersenne_prime(n)
    count = 0
    num = 0
    while count != n
        num += 1
        if prime?(num) && check_mersenne_prime(num)
            count += 1
        end
    end
    return num
end

def prime?(num)
    return false if num < 2
    (2..num/2).each do |ele|
        return false if num % ele == 0
    end
    return true
end


def check_mersenne_prime(num)
    twopower = 1
    while twopower  <= num + 1
        return true if twopower - 1 == num
        twopower *= 2
    end
    return false
end


# p mersenne_prime(1) # 3
# p mersenne_prime(2) # 7
# p mersenne_prime(3) # 31
# p mersenne_prime(4) # 127
# p mersenne_prime(6) # 131071 ### takes some time


def check_triangular_number(num)
    i = 1
    check = 0
    while num > check
        check =  (i * (i+1) ) / 2
        return true if check == num
        i += 1
    end
    return false
end

def triangular_word?(word)
    alphabet = ("a".."z").to_a
    code = 0
    word.each_char do |char|
        valueofchar = alphabet.index(char) + 1
        code += valueofchar
    end
    return check_triangular_number(code)
end

# p triangular_word?('abc')       # true
# p triangular_word?('ba')        # true
# p triangular_word?('lovely')    # true
# p triangular_word?('question')  # true
# p triangular_word?('aa')        # false
# p triangular_word?('cd')        # false
# p triangular_word?('cat')       # false
# p triangular_word?('sink')      # false

def consecutive_collapse(arr)
    collapsed = false
    while !collapsed
        collapsed = true
        arr.each.with_index do |ele, idx|
            if consecutive_num(ele, arr[idx + 1])
                arr.delete_at(idx)
                arr.delete_at(idx)
                collapsed = false
            end
        end
    end
    arr
end

def consecutive_num(num1, num2)
    return (num1 + 1) == num2 || (num1 - 1) == num2
end


# p consecutive_collapse([3, 4, 1])                     # [1]
# p consecutive_collapse([1, 4, 3, 7])                  # [1, 7]
# p consecutive_collapse([9, 8, 2])                     # [2]
# p consecutive_collapse([9, 8, 4, 5, 6])               # [6]
# p consecutive_collapse([1, 9, 8, 6, 4, 5, 7, 9, 2])   # [1, 9, 2]
# p consecutive_collapse([3, 5, 6, 2, 1])               # [1]
# p consecutive_collapse([5, 7, 9, 9])                  # [5, 7, 9, 9]
# p consecutive_collapse([13, 11, 12, 12])              # []




def pretentious_primes(arr, n)
    arr.each.with_index do |ele, idx|
        crement = n > 0 ? 1 : -1
        arr[idx] = find_prime(ele, n.abs, crement)
    end
    arr
end

def find_prime(num, nth, crement)

    return nil if num <= 2 && crement == -1 # because 2 is the smallest prime

    check = num + crement
    nth.times do 
        while !prime?(check)
            check += crement
        end
        return nil if check <= 2 && crement == -1
        check += crement
    end
    check -= crement
end

# p find_prime(12, 1, 1)
# p find_prime(12, 1, -1)
# p find_prime(12, 2, -1)
# p find_prime(12, 2, 1)

# p pretentious_primes([4, 15, 7], 1)           # [5, 17, 11]
# p pretentious_primes([4, 15, 7], 2)           # [7, 19, 13]
# p pretentious_primes([12, 11, 14, 15, 7], 1)  # [13, 13, 17, 17, 11]
# p pretentious_primes([12, 11, 14, 15, 7], 3)  # [19, 19, 23, 23, 17]
# p pretentious_primes([4, 15, 7], -1)          # [3, 13, 5]
# p pretentious_primes([4, 15, 7], -2)          # [2, 11, 3]
# p pretentious_primes([2, 11, 21], -1)         # [nil, 7, 19]
# p pretentious_primes([32, 5, 11], -3)         # [23, nil, 3]
# p pretentious_primes([32, 5, 11], -4)         # [19, nil, 2]
# p pretentious_primes([32, 5, 11], -5)         # [17, nil, nil]