class PolyTreeNode

    def inspect
        @value.inspect
    end

    attr_reader :value, :parent, :children
    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end

    def parent=(value)
        if value == nil
            @parent = nil
            return
        end
        if @parent 
            @parent.children.delete(self)
            @parent = nil
        end
        @parent = value
        @parent.children << self unless @parent.children.include?(self)

    end

    def add_child(child)
        if child
            child.parent = self 
            @children << child unless @children.include?(child)
        end
    end

    def remove_child(child)
        unless child.parent
            raise "Not a child"
        end
        child.parent = nil
    end

    def dfs(target)
        return self if target. == self.value
        @children.each do |child|
            result = child.dfs(target)
            return result unless result == nil
        end
        return nil
    end

    def bfs(target)
        queue = []
        queue.unshift(self)
        while queue.length != 0
            first = queue.shift
            return first if first.value == target
            first.children.each {|child| queue.push(child)}
        end
        return nil
    end















end