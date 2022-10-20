require_relative '../classroom'
require_relative '../student'

describe 'Classroom' do
  classroom = Classroom.new('Ruby on Rails')
  it '.new - takes one parameter and returns a Classroom object' do
    expect(classroom.instance_of?(Classroom)).to eq(true)
  end
  it 'label' do
    expect(classroom.label).to eq('Ruby on Rails')
  end
  it 'students' do
    expect(classroom.students.empty?).to eq(true)
  end
end

describe 'add_student method' do
  classroom = Classroom.new('Ruby on Rails')
  student = Student.new(classroom, 32, 'Tiago')
  classroom.add_student(student)

  it 'students' do
    expect(classroom.students.empty?).to eq(false)
  end
end
