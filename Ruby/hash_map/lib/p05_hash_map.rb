require_relative 'p04_linked_list'

class HashMap
  include Enumerable
  attr_accessor :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { LinkedList.new }
    @count = 0
  end

  def include?(key)
    bucket = bucket(key)
    bucket.any? {|node| node.key == key}
  end

  def set(key, val)
    bucket = bucket(key)
    if bucket.include?(key)
      bucket.update(key, val)
    else
      resize! if @count == num_buckets
      bucket.append(key, val)
      @count += 1
    end
  end

  def get(key)
    bucket = bucket(key)
    bucket.each {|node| return node.val if key == node.key}
  end

  def delete(key)
    removed = bucket(key).remove(key)
    @count -= 1 if removed
  end

  def each(&prc)
    @store.each do |bucket|
      bucket.each do |node|
        prc.call(node.key, node.val)
      end
    end
  end

  # uncomment when you have Enumerable included
  def to_s
    pairs = inject([]) do |strs, (k, v)|
      strs << "#{k.to_s} => #{v.to_s}"
    end
    "{\n" + pairs.join(",\n") + "\n}"
  end

  alias_method :[], :get
  alias_method :[]=, :set

  private

  def num_buckets
    @store.length
  end

  def resize!
    store_dup = Array.new(num_buckets * 2) {LinkedList.new}
    @store.each do |bucket|
      bucket.each do |node|
        store_dup[node.key.hash % (num_buckets * 2)].append(node.key, node.val)
      end
    end
    @store = store_dup
  end

  def bucket(key)
    idx = key.hash
    @store[idx % num_buckets]
  end
end
