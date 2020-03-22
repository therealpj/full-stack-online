class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
  each.with_index.inject(0) do |ihash, (el, i)|
      (ihash.hash ^ el.hash + i.hash)
    end
  end
end

class String
  def hash
    start = self[0].ord.hash
    each_char.with_index do |ele, idx|
      start = start ^ (ele.ord.to_i).hash ^ idx.hash
    end
    start
  end 
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    h = size.hash
    each do |key, val|
      h = h ^ (key.hash ^ val.hash)
    end
    h
  end
end
