require_relative 'employee'

class Manager < Employee
    attr_reader :employees
    def initialize(name,title,salary=20000, boss=nil )
        super(name, title, salary, boss)
        @employees = []
    end
    
    def add_employee(employee)
        @employee.push(employee)
    end
    
    def bonus(multiplier)
        total = 0
        @employees.each { |emp| total += emp.salary }
        bonus = total  * multiplier
    end
    
end

