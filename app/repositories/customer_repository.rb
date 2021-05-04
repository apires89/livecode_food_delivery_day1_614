require 'csv'
require_relative "../models/customer"

class CustomerRepository
  def initialize(csv_file)
    @csv_file = csv_file
    @customers = []
    @next_id = 1
    load_csv if File.exists?(@csv_file)
  end

  def all
    @customers
  end

  def add(customer)
    #fetch the id from @next_id
    customer.id = @next_id
    #add it and save csv
    @customers << customer
    save_csv
    #increment the next id
    @next_id += 1
  end


  private

  def load_csv
    CSV.foreach(@csv_file, headers: :first_row, header_converters: :symbol) do |row|
      row[:id] = row[:id].to_i #convert to integer
      @customers << Customer.new(row)
      #@next_id = row[:id]
    end
    #@next_id +=1
    @next_id = @customers.last.id + 1 unless @customers.empty?
  end

  def save_csv
    CSV.open(@csv_file, "wb") do |csv|
      csv << ['id', 'name', 'address']
      @customers.each do |customer|
        csv << [customer.id, customer.name, customer.address]
      end
    end
  end

end
