class Player

    def get_move
        puts "enter a position"
        pos =  gets.chomp
        pos.split(" ").map(&:to_i)
    end

end
