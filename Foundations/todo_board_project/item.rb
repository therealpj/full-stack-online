class Item


    def Item::valid_date?(date)
        datearr = date.split("-")

        #check for correct length
        return false if datearr[0].length != 4 || datearr[1].length != 2 || datearr[2].length != 2
        return false if datearr[1].to_i > 12 || datearr[1].to_i < 1
        return false if datearr[2].to_i > 31 || datearr[2].to_i < 1
        
        return true

    end

    def initialize(title, deadline, description)
        @title = title

        if Item.valid_date?(deadline)
            @deadline = deadline 
        else
            raise "Deadline format: YYYY-MM-DD"
        end
        
        @description = description
        @done = false
    end

    def title
        @title
    end

    def title=(new_title)
        @title = new_title
    end

    def deadline
        @deadline
    end

    def description
        @description
    end
    

    def deadline=(new_deadline)
        @deadline = new_deadline
    end

    def description=(new_description)
        @description = new_description
    end

    
    def toggle
        @done = !@done
    end

    def done 
        @done
    end
    


end
