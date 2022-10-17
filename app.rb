require_relative './book'
require_relative './rental'
require_relative './student'
require_relative './teacher'

class App
  attr_accessor :books, :people, :rentals

  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def dashboard
    puts '----- Choose An Option -----'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'
    puts '---------------------------'
  end

  def option1(input)
    case input
    when '1' then Book.list_books(@books)
    when '2' then Person.list_people(@people)
    when '3' then Person.create_person(@people)
    when '4' then Book.create_book(@books)
    when '5' then Rental.create_rental(@rentals, @books, @people)
    when '6' then Rental.list_rentals_for_person_id(@rentals, @people)
    when '7' then print 'Thank you for using this app!'
    end
  end

  def run
    # put FAKE DATA into @books array and @people array
    books_dummy_data = [
      ['The Grass is Always Greener', 'Jeffrey Archer'],
      ['Murder!', 'Arnold Bennett'],
      ['A Boy at Seven', 'John Bidwell'],
      ['The Open Boat', 'Stephen Crane'],
      ['The Higgler', 'A. E. Coppard']
    ]
    books_dummy_data.each do |book|
      @books.push(Book.new(book[0], book[1]))
    end
    students_names = %w[John Ana Kevin]
    students_names.each do |name|
      @people.push(Student.new(classroom: 'Alpha', age: 22, name: name, parent_permission: true))
    end
    teachers_names = %w[Clark Julia Paul]
    teachers_names.each do |name|
      @people.push(Teacher.new(22, 'Ruby', name))
    end
    # run the program
    loop do
      dashboard
      input = gets.chomp
      break if input == '7'

      option1(input)
    end
  end
end
