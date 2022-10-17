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

  # list all people
  def list_people
    @people.each_with_index do |person, index|
      puts "#{index}) -> Type: #{person.class}, Name: \"#{person.name}\", ID: #{person.id}, Age: #{person.age}"
    end
  end

  def create_rental
    puts 'Select a book from the following list by number'
    list_books
    book_index = gets.chomp.to_i

    puts 'Select a person from the following list by number (not id)'
    list_people
    person_index = gets.chomp.to_i

    puts 'Date: '
    date = gets.chomp

    rental = Rental.new(date, @books[book_index], @people[person_index])
    @rentals.push(rental)
    puts 'Rental created successfully'
  end

  def list_rentals_for_person_id
    print 'ID of person: '
    id = gets.chomp.to_i
    puts 'Rentals:'
    @rentals.each do |rental|
      puts "Date: #{rental.date}, Book \"#{rental.book.title}\" by #{rental.book.author}" if rental.person.id == id
    end
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
    when '2' then list_people
    when '3' then Person.create_person(@people)
    when '4' then Book.create_book(@books)
    when '5' then create_rental
    when '6' then list_rentals_for_person_id
    when '7' then print 'Thank you for using this app!'
    end
  end

  def run
    loop do
      dashboard
      input = gets.chomp
      break if input == '7'

      option1(input)
    end
  end
end
