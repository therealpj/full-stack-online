class Queue
    def initialize
        @arr = []
    end

    def enqueue(ele)
        @arr << ele
    end

    def dequeue
        @arr.shift
    end

    def peek
        @arr[0]
    end

    def empty?
        @arr.empty?
    end

    def size
        @arr.length
    end
end

class Stack 
    def initialize
        @arr = []
    end

    def push(ele)
        @arr << ele
    end
    
    def pop
        @arr.pop
    end

    def peek
        @arr[-1]
    end

    def empty?
        @arr.empty?
    end

    def size
        @arr.length
    end

end 

class StackQueue
    def initialize
        @arr = Stack.new
        @rev_arr = Stack.new
    end

    def enqueue(ele)
        @arr.push(ele)
    end

    def dequeue
        reversify if @rev_arr.empty?
        @rev_arr.pop
    end

    private
    def reversify
        @rev_arr.push(@arr.pop) until @arr.empty?
    end
end

class MinMaxStack < Stack

    attr_reader :max, :min
    def initialize
        super

        # Positive and negative infinity for initial max and min
        @min = +1.0 / 0.0
        @max = -1.0/0.0
    end

    def push(ele)
        if ele > max
            @max = ele
        end
        if ele < min
            @min = ele
        end
        @arr << ele
    end

    def pop
        popped = @arr.pop
        if popped == max
            @max = @arr.max
        end
        if popped == min
            @min = @arr.min
        end
    end
end

























