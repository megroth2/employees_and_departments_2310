class Budget
  attr_reader :year, :departments

  def initialize(year)
    @year = year
    @departments = []
  end

  def add_department(department)
    @departments << department
  end

  def departments_with_low_expenses
    departments.find_all do |department|
      department.expenses <= 500
    end
  end

  def employee_salaries
    employee_salaries = []

    @departments.each do |department|
      department.employees.each do |employee|
        employee_salaries << employee.salary
      end
    end
    employee_salaries
  end

  def current_expenses_by_department
    current_expenses_by_department = {}
    
    @departments.each do |department|
      current_expenses_by_department.store(department, department.expenses)
    end
    current_expenses_by_department
  end

end