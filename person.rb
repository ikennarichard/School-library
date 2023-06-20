class Person
  attr_accessor :name, :age
  attr_reader :id

  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = Random.rand(1...100)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def can_use_services?
    return true if of_age? or @parent_permission.eql? true

    false
  end

  private

  def of_age?
    return true if @age >= 18

    false
  end
end
