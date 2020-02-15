require "employee"

class Startup

    attr_reader :name, :funding, :salaries, :employees

    def initialize(name, funding, salaries)
        @name = name
        @funding = funding
        @salaries = salaries
        @employees = []
    end

    def valid_title?(title)
        salaries.include?(title)
    end

    def >(startup)
        self.funding > startup.funding
    end

    def hire(ename, title)
        if valid_title?(title)
            employees << Employee.new(ename, title)
        else
            raise "Invalid title"
        end
    end

    def size
        @employees.length
    end

    def pay_employee(emp)
        if salaries[emp.title] < @funding
            emp.pay(salaries[emp.title])
            @funding -= salaries[emp.title]
        else
            raise  "Not enough funding"
        end
    end

    def payday
        employees.map {|emp| pay_employee(emp)}
    end

    def average_salary
        sum = 0
        employees.map {|emp| sum += salaries[emp.title]}
        sum / employees.length
    end

    def close
        @employees = []
        @funding = 0
    end

    def acquire(start)
        @funding += start.funding

        start.salaries.each do |title, salary|
            if !self.salaries.include?(title)
                salaries[title] = salary
            end
        end

        start.employees.each do |emp|
            @employees << emp 
        end

        start.close
    end


end
