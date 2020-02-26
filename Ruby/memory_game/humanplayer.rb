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

    
end
