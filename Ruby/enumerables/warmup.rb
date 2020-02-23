require 'byebug'

class Array
    def my_each(&prc)
        (self.length).times do |idx|
            prc.call(self[idx])
        end
        self
    end

    def my_select(&prc)
        newarr = []
        self.my_each do |ele|
            if prc.call(ele)
                newarr << ele
            end
        end
        newarr
    end

    def my_reject(&prc)
        newarr = []
        self.my_each do |ele|
            if !prc.call(ele)
                newarr << ele
            end
        end
        newarr
    end

    def my_any?(&prc)
        self.my_each do |ele|
            return true if prc.call(ele)
        end
        return false
    end

    def my_all?(&prc)
        self.my_each do |ele|
            return false if !prc.call(ele)
        end
        return true
    end

    def my_flatten
        return self if self.all? {|ele| !ele.is_a?(Array)}

        newarr = []
        self.each do |ele|
            if ele.is_a?(Array)
                newarr += ele.my_flatten
            else
                newarr << ele
            end
        end
        newarr

    end

    def my_zip(*arrays)
        unzipped = arrays.unshift(self)
        zipped = Array.new(self.length) {Array.new(arrays.length)}

        zipped.each.with_index do |arr, row|
            arr.each.with_index do |arr, col|
                zipped[row][col] = unzipped[col][row]
            end
        end
        zipped
    end

    def my_rotate(time = 1)
        newarr = self.dup
        if time < 0
            time.abs.times do  
                newarr = newarr.rotate_negative
            end
        else
            time.times do 
                newarr = newarr.rotate_positive
            end
        end
        newarr
    end

    def rotate_positive
        newarr = self.dup
        temp = newarr.shift
        newarr << temp

        newarr
    end

    def rotate_negative
        newarr = self.dup
        temp = newarr.pop
        newarr.unshift(temp)

        newarr
    end 

    def my_join(sep="")
        newstr = ""
        self.each do |ele|
            newstr += ele.to_s
            newstr += sep
        end 
        newstr[-1] = '' if newstr[-1] == sep
        
        newstr
    end

    def my_reverse
        newarr = []

        idx = self.length - 1
        while idx >= 0
            newarr << self[idx]
            idx -= 1
        end
        newarr
    end

end
























