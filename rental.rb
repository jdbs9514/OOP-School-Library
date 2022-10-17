require_relative './app'

class Rental
  attr_accessor :date, :book, :person

  def initialize(date, book, person)
    @date = date

    @book = book
    book.rentals.push(self)

    @person = person
    person.rentals.push(self)
  end

  def self.create_rental(rentals, books, people)
    puts 'Select a book from the following list by number'
    Book.list_books(books)
    book_index = gets.chomp.to_i

    puts 'Select a person from the following list by number (not id)'
    Person.list_people(people)
    person_index = gets.chomp.to_i

    puts 'Date: '
    date = gets.chomp

    rental = Rental.new(date, books[book_index], people[person_index])
    rentals.push(rental)
    puts 'Rental created successfully'
  end

  def self.list_rentals_for_person_id(rentals, people)
    puts 'Select a person from the following list by number (not id)'
    people.each do |person|
      puts "ID: #{person.id} - #{person.name}"
    end
    puts 'ID of person: '
    id = gets.chomp.to_i
    puts 'Rentals:'
    rentals.each do |rental|
      puts "Date: #{rental.date}, Book \"#{rental.book.title}\" by #{rental.book.author}" if rental.person.id == id
    end
  end
end
