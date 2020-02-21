require "./list.rb"
require "./item.rb"

class TodoBoard
    def initialize()
        @lists = {}
    end

    def get_command
        
        puts "Enter a command from the following : "
        puts "1. mktodo <title> <deadline> <optional description>"
        puts "2. up <index> <optional amount>"
        puts "3. down <index> <optional amount>"
        puts "4. swap <index_1> <index_2>"
        puts "5. sort"
        puts "6. priority"
        puts "7. print <optional index>"
        puts "8. toggle <index>"
        puts "9. rm <index>"
        puts "10. purge"
        puts "11. quit"
        puts "12. mklist <new_list_label>"

        cmd, list_label, *args = gets.chomp.split(' ')
        
        case cmd
        when 'mktodo'
            @lists[list_label].add_item(*args)
        when 'up'
            @lists[list_label].up(*args.map {|ele| ele = ele.to_i})
        when 'down'
            @lists[list_label].down(*args.map {|ele| ele = ele.to_i})
        when 'swap'
            @lists[list_label].swap(*args)
        when 'sort'
            @lists[list_label].sort_by_date!
        when 'priority'
            @lists[list_label].priority
        when 'print'
            if (args.length == 0)
                @lists[list_label].print
            else
                @lists[list_label].print_full_item(*args)
            end
        when 'toggle'
            @lists[list_label][*args[0].to_i].toggle
        when 'rm'
            @lists[list_label].remove_item(*args[0].to_i)
        when 'purge'
            @lists[list_label].purge
        when 'quit'
            return false
        when 'mklist'
            @lists[list_label] = List.new(list_label)
        when 'ls'
            puts @lists.keys
        when 'showall'
            @lists.each do |key, val|
                @lists[key].print
            end
        else 
            puts "Wrong command"
        end

        true
        
    end

    def run
        running = get_command
        while running
            running = get_command
        end
    end

end

Board = TodoBoard.new
Board.run