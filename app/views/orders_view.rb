class OrdersView
  def display(orders)
    orders.each do |order|
      puts "Order ID:#{order.id} - meal: #{order.meal.name} customer: #{order.customer.name } employee: #{order.employee.username}"
    end
  end

  def ask_user_for_input(input)
    puts "What is the #{input}?"
    gets.chomp
  end
end
