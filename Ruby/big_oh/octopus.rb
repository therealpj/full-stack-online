def biggest_fish_quadatic(fishes)
    
    fishes.each do |fish|
        max = true
        fishes.each do |another_fish|
            if another_fish.length > fish.length
                max = false
            end
        end
        return fish if max
    end
end

# p biggest_fish_n_square(['f', 'ff', 'ffff'])

def biggest_fish_linearithmic(fishes)
    fishes.sort
    return fishes[-1]
end

# p biggest_fish_linearithmic(['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh'])


def biggest_fish_linear(fishes)
    biggest = fishes[0]
    fishes.each do |fish|
        biggest = fish if  biggest.length < fish.length
    end
    biggest
end

# p biggest_fish_linear(['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh'])


def dance_slow(move, tiles_array)
    tiles_array.each.with_index do |move_type, pos|
        return pos if move_type == move
    end
    return -1
end

def dance_fast(move, tiles_hash)
    tiles_hash[move]
end

def make_tiles_hash(tiles_array)
    hash = Hash.new(0)
    tiles_array.each.with_index do |move, idx|
        hash[move] = idx
    end
    hash
end

$tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]

p dance_slow("left-up", $tiles_array)
p dance_fast("left-up", make_tiles_hash($tiles_array))





