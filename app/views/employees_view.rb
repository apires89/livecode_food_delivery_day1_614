require_relative 'base_view'
class EmployeesView < BaseView

  def display_rows(element)
    puts "#{element.id} -- #{element.username} - #{element.role}"
  end

  def wrong_credentials
    puts "Wrong credentials! Try again.."
  end

end
