require_relative "../views/meals_view"
require_relative "../models/meal"

class MealsController
  def initialize(meal_repository)
    @meal_repository = meal_repository
    @meals_view = MealsView.new
  end

  def list
    #fetch the list of meals from the repo
    meals = @meal_repository.all
    #display the list of meals to the user
    @meals_view.display(meals)
  end

  def add
    #get the name and the price from user
    name = @meals_view.ask_user_for_input("name")
    price = @meals_view.ask_user_for_input("price").to_i
    #create an instance of Meal
    meal = Meal.new(name: name, price: price)
    #add the meal to the repository
    @meal_repository.add(meal)
    #list
    list
  end
end
