class Flight
    attr_reader :passengers
    def initialize(flnum, cap)
        @flight_number = flnum
        @capacity = cap
        @passengers = []
    end

    def full?
        @passengers.length >= @capacity
    end

    def board_passenger(pass)
        if !full? && pass.has_flight?(@flight_number)
            @passengers << pass
        end
    end

    def list_passengers
        passarr = []
        @passengers.each do |p|
            passarr << p.name
        end
        passarr
    end

    def [](i)
        @passengers[i]
    end

    def <<(p)
        board_passenger(p)
    end

end