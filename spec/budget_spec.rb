require 'spec_helper'

RSpec.describe Budget do

  it 'exists' do
    budget = Budget.new(2023)

    expect(budget).to be_instance_of(Budget)
    expect(budget.year).to eq(2023)
    expect(budget.departments).to eq([])
  end

  it 'adds departments' do
    budget = Budget.new(2023)
    customer_service = Department.new("Customer Service")
    budget.add_department(customer_service)

    expect(budget.departments).to eq([customer_service])

    finance = Department.new("Finance")
    budget.add_department(finance)

    expect(budget.departments).to eq([customer_service, finance])
  end

  it 'returns departments with low expenses' do
    budget = Budget.new(2023)
    customer_service = Department.new("Customer Service")
    finance = Department.new("Finance")
    human_relations = Department.new("Human Relations")
    budget.add_department(customer_service)
    budget.add_department(finance)
    budget.add_department(human_relations)
    customer_service.expense(600)
    finance.expense(400)
    human_relations.expense(200)

    expect(budget.departments_with_low_expenses).to eq([finance, human_relations])
  end

  it 'returns employee salaries' do
    budget = Budget.new(2023)
    customer_service = Department.new("Customer Service")
    finance = Department.new("Finance")
    budget.add_department(customer_service)
    budget.add_department(finance)
    bobbi = Employee.new({name: "Bobbi Jaeger", age: "30", salary: "100000"})
    aaron = Employee.new({name: "Aaron Tanaka", age: "25", salary: "90000"})  
    customer_service.hire(bobbi)
    finance.hire(aaron)

    expect(budget.employee_salaries).to eq([100000, 90000])
  end

  it 'returns current expenses by department' do
    budget = Budget.new(2023)
    customer_service = Department.new("Customer Service")
    finance = Department.new("Finance")
    human_relations = Department.new("Human Relations")
    budget.add_department(customer_service)
    budget.add_department(finance)
    budget.add_department(human_relations)
    customer_service.expense(600)
    finance.expense(400)
    human_relations.expense(200)

    expect(budget.current_expenses_by_department).to eq({customer_service=>600, finance=>400, human_relations=>200})
  end

end