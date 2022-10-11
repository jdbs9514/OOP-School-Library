require_relative './person'

class Teacher
  attr_accesor :specialization

  include person

  def initialize(age, specialization, name: 'unknow', parent_permission: true)
    super(age: age, name: name, parent_permission: parent_permission)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
