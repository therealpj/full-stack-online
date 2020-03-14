
class HumanPlayer

    attr_reader :color, :display

    def initialize(color, display)
        @color = color
        @display = display
    end

    def make_move
        input = @display.cursor.get_input
        return input
    end
end
