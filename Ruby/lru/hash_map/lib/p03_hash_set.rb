class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    if @count == num_buckets
      resize!
    end

    self[key] << key
    @count += 1
    return true
  end

  def include?(key)
    self[key].include?(key)
  end

  def remove(key)
    if self[key].include?(key)
      self[key].delete(key)
      @count -= 1
    end
  end

  private

  def [](num)
    idx = num.hash
    @store[idx % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    @store_dup = Array.new(num_buckets * 2) {Array.new}
    @store.each do |bucket|
      bucket.each do |ele|
        @store_dup[ele.hash % (num_buckets * 2)] = ele
      end
    end
    @store = @store_dup
  end
end
