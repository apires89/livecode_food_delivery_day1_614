class Router
  def initialize(meals_controller, customers_controller, employees_controller, orders_controller)
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @employees_controller = employees_controller
    @orders_controller = orders_controller
    @running = true
  end

  def run
    while @running
      @user = @employees_controller.login
      while @user #only runs if the @user exists
        #check if its a manager
        if @user.manager?
          #if true print one menu
          print_menu_manager
          choice = gets.chomp.to_i
          print `clear`
          route_action_manager(choice)
        else
          #else print another menu
          print_menu_rider
          choice = gets.chomp.to_i
          print `clear`
          route_action_rider(choice)
        end
      end
    end
  end

  private

  def print_menu_manager
    puts "---------------------------"
    puts "------- MENU MANAGER-------"
    puts "----------------------------"
    puts "1. Add new meal"
    puts "2. List all meals"
    puts "3. Add new customer"
    puts "4. List all customers"
    puts "5. Add a new order"
    puts "6. List all undelivered orders"
    puts "7. Log out"
    puts "8. Exit"
    print "> "
  end

  def route_action_manager(choice)
    case choice
    when 1 then @meals_controller.add
    when 2 then @meals_controller.list
    when 3 then @customers_controller.add
    when 4 then @customers_controller.list
    when 5 then @orders_controller.add
    when 6 then @orders_controller.list_undelivered_orders
    when 7 then logout!
    when 8 then stop!
    else puts "Try again..."
    end
  end

  def print_menu_rider
    puts "--------------------------"
    puts "------- MENU RIDER -------"
    puts "--------------------------"
    puts "1. Add new meal"
    puts "2. List all meals"
    puts "3. Add new customer"
    puts "4. List all customers"
    puts "5. Log out"
    puts "8. Exit"
    print "> "
  end

  def route_action_rider(choice)
    case choice
    when 1 then @meals_controller.add
    when 2 then @meals_controller.list
    when 3 then @customers_controller.add
    when 4 then @customers_controller.list
    when 5 then logout!
    when 8 then stop!
    else puts "Try again..."
    end
  end

  def logout!
    #method to stop the while loop
    @user = nil
  end

  def stop!
    logout!
    @running = false
  end
end
