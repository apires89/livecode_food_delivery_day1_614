require_relative "../views/employees_view"
require_relative "../models/employee"

class EmployeesController
  def initialize(employee_repository)
    @employee_repository = employee_repository
    @employees_view = EmployeesView.new
  end

  def login
     #ask user for username
    username = @employees_view.ask_user_for_input("username")
    #ask user for password
    password = @employees_view.ask_user_for_input("password")
    #find the employee with the username
    employee = @employee_repository.find_by_username(username)
    #check if password is correct and check if the employee exists
    if employee && employee.password == password
      employee
    else
      @employees_view.wrong_credentials
      #calling the method again // go back to the beggining
      login
    end
    #return an employee
  end
end
