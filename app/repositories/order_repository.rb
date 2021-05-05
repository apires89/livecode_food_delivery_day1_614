require 'csv'
require_relative "../models/order"
require "byebug"

class OrderRepository
  def initialize(csv_file, meal_repository, customer_repository, employee_repository)
    @csv_file = csv_file
    @meal_repository = meal_repository
    @customer_repository = customer_repository
    @employee_repository = employee_repository
    @orders = []
    @next_id = 1
    load_csv if File.exists?(@csv_file)
  end

  def all
    @orders
  end

  def add(order)
    #fetch the id from @next_id
    order.id = @next_id
    #add it and save csv
    @orders << order
    save_csv
    #increment the next id
    @next_id += 1
  end

  def undelivered_orders
    @orders.reject {|order| order.delivered? }
    # if order.delivered? == false
    #     results << order
    #   end
    # end
  end

  # def delivered_orders
  #   results = []
  #   @orders.select {|order| order.delivered? }
  #   @orders.each do |order|
  #     if order.delivered? == true
  #       results << order
  #     end
  #   end
  # end


  private

  def load_csv
    CSV.foreach(@csv_file, headers: :first_row, header_converters: :symbol) do |row|
      row[:id] = row[:id].to_i #convert to integer
      row[:delivered] = row[:delivered] == "true" ###conver to boolean
      ####### FETCH THE INSTANCES FROM THE REPOSITORIES #######
      meal = @meal_repository.find(row[:meal_id].to_i)
      customer = @customer_repository.find(row[:customer_id].to_i)
      employee = @employee_repository.find(row[:employee_id].to_i)
      @orders << Order.new(id: row[:id], meal: meal, customer: customer, employee: employee, delivered: row[:delivered])
      #@next_id = row[:id]
    end
    #@next_id +=1
    @next_id = @orders.last.id + 1 unless @orders.empty?
  end

  def save_csv
    CSV.open(@csv_file, "wb") do |csv|
      csv << ['id','delivered','meal_id','customer_id','employee_id']
      @orders.each do |order|
        csv << [order.id, order.delivered, order.meal.id, order.customer.id, order.employee.id]
      end
    end
  end

end
