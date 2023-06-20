class Person

  attr_accessor :name, :age
  attr_reader :id

  def initialize(name= 'Unknown', parent_permission=true, age)
    @id = id
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def can_use_services?
    return true if of_age? or @parent_permission === true
    false
  end

  
  private

  def of_age?
    return true if @age >= 18
    false
  end

end