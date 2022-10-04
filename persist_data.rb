require 'json'

class PersistData
  def store_books(books)
    data = []
    file = './books.json'
    return unless File.exist?(file)

    books.each do |book|
      data << {title: book.title, author: book.author}
    end
    File.write(file, JSON.generate(data))
  end

  def load_books
    data = []
    file = './books.json'
    return unless File.exist?(file) && File.read(file) != ''

    JSON.parse(File.read(file).each do |book|
      data << Book.new(book['title'], book['author']))
    end
    data
  end

   def store_people(people)
   data = []

    file = './person.json'
    return unless File.exist?(file)
    people.each do |person|
      if person.class = Student
      data  << { Student: person.class,  age: person.age, name: person.name, parent_permission: person.parent_permission}
      else
      data << { Teacher: person.class, age: person.age, name: person.name, parent_permission: person.parent_permission, specialization: person.specialization}
      end
    end
     File.write(file, JSON.generate(data))
  end

  def load_people
    data
    file = './person.json'
    return unless File.exist?(file) && File.read(file) != ''

    JSON.parse(File.read(file).each do |person|
      data << Student.new(person['age'], person['name'],person[parent_permission])
      data << Teacher.new(person['age'],person['name'],person[parent_permission], specialization['specialization']))
    end
    data
  end

  def store_rentals(rental)
    data = []
    file = './rentals.json'
    return unless File.exist?(file)

    rentals.each do |rental|
      data << {id: rental.id, book: rental.book.id, person: rental.person.id, date: rental.Date}
    end
    File.write(file, JSON.generate(data))
  end

  def load_rentals
    data = []
    file = './rentals.json'
    return unless File.exist?(file)

    JSON.parse(File.read(file).each do |rental|
    data << Rental.new(rental['date'], rental['book'],
    books.find do |book|
    book.id == rental['book']
    end, 
    person.find do |person|
    person.id == rental['book']
    end
    )
    )
  end 
  data
end
