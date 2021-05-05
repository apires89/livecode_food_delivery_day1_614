class Employee
  attr_reader :username, :password
  attr_accessor :id, :role
  def initialize(attributes={})
    @id = attributes[:id]
    @username = attributes[:username]
    @password = attributes[:password]
    @role = attributes[:role]
  end

  def manager?
    true if @role == "manager"
  end


  def rider?
    true if @role == "rider"
  end


end
