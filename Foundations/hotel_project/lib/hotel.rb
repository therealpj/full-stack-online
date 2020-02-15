require_relative "room"

class Hotel
    def initialize(hname, rnames)
        @name = hname
        @rooms = Hash.new
        rnames.each do |room, cap|
            @rooms[room] = Room.new(cap)
        end
    end

    def name
        return (@name.split(" ").each  {|word| word.capitalize!}).join(" ")
    end

    def rooms
        @rooms
    end

    def room_exists?(room)
        @rooms.has_key?(room)
    end

    def check_in(person, room)
        if !room_exists?(room)
            puts "sorry"
        else
            if @rooms[room].add_occupant(person)
                puts "check in successful"
            else
                puts "sorry, room is full"
            end
        end
    end

    def has_vacancy?
        @rooms.each_key do |room|
            if !@rooms[room].full?
                return true
            end
        end
        return false
    end

    def list_rooms
        @rooms.each do |key, val|
            puts key.to_s + ".*" + @rooms[key].available_space.to_s
        end
    end
end
