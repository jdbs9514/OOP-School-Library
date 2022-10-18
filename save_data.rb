require 'json'

# @id=94, @name="John", @age=22, @parent_permission=true, @rentals=[], @classroom="Alpha"

class SaveData 
  def save_books(books)
    file_path = "./DATA/books.json"
    unless File.exists?(file_path) # check if file exist
      # create a file if it doesn't
    end
    # save data into file
    if File.exists?(file_path)
      books_hash = []
      books.each do |book|
        books_hash.push({
        id: book.id,
        title: book.title,
        author: book.author,
        rentals: book.rentals,
        })
      end
      File.write(file_path, JSON.pretty_generate(books_hash))
    end
  end

  def save_people(people)
    file_path = "./DATA/people.json"
    unless File.exists?(file_path) # check if file exist
      # create a file if it doesn't
    end
    # save data into file
    if File.exists?(file_path)
      people_hash = []
      people.each do |person|
        case person
        when .is_a?(Student)
          people_hash.push({
            id: person.id,
            name: person.name,
            age: person.age,
            parent_permission: person.parent_permission,
            rentals: person.rentals,
            classroom: person.classroom,
            })
        when .is_a?(Teacher)
          people_hash.push({
            id: person.id,
            name: person.name,
            age: person.age,
            rentals: person.rentals,
            specialization: person.specialization,
            })
        end
      end
      File.write(file_path, JSON.pretty_generate(people_hash))
    end
  end
  def save_rentals(rentals)
    file_path = "./DATA/rentals.json"
    unless File.exists?(file_path) # check if file exist
      # create a file if it doesn't
    end
    # save data into file
    if File.exists?(file_path)
      rentals_hash = []
      data.each do |rental|
        rentals_hash.push({
          id: rental.id,
          date: rental.date,
          book: rental.book,
          person: rental.person,
          })
      # save JSON in a file
      File.write(file_path, JSON.pretty_generate(rentals_hash))
    end
  end
end