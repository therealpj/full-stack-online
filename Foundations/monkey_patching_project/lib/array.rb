# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array

    def span
        return nil if self.length == 0
        sorted = self.sort
        sorted[-1] - sorted[0]
    end
  
    def average
        return nil if self.length == 0
        self.inject(0) {|acc, ele| acc + ele} / self.length.to_f
    end

    def median
        return nil if self.length == 0
        sorted = self.sort
        if self.length % 2 == 0
            return (sort[self.length / 2 - 1] + sorted[(self.length / 2)]) / 2.0
        else
            return sort[self.length/2]
        end
    end

    def counts
        hash = Hash.new(0)
        self.each {|ele| hash[ele] += 1}
        return hash
    end

    def my_count(val)
        count = 0
        self.each do |ele|
            if ele == val
                count += 1
            end
        end
        return count
    end

    def my_index(val)
        self.each.with_index do |ele, idx|
            if ele == val
                return idx
            end
        end
        return nil
    end

    def my_uniq
        uniq = []
        self.each do |ele|
            if !uniq.include?(ele)
                uniq << ele
            end
        end
        uniq
    end

    def my_transpose
        twod = Array.new(self.length) {Array.new(self.length, 0)}
        i = 0
        j = 0
        while i < self.length
            while j < self.length
                twod[i][j] = self[j][i]
                j += 1
            end
            j = 0
            i += 1
        end
        twod
    end

end
