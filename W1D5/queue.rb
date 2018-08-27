# Now let's write a Queue class. We will need the following instance methods: 
# enqueue(el), dequeue, and peek.

# Test your code to ensure it follows the principle of FIFO.

class Queue


    def initialize()
        @q = []
    end

    def enqueue(el)
        self.q.push(el)
    end

    def dequeue
        self.q.shift(el)
    end

    def peek
        self.q[0]
    end

    def to_s
        print self.q
    end
end

q = Queue.new
p q 
q.enqueue(5)
p q
q.peek
q.dequeue
p q
