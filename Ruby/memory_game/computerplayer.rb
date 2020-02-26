
class ComputerPlayer

    def initialize(name)
        @name = name
        @matched_card = []
        @known_cards = Hash.new {|h, k| h[k] = [] }
        @size = nil
        @next_play = nil
        @checked = []
    end


    def recieve_revealed_card(card, pos)
        @known_cards[card] <<  pos
    end
    
    def prompt
        puts "Hmmm... let me think"
        sleep(1)
    end

    def get_input
        if @next_play
            pos = @next_play
            @next_play = nil
            return pos
        end

        card_pair = @known_cards.detect { |key, val| @known_cards[key].length > 1}
        
        if card_pair
            @next_play = card_pair[1][1]
            return card_pair[1][0]
        else
            row = Random.rand(0...@size)
            col = Random.rand(0...@size)
            pos = [row, col]
            while @checked.include?(pos)
                row = Random.rand(0...@size)
                col = Random.rand(0...@size)
                pos = [row, col]
            end
            return pos
        end
    end

    def recieve_matched_pair(val, pos1, pos2)
        @known_cards.delete(val)
        @checked << pos1
        @checked << pos2
    end

    def board_size(board_size)
        @size = board_size
    end

end
