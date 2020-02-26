class HumanPlayer

    attr_reader :name
    
    def initialize(name)
        @name = name
    end

    def prompt
        puts "Enter the position where you'd like to flip a card, " + name
    end

    def get_input 
        guessed = gets.chomp.split(',')
        guessed
    end

    def recieve_matched_cards(p1, p2)
        return
    end

    def size(board_size)
        return 
    end

    def recieve_revealed_card(card, pos)
        return
    end

    
end
