class WordChainer
    def initialize(dict)
        file = File.readlines(dict)
        @dict = Set.new(file.map(&:chomp))
        @current_words = []
        @all_seen_words = Hash.new
    end
    
    def adjacent_words(word)
        same_length = Set.new(@dict.select {|w| w.length == word.length})
        adjacent = []
        same_length.each do |possible_word|
            adjacent << possible_word if adjacent_word(word, possible_word)
        end
        adjacent
    end

    def adjacent_word(word1, word2)
        i = word1.length
        diff = 0
        idx = 0
        while idx != i
            if word1[idx] != word2[idx]
                diff += 1
                return false if diff > 1
            end
            idx += 1
        end
        if diff == 1
            return true
        else
            return false
        end
    end

    def run(source, target)
        @current_words = [source]
        @all_seen_words[source] = nil
        
        while @current_words.length != 0 || !@all_seen_words.key?(target)
            new_current_words = explore_current_words
            @current_words = new_current_words
        end
        
        build_path(target)
    end

    def explore_current_words
        new_current_words = []
        @current_words.each do |current_word|
            adjacent_words = adjacent_words(current_word)
            adjacent_words.each do |adjacent|
                next if @all_seen_words.key?(adjacent)
                new_current_words << adjacent
                @all_seen_words[adjacent] = current_word
            end
        end
        new_current_words
    end

    def build_path(target)
        last = target
        path = [last]
        while last != nil
            last = @all_seen_words[last]
            path << last
        end
        path
    end

end


