class Card
    
    attr_reader :face_value
    
    def initialize(face_value)
        @face_value = face_value
        @face_up = false
    end

    def display
        if @face_up
            print @face_value
        else
            print " "
        end

    end

    def hidden?
        !@face_up
    end

    def hide
        @face_up = false
    end

    def reveal
        @face_up = true
    end

    def eq(card1)
        return self.face_value == card1.face_value
    end

    

end


