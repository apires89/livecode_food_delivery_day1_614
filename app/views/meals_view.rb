require_relative 'base_view'

class MealsView < BaseView
  def display_rows(element)
    puts "#{element.id} -- #{element.name} -- #{element.price}"
  end
end
