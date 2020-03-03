class Map
    def initialize
        @hash = []
    end

    def set(key, value)
        pair = [key, value]
        put_pair = false
        @hash.each do |pair|
            if pair[0] == key
                put_pair = true
                pair[1] = val
            end
        end

        unless put_pair
            @hash << pair
        end
    end

    def get(key)
        @hash.each do |pair|
            if pair[0] == key
                return pair
            end
        end
    end

    def delete(key)
        deleted = false
        @hash.each do |pair|
            if pair[0] == key
                return @hash.delete(pair)
            end
        end
    end

    def show
        @hash.each do |pair|
            print pair
            puts
        end
        return
    end
end