class Node
  attr_reader :key
  attr_accessor :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    prev_dup = self.prev
    self.prev = self.next
    self.next.prev = prev_dup
  end
end

class LinkedList
  include Enumerable
  
  attr_reader :head, :tail
  def initialize
    @head = Node.new
    @tail = Node.new
    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head.next
  end

  def last
    @tail.prev
  end

  def empty?
    @head.next.key == nil
  end

  def get(key)
    each {|traverser| return traverser.val if traverser.key == key}
    return nil
  end

  def include?(key)
    each { |traverser| return true if traverser.key == key }
    return false
  end

  def append(key, val)
    new_node = Node.new(key, val)
    self.tail.prev.next = new_node
    new_node.next = self.tail
    new_node.prev = self.tail.prev
    self.tail.prev = new_node
    new_node
  end

  def update(key, val)
    each {|traverser| traverser.val = val if traverser.key == key }
  end

  def remove(key)
    each do |traverser|
      if traverser.key == key
        traverser.prev.next = traverser.next
        traverser.next.prev = traverser.prev
        traverser.next =nil
        traverser.prev = nil
        return key
      end
    end
  end

  def each(&prc)
    traverser = self.head
    while traverser.next != nil
      prc.call(traverser) unless traverser.key == nil
      traverser = traverser.next
    end
  
  end

  # uncomment when you have `each` working and `Enumerable` included
  def to_s
    inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  end
end
