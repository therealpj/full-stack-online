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
    PositiveInfinity = +1.0 / 0.0
    NegativeInfinity = -1.0/0.0
    attr_reader :max, :min
    def initialize
        super

        # Positive and negative infinity for initial max and min
        @min = PositiveInfinity
        @max = NegativeInfinity
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
            @max = @arr.max || NegativeInfinity
        end
        if popped == min
            @min = @arr.min || PositiveInfinity
        end

        popped
    end
end



class MinMaxStackQueue
    def initialize
        @stack = MinMaxStack.new
        @rev_stack = MinMaxStack.new
    end

    def enqueue(ele)
        @stack.push(ele)
    end

    def dequeue
        reversify if @rev_stack.empty?
        @rev_stack.pop
    end

    def reversify
        @rev_stack.push(@stack.pop) until @stack.empty?
    end

    def empty
        @stack.empty? || @rev_stack.empty?
    end

    def max
        @stack.max > @rev_stack.max ? @stack.max : @rev_stack.max
    end

    def min
        @stack.min < @rev_stack.min ? @stack.min : @rev_stack.min
    end
end

require 'byebug'
def windowed_max_range(arr, window)
    best_max = -1.0/0.0
    idx = 0
    something = idx
    # debugger
    while something < arr.length
        q = MinMaxStackQueue.new

        something = idx
        
        window.times do
            q.enqueue(arr[something])
            something += 1
        end

        idx += 1
        max = q.max
        min = q.min
        cur_max = max - min
        if best_max < cur_max
            best_max = cur_max
        end

    end
    best_max
end


p windowed_max_range([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
p windowed_max_range([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
p windowed_max_range([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
p windowed_max_range([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8











