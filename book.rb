class Book
  attr_accessor :title, :author
  attr_reader :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def add_person(person, date)
    @rentals << Rental.new(person, date, self)
  end
end
