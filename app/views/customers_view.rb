require_relative 'base_view'

class CustomersView < BaseView
  #method that is going to be called in the parent class
  def display_rows(element)
    puts "#{element.id} -- #{element.name} -- #{element.address}"
  end
end
