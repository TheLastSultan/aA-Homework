class Stack
    def initialize
        @the_stack= empty
    end

    def push(el)
        self.the_stack.push(el)
    end

    def pop
        self.the_stack.pop
    end

    def peek
        self.the_stack[-1]
    end
end
