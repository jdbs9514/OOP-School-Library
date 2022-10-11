class Person
  attr_accesor :name, :age
  attr_reader :id

  def initialize(age:, parent_permission: true, name: 'Unknow')
    @id = Random.rand(1..100)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  private

  def of_age?
    @age >= 18
  end
end
