class Nameable
  def correct_name
    raise NotImplementedError,
    "#{self.class} has not implemented method '#{__method__}'"
  end
end

class Person < Nameable
  attr_accessor :name, :age
  attr_reader :id

  def initialize(age, name = 'Unknown', parent_permission = true)
    @id = Random.rand(1...100)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  private

  def of_age?
    @age >= 18
  end
end

class Decorator < Nameable
  attr_accessor :nameable

  def initialize(nameable)
    @nameable = nameable
  end

  def correct_name
    @nameable.correct_name
  end
end

class CapitalizeDecorator < Decorator
  def correct_name
    @nameable.correct_name.capitalize
  end
end

class TrimmerDecorator < Decorator
  def correct_name
    text = @nameable.correct_name
    text.length <= 10 ? text : text[0..9]
  end
end

def print_result(component)
  puts "RESULT: #{component.correct_name}"
end

person = Person.new(22, 'maximilianus')
print_result(person)

capitalizedPerson = CapitalizeDecorator.new(person)
print_result(capitalizedPerson)

capitalizedTrimmedPerson = TrimmerDecorator.new(capitalizedPerson)
print_result(capitalizedTrimmedPerson)
