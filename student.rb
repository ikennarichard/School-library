require './person.rb'

class Student < Person
  
  def initialize(classroom, name='Unknown', parent_permission, age)
    super(name, parent_permission, age)
    @classroom = classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end

end