# require_relative "app/repositories/meal_repository"


# meal_repo = MealRepository.new(File.join(__dir__, 'data/meals.csv'))

# p meal_repo


require_relative "app/repositories/employee_repository"

employee_repo = EmployeeRepository.new(File.join(__dir__, 'data/employees.csv'))

p employee_repo.all
