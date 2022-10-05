class Book
  attr_accessor :title, :author, :id, :rentals

  def initialize(title, author, id)
    @id = id || Random.rand(1..1000)
    @title = title
    @author = author
    @rentals = []
  end

  def self.create_book(array)
    print 'Title: '
    @title = gets.chomp
    print 'Author: '
    @author = gets.chomp
    array << Book.new(@title, @author, nil)
    puts '\nBook created successfully'
  end

  def add_person(person, date)
    @rentals << Rental.new(person, date, self)
  end
end
