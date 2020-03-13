class Simon
  COLORS = %w(red blue green yellow)
  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    until @game_over
      take_turn
    end
    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    require_sequence
    unless @game_over
      round_success_message
      @sequence_length += 1
    end
  end

  def show_sequence
    add_random_color
    system("clear")
    @seq.each do |color|
      print color
      sleep(1)
      puts
    end
    system("clear")
  end

  def require_sequence
    puts "Enter the correct sequence"
    user_guess = gets.chomp.split(" ")
    if user_guess != @seq
      @game_over = true
    end
  end

  def add_random_color
    @seq << COLORS.sample
  end

  def round_success_message
    puts "Horray! you won this round. Lets ramp up the difficulty"
  end

  def game_over_message
    puts "Ooooops!!!! You almost recalled correctly."
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end
