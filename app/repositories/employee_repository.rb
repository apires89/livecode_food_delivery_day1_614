require 'csv'
require_relative "../models/employee"

class EmployeeRepository
  def initialize(csv_file)
    @csv_file = csv_file
    @employees = []
    @next_id = 1
    load_csv if File.exists?(@csv_file)
  end

  def all
    @employees
  end

  def add(employee)
    #fetch the id from @next_id
    employee.id = @next_id
    #add it and save csv
    @employees << employee
    save_csv
    #increment the next id
    @next_id += 1
  end

  def find(employee_id)
    @employees.find { |employee| employee.id == employee_id }
  end


  def find_by_username(username)
    @employees.find { |employee| employee.username == username }
  end


  private

  def load_csv
    CSV.foreach(@csv_file, headers: :first_row, header_converters: :symbol) do |row|
      row[:id] = row[:id].to_i #convert to integer
      @employees << Employee.new(row)
      #@next_id = row[:id]
    end
    #@next_id +=1
    @next_id = @employees.last.id + 1 unless @employees.empty?
  end

  def save_csv
    CSV.open(@csv_file, "wb") do |csv|
      csv << ['id', 'username', 'password','role']
      @employees.each do |employee|
        csv << [employee.id, employee.username, employee.password,employee.role]
      end
    end
  end

end
