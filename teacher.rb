require_relative './person'

class Teacher < Person
  attr_accessor :specialization

  def initialize(age, specialization, name)
    super(age, name)
    @specialization = specialization
  end

  def can_use_services?
    true
  end

  def self.create_teacher(people)
    print 'Name: '
    name = gets.chomp

    print 'Age: '
    age = gets.chomp

    print 'Specialization: '
    specialization = gets.chomp

    teacher = Teacher.new(age, specialization, name)
    people.push(teacher)
    puts 'Person created successfully'
  end
end
