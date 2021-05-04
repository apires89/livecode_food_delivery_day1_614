require 'csv'
require_relative "../models/meal"

class MealRepository
  def initialize(csv_file)
    @csv_file = csv_file
    @meals = []
    @next_id = 1
    load_csv if File.exists?(@csv_file)
  end

  def all
    @meals
  end

  def add(meal)
    #fetch the id from @next_id
    meal.id = @next_id
    #add it and save csv
    @meals << meal
    save_csv
    #increment the next id
    @next_id += 1
  end


  private

  def load_csv
    CSV.foreach(@csv_file, headers: :first_row, header_converters: :symbol) do |row|
      row[:id] = row[:id].to_i #convert to integer
      row[:price] = row[:price].to_i #convert to integer
      @meals << Meal.new(row)
      #@next_id = row[:id]
    end
    #@next_id +=1
    @next_id = @meals.last.id + 1 unless @meals.empty?
  end

  def save_csv
    CSV.open(@csv_file, "wb") do |csv|
      csv << ['id', 'name', 'price']
      @meals.each do |meal|
        csv << [meal.id, meal.name, meal.price]
      end
    end
  end

end
