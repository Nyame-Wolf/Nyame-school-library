require 'json'
require 'pry'

class PersistData
  def self.store_books(books)
    data = []
    file = './books.json'
    books.each do |book|
      data << { title: book.title, author: book.author, id: book.id }
    end
    File.write(file, JSON.pretty_generate(data))
  end

  def self.load_books
    file = './books.json'
    data = []
    if File.exist?(file)
      JSON.parse(File.read(file)).each do |book|
        data << Book.new(book['title'], book['author'], book['id'])
      end
    end
    data
  end

  def self.store_people(people)
    data = []
    file = './person.json'

    people.each do |person|
      case person.class.to_s
      when 'Student'
        data << { type: person.class, age: person.age, name: person.name,
                  parent_permission: person.parent_permission, id: person.id }
      when 'Teacher'
        data << { type: person.class, age: person.age, name: person.name,
                  specialization: person.specialization, id: person.id }
      end
    end
    File.write(file, JSON.pretty_generate(data))
  end

  def self.load_people
    file = './person.json'
    data = []
    if File.exist?(file)
      JSON.parse(File.read(file)).each do |person|
        case person['type']
        when 'Student'
          data << Student.new(person['age'], person['name'], person['parent_permission'], person['id'])
        when 'Teacher'
          data << Teacher.new(person['specialization'], person['age'], person['name'], person['id'])
        end
      end
    end
    data
  end

  def self.store_rentals(rentals)
    data = []
    file = './rentals.json'

    rentals.each do |rental|
      data << { id: rental.id, book: rental.book.id, person: rental.person.id, date: rental.date }
    end
    File.write(file, JSON.pretty_generate(data))
  end

  def self.load_rentals(books, people)
    file = './rentals.json'
    data = []
    if File.exist?(file)

      JSON.parse(File.read(file)).each do |rental|
        book_id = books.find do |book|
          book.id == rental['book']
        end

        person_id = people.find do |person|
          person.id == rental['person']
        end

        data << Rental.new(rental['date'], book_id, person_id)
      end
    end
    data
  end
end
