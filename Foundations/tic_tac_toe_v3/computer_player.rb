class ComputerPlayer
    attr_reader :mark_value

    def initialize(mark_value)
        @mark_value = mark_value
    end

    def get_position(legal)
        pos = legal.sample
        puts "I choose " + pos.to_s
        return pos
    end
end
