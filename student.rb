require_relative './person'

class Student < Person
  attr_accessor :classroom

  def initialize(age, classroom, name: 'unknow', parent_permission: true)
    super(age: age, name: name, parent_permission: parent_permission)
    @classroom = classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end
