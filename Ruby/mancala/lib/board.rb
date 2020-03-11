class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14, default=0)
    place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    @cups.map!.with_index do |cup, idx|
      if idx == 6 || idx == 13
        cup = []
      else
        cup = [:stone, :stone, :stone, :stone]
      end
    end
  end

  def valid_move?(start_pos)
    valid = (0..12).to_a - [6]
    print valid
    raise 'Invalid starting cup' unless valid.include?(start_pos) 
    raise 'Starting cup is empty' if @cups[start_pos].length == 0
    return true
  end

  def make_move(start_pos, current_player_name)
    
    stones = @cups[start_pos].length
    @cups[start_pos] = Array.new
    next_pos = start_pos
    while stones != 0
      next_pos += 1

      if next_pos == 14
        next_pos = 0
      end
      
      if current_player_name == @name1 && next_pos == 13
        next
      end

      if current_player_name == @name2 && next_pos == 6
        next
      end

      @cups[next_pos].push(:stone)
      stones -= 1
    end

    render
    turn = next_turn(next_pos, current_player_name)
    return turn
  end

  def next_turn(ending_cup_idx, current_player_name)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx

    if ending_cup_idx == 6 && current_player_name == @name1
      return :prompt
    elsif ending_cup_idx == 13 && current_player_name == @name2
      return :prompt
    elsif @cups[ending_cup_idx].length > 1
      return ending_cup_idx
    else
      return :switch
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    @cups[0..5].all? {|cup| cup.length == 0} || 
    @cups[7..12].all? {|cup| cup.length == 0}
  end


  def winner
    p1 = @cups[6].count
    p2 = @cups[13].count

    if p1 == p2
      :draw
    else
      p1 > p2 ? @name1 : @name2
    end

  end 
end
