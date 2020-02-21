require "./item.rb"

class List
    def initialize(label)
        @label = label
        @items = []
    end

    def label
        @label
    end

    def label=(new_label)
        @label = new_label
    end

    def add_item(item, deadline, description="")
        if !Item.valid_date?(deadline)
            return false
        else
            @items << Item.new(item, deadline, description)
            return true
        end

    end

    def size
        @items.length
    end

    def valid_index(index)
        return (index < @items.length && index >= 0)
    end

    def swap(idx1, idx2)
        idx1 = idx1.to_i
        idx2 = idx2.to_i
       return false if !valid_index(idx1) || !valid_index(idx2)
        @items[idx1], @items[idx2] = @items[idx2], @items[idx1]
        return true
    end

    def [](index)
        return nil if !valid_index(index)
        @items[index]
    end

    def priority
        @items[0]
    end

    def print
        puts ("--------------------------------------")
        Kernel.puts("           #{@label}" )
        puts ("--------------------------------------")
        Kernel.puts("Index | Item            | Deadline")
        puts ("--------------------------------------")
        @items.each.with_index do |item, idx|
            puts
            Kernel.print("#{idx}     |")
            Kernel.print(" #{item.title.capitalize.ljust(16," ")}")
            Kernel.print("|")
            Kernel.print(" #{item.deadline.ljust(17," ")}")
            Kernel.print("#{item.done}")

        end
        puts
        puts ("--------------------------------------")
    end

    def print_full_item(index)
        index = index.to_i
        return nil if !valid_index(index)
        item = @items[index]
        puts ("--------------------------------------")
        Kernel.print("#{item.title.capitalize.ljust(15, " ")}")
        Kernel.print("#{item.deadline}")
        puts
        Kernel.print("#{item.description.ljust(17," ")}")
        Kernel.print("#{item.done}")
        puts
        puts ("--------------------------------------")

    end

    def print_priority
        print_full_item(0)
    end
    
    def up(index, amount=1)
        return false if !valid_index(index)
        
        while index != 0 && amount != 0
            @items[index] ,@items[index-1] = @items[index-1] , @items[index]
            amount -= 1
            index -= 1
        end
        return true
    end

    def down(index, amount=1)
        return false if !valid_index(index) || index == @items.length - 1
        
        while index < @items.length - 1&& amount != 0
            @items[index] ,@items[index+1] = @items[index+1] , @items[index]
            amount -= 1
            index += 1
        end
        return true
    end

    def sort_by_date!
        @items.sort_by! {|item| item.deadline }
    end

    def toggle_item(index)
        @items[index].toggle
    end

    def remove_item(index)
        return false if !valid_index(index)
        @items.delete_at(index)
        return true
    end

    def purge
        purged = false
        while !purged
            purged = true
            @items.each.with_index do |item, idx|
                if item.done
                    self.remove_item(idx)
                    purged = false
                    break
                end
            end
        end
    end

end

















