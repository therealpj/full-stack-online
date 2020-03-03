class Queue
    def initialize
        @q = []
    end

    def enqueue(el)
        @q = @q + [el]
    end

    def dequeue
        dqd = @q[0]
        @q = @q[1..-1]
        dqd
    end

    def peek
        @q[0]
    end
end
