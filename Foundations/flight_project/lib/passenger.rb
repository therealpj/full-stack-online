class Passenger
    attr_reader :name

    def initialize(name)
        @name = name
        @flight_numbers = []
    end

    def has_flight?(flnum)
        @flight_numbers.include?(flnum.upcase)
    end

    def add_flight(flnum)
        if !has_flight?(flnum)
            @flight_numbers << flnum.upcase
        end
    end

end
