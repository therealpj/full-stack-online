class Code
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  def Code::valid_pegs?(arr)
    arr.each do |char|
      if !POSSIBLE_PEGS.include?(char.upcase)
        return false
      end
    end
    return true
  end

  def initialize(arr)
    if Code.valid_pegs?(arr) 
       @pegs = arr.map(&:upcase) 
    else
        raise "Wrong pegs"
    end
  end

  def pegs
    @pegs
  end

  def Code::random(len)
    arr = []
    len.times do 
      arr << POSSIBLE_PEGS.keys.sample
    end
    Code.new(arr)
  end

  def Code::from_string(pegs)
    Code.new(pegs.split(""))
  end

  def [](index)
    @pegs[index]
  end

  def length
    @pegs.length
  end

  def num_exact_matches(code)
    count = 0
    i = code.length < self.length ? code.length : self.length
    (0...i).each do |pos|
      if code[pos] == @pegs[pos]
        count += 1
      end
    end
    count
  end

  def num_near_matches(code)
    count = 0
    i = code.length < self.length ? code.length : self.length
    (0..i).each do |pos|
      if @pegs.include?(code[pos]) && code[pos] != @pegs[pos]
        count += 1
      end
    end
    count
  end

  def ==(code)
    @pegs == code.pegs
  end

end
