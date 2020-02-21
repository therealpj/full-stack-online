class HumanPlayer

    attr_reader :mark_value

    def initialize(mark_value)
        @mark_value = mark_value
    end

    def get_position
        puts "Enter postion for putting your " + @mark_value.to_s + "!"

        pos = gets.chomp
        pos = pos.split
        
        pos.each.with_index {|ele, idx| pos[idx] = Integer(ele)}
        raise "Position should be of the form 'row col' " if pos.length != 2

        pos.each do |ele|
            if !ele.is_a?(Integer)
                raise "Not a position :("
            end
        end
    end

end