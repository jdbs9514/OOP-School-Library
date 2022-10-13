require_relative './nameable'
require_relative './decorator'
require_relative './capitalize'
require_relative './trimmer'

class Person < Nameable
  attr_accessor :name, :age
  attr_reader :id

  def initialize(age, name = 'Unknow', parent_permission: true)
    super()
    @id = Random.rand(1..100)
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

  def add_rental(person, date)
    Rental.new(date, self, person)
  end

  private

  def of_age?
    @age >= 18
  end
end

person = Person.new(22, 'maximilianus')
person.correct_name
capitalized_person = CapitalizeDecorator.new(person)
capitalized_person.correct_name
capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
capitalized_trimmed_person.correct_name
