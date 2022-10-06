class Rental
  attr_accessor :date, :book, :person, :id

  def initialize(date, book, person)
    @date = date
    @book = book
    @person = person
  end
end
