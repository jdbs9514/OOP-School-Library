require_relative './person'

class Student < Person
  attr_reader :classroom, :parent_permission

  def initialize(age:, classroom:, name: 'unknow', parent_permission: true)
    super(age, name, parent_permission: parent_permission)
    @classroom = classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def self.create_student(people)
    print 'Name: '
    name = gets.chomp

    print 'Age: '
    age = gets.chomp.to_i

    print 'Student Class: '
    classroom = gets.chomp

    print 'Has parent permission? [Y/N]: '
    parent_permission = gets.chomp.downcase == 'y'

    student = Student.new(classroom: classroom, age: age, name: name, parent_permission: parent_permission)
    people.push(student)
    puts 'Student created successfully'
  end
end
