class Rental
  attr_accessor :date, :book, :person

  def initialize(person, book, date)
    @date = date

    @person = person
    person.rentals << self

    @book = book
    book.rentals << self
  end
end
