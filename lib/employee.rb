class Employee
  attr_reader :name, :age, :salary

  def initialize(employee_details)
    @name = employee_details[:name]
    @age = employee_details[:age].to_i
    @salary = employee_details[:salary].delete("$").to_i
  end

  def give_raise(raise_amount)
    @salary += raise_amount
  end

end