class Hangman
    DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]

    def self.random_word
        DICTIONARY.sample
    end

    def initialize
      @secret_word = Hangman.random_word
      @guess_word = (@secret_word.split("").map{|ele| ele = '_'})
      @attempted_chars = []
      @remaining_incorrect_guesses = 5
    end

    def guess_word
      @guess_word
    end

    def attempted_chars
      @attempted_chars
    end

    def already_attempted?(char)
      @attempted_chars.include?(char)
    end

    def get_matching_indices(char)
      indices = []
      @secret_word.each_char.with_index do |c, i|
        if char == c
          indices << i
        end
      end
      indices
    end

    def remaining_incorrect_guesses
      @remaining_incorrect_guesses
    end

    def fill_indices(char, indices)
      indices.each do |i|
        guess_word[i] = char
      end
    end

    def try_guess(char)
      if self.already_attempted?(char)
        puts "that has already been attempted"
        return false
      else
        @attempted_chars << char
        indices = fill_indices(char, get_matching_indices(char))
        if indices == []
          @remaining_incorrect_guesses -= 1
        end
        return true
      end
    end


    def ask_user_for_guess
      puts "Enter a char:"
      char = gets.chomp
      self.try_guess(char)
    end

    def win?
      if @guess_word.join("") == @secret_word
        puts "WIN" 
        return true
      else
        return false
      end
    end

    def lose?
      if @remaining_incorrect_guesses == 0
        puts "LOSE"
        return true
      else
        return false
      end
    end

    def game_over?
      puts @secret_word
      if !(self.win? || self.lose?)
          return false
      else
        return true
      end
    end

  



end
