class Employee
    attr_reader :name, :title, :salary, :boss
    def initialize(name, salary=1000, title='Grunt', boss=nil)
        @name = name
        @title = title
        @salary = salary
        @boss = boss
    end

    def bonus(multiplier)
        bonus = @salary * multiplier
    end


end
