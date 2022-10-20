require_relative '../person'
require_relative '../teacher'

describe 'Teacher' do
  teacher = Teacher.new('Ruby', 53, 'Joana')
  it 'takes three parameters and returns a Teacher object' do
    expect(teacher.instance_of?(Teacher)).to eq(true)
  end
  it 'object is NOT instance of class Person' do
    expect(teacher.instance_of?(Person)).to eq(false)
  end
  it 'object has specialization = Ruby' do
    expect(teacher.specialization).to eq('Ruby')
  end
  it 'object has age = 53' do
    expect(teacher.age).to eq(53)
  end
  it 'object has name = Joana' do
    expect(teacher.name).to eq('Joana')
  end
  it 'object has id' do
    expect(teacher.id.nil?).to eq(false)
  end
  it 'object parent_permission is true' do
    expect(teacher.parent_permission).to eq(true)
  end
end
