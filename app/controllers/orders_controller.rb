require_relative "../views/orders_view"
require_relative "../views/meals_view"
require_relative "../views/customers_view"
require_relative "../views/employees_view"
require_relative "../models/order"
require "byebug"


class OrdersController
  def initialize(order_repository,meal_repository,customer_repository,employee_repository)
    #get all repos
    @order_repository = order_repository
    @meal_repository = meal_repository
    @customer_repository = customer_repository
    @employee_repository = employee_repository
    #instantiate all views
    @orders_view = OrdersView.new
    @meals_view = MealsView.new
    @customers_view = CustomersView.new
    @employees_view = EmployeesView.new
  end

  def list
    #fetch the list of orders from the repo
    orders = @order_repository.all
    #display the list of orders to the user
    @orders_view.display(orders)
  end


  def list_undelivered_orders
    #get the undelivered order from repo
    #display them in the view
    @orders_view.display(@order_repository.undelivered_orders)
  end


  def add
    #Select a meal
    meal = select_meal
    #select a customer
    customer = select_customer
    #select a employee
    employee = select_employee
    #create an instance of Order
    order = Order.new(meal: meal, customer: customer, employee: employee)
    #add order to order repo
    @order_repository.add(order)
  end

  private

  def select_meal
    #get all meals
    meals = @meal_repository.all
    #display them for the user
    @meals_view.display(meals)
    #ask the user to select
    index = @orders_view.ask_user_for_input("index").to_i - 1
    #return the selected meal
    return meals[index]
  end

  def select_customer
    #get all meals
    customers = @customer_repository.all
    #display them for the user
    @customers_view.display(customers)
    #ask the user to select
    index = @orders_view.ask_user_for_input("index").to_i - 1
    #return the selected customer
    return customers[index]
  end

  def select_employee
    #get all meals
    employees = @employee_repository.all
    #display them for the user
    @employees_view.display(employees)
    #ask the user to select
    index = @orders_view.ask_user_for_input("index").to_i - 1
    #return the selected employee
    return employees[index]
  end

end








