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

p biggest_fish_linearithmic(['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh'])


def biggest_fish_linear(fishes)
    biggest = fishes[0]
    fishes.each do |fish|
        biggest = fish if  biggest.length < fish.length
    end
    biggest
end

p biggest_fish_linear(['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh'])














