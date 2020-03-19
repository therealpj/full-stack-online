def windowed_max_range(arr, window)
    current_max_range = 0
    start = 0
    while start < arr.length - window + 1
        sub_arr = arr.slice(start...start+window)
        min = sub_arr.min
        max = sub_arr.max
        # print sub_arr
        current_max_range = max - min if current_max_range < max - min
        start += 1
    end
    current_max_range
end

# p windowed_max_range([1, 0, 2, 5, 4, 8], 2)  == 4
# p windowed_max_range([1, 0, 2, 5, 4, 8], 3) == 5  # 0, 2, 5
# p windowed_max_range([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
# p windowed_max_range([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8

