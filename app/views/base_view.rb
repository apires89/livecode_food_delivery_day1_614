class BaseView
  def display(elements)
    elements.each do |element|
      #here i create a method that i will use
      #in the child classes
      display_rows(element)
    end
  end

  def ask_user_for_input(input)
    puts "What is the #{input}?"
    gets.chomp
  end
end
