require_relative '../rental'
require_relative '../teacher'
require_relative '../book'

describe 'Rental' do
  date = DateTime.now.strftime('%d/%m/%Y')
  book = Book.new('Ruby Best Features', 'John K. Johnson')
  teacher = Teacher.new('Ruby', 53, 'Joana')
  rental = Rental.new(book, teacher)

  it '.new - takes two parameters and returns a Rental object' do
    expect(rental.instance_of?(Rental)).to eq(true)
  end
  it 'object has book with title = Ruby' do
    expect(rental.book.title).to eq('Ruby Best Features')
  end
  it 'object has book with author = John K. Johnson' do
    expect(rental.book.author).to eq('John K. Johnson')
  end
  it 'object has id' do
    expect(rental.id.nil?).to eq(false)
  end
  it 'object has a date' do
    expect(rental.date).to eq(date)
  end
end
