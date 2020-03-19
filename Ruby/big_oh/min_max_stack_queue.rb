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