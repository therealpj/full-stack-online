require 'colorize'

class Tile
    
    attr_reader :value
    
    def initialize(value, given)
        
        @value = value
        @given = given
    end

    def to_s
        if @given 
            return @value.to_s.colorize(:color => :light_yellow, :background => :default)
        else
            return @value.to_s.colorize(:color => :blue, :background => :default)
        end
    end

    def value=(val)
        if @given
            @value = val
        else
            puts "Hey thats cheating!"
            sleep(1)
        end
    end


end