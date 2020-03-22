class StaticArray
  attr_reader :store

  def initialize(capacity)
    @store = Array.new(capacity)
  end

  def [](i)
    validate!(i)
    self.store[i]
  end

  def []=(i, val)
    validate!(i)
    self.store[i] = val
  end

  def length
    self.store.length
  end

  private

  def validate!(i)
    raise "Overflow error" unless i.between?(0, self.store.length - 1)
  end
end

class DynamicArray
  include Enumerable

  attr_accessor :count
  attr_reader :store
  def initialize(capacity = 8)
    @store = StaticArray.new(capacity)
    @count = 0
  end

  def [](i)
    if i < 0
      @store[capacity - i]
    else
      @store[i]
    end
  end

  def []=(i, val)
    @store[i] = val
  end

  def capacity
    @store.length
  end

  def include?(val)
    each do |ele| 
      return true if ele == val
    end
    return false
  end

  def push(val)
    if @count >= capacity
      resize!
    end
    @store[@count] = val
    @count += 1
  end

  def unshift(val)
    resize! if @count >= capacity
    duplicate = StaticArray.new(capacity)
    i, j = 1, 0
    duplicate[0] = val
    while j < @count
      duplicate[i] = @store[j]
      i += 1
      j += 1
    end
    @store = duplicate
    @count += 1 
  end


  def pop
    return nil if @count == 0
    @count -= 1
    popped = @store[@count]
    @store[@count] = nil
    popped
  end

  def shift 
    i = 0
    arr = StaticArray.new(capacity)
    while i < arr.length - 1
      arr[i] = self[i + 1]
      i += 1
    end
    shifted = self[0]
    @count -= 1
    @store = arr
    return shifted
  end

  def first
    @store[0]
  end

  def last
    @store[@count - 1]
  end

  def each_with_index(&prc)
    i = 0
    while i < @count
      prc.call(i, @store[i])
      i += 1
    end
  end


  def each(&prc)
    @store.store.each do |ele|
      prc.call(ele)
    end
  end

  def to_s
    "[" + inject([]) { |acc, el| acc << el }.join(", ") + "]"
  end

  def ==(other)
    return false unless [Array, DynamicArray].include?(other.class)
    i = 0
    return false unless length == other.length
    while i != length
      return false unless self[i]== (other[i])
      i += 1
    end
    return true
  end

  alias_method :<<, :push
  [:length, :size].each { |method| alias_method method, :count }

  private

  def resize!
    i = 0
      new_store = StaticArray.new(capacity * 2)
      while i != @store.length
        new_store[i] = @store[i]
        i += 1
      end
      @store = new_store
  end
end
