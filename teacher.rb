require './person.rb'

class Teacher < Person

  def initialize(specialization, name='Unknown', age)
    super(name, age)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end

nneka = Teacher.new('Arts', 'Nneka', 29)