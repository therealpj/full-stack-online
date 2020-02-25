require_relative "card.rb"
class Board

    attr_reader :board

    # initialize a shuffled (n * n) board, n is even. 
    # Otherwise, a card will be left.
    def initialize(n)
        @board = populate(n)
    end

    # returns a 2D array consisting of cards, shuffled.
    def populate(n)
        board = Array.new(n) { Array.new(n)}
        pairs = (n * n) / 2
        count = 0
        value = ("A".."Z").to_a.sample
        
        # Fill in 2 of a card sequentially
        board.each.with_index do |arr, row|
            arr.each.with_index do |ele, col|
                
                if count == 2
                    value = ("A".."Z").to_a.sample
                    count = 0
                end

                board[row][col] = Card.new(value)
                count += 1

            end
        end

        # Shuffle it up
        board = board.map {|row| row.shuffle}
        board = board.shuffle
        
    end

    def size
        @board.length
    end



    # pretty print the board
    def render
        print "* " 
        @board.length.times do |num|
            print num.to_s + " "
        end

        puts
        @board.each.with_index do |arr, row|
            print row.to_s + " "
            arr.each.with_index do |card, col|        
                card.display
                print " "
            end
            puts
        end
    end

    def won?
        @board.each do |arr|
            arr.each do |card|
                return false if !card.hidden?
            end
        end

        return true
    end

    def reveal(guessed_pos)
        guessed_pos = guessed_pos.map {|ele| ele.to_i}
        @board[guessed_pos[0]][guessed_pos[1]].reveal
        return @board[guessed_pos[0]][guessed_pos[1]].face_value
    end

    def hide(guessed_pos)
        guessed_pos = guessed_pos.map {|ele| ele.to_i}
        @board[guessed_pos[0]][guessed_pos[1]].hide
        return @board[guessed_pos[0]][guessed_pos[1]].face_value
    end


end












