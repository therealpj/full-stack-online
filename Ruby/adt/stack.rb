class Stack
    def initialize
        @arr = []
    end

    def push(el)
        @arr << el
    end
    
    def pop
        popped = @arr[-1]
        @arr = @arr[0...-1]
        popped
    end

    def peek
        @arr[-1]
    end
end
