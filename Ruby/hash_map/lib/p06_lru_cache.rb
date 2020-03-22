require_relative 'p05_hash_map'
require_relative 'p04_linked_list'

class LRUCache
  def initialize(max, prc)
    @map = HashMap.new
    @store = LinkedList.new
    @max = max
    @prc = prc
  end

  def count
    @map.count
  end

  def get(key)
    if @map[key] != nil
      #move node to end because it is cached
      present = @map[key]
      present.prev.next = present.next
      present.next.prev = present.prev
      present.next = @store.tail
      present.prev = @store.tail.prev
      @store.tail.prev.next = present
      @store.tail.prev = present
    else 
      #call the proc
      #append key value to end of linked list
      #add key to hash
      #check if cache exceeded max size, if so then call eject!
      val = @prc.call(key)
      @map[key] = @store.append(key,val)
      if count > @max
        eject!
      end
      return val
    end
  end
  def to_s
    'Map: ' + @map.to_s + '\n' + 'Store: ' + @store.to_s
  end

  private

  def calc!(key)
    # suggested helper method; insert an (un-cached) key
  end

  def update_node!(node)
    # suggested helper method; move a node to the end of the list
  end

  def eject!
    key = @store.head.next.key
    @store.head.next = @store.head.next.next
    @store.head.next.prev = @store.head
    @map[key] = nil
  end
end
