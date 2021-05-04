require_relative "app/repositories/meal_repository"


meal_repo = MealRepository.new(File.join(__dir__, 'data/meals.csv'))

p meal_repo
