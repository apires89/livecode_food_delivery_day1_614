require_relative "../views/customers_view"
require_relative "../models/customer"

class CustomersController
  def initialize(customer_repository)
    @customer_repository = customer_repository
    @customers_view = CustomersView.new
  end

  def list
    #fetch the list of customers from the repo
    customers = @customer_repository.all
    #display the list of customers to the user
    @customers_view.display(customers)
  end

  def add
    #get the name and the address from user
    name = @customers_view.ask_user_for_input("name")
    address = @customers_view.ask_user_for_input("address")
    #create an instance of customer
    customer = Customer.new(name: name, address: address)
    #add the customer to the repository
    @customer_repository.add(customer)
    #list
    list
  end
end
