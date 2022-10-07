require './rental'
require './teacher'
require './book'

describe Rental do
  before :each do
    @person = Teacher.new('Math', 23, 'Ahmed', 99)
    @book = Book.new('title', 'author', 30)
    @date = '03/04/2020'
    @rental = Rental.new(@date, @book, @person)
  end

  it 'Creates instance with correct info' do
    expect([@rental.book, @rental.person, @rental.date]).to eq [@book, @person, @date]
  end

  it 'Add rental to person_renting rentals' do
    person_rentals = @person.rentals.include?(@rental)
    expect(person_rentals).to eq true
  end

  it 'Add rental to book rentals' do
    book_rentals = @book.rentals.include?(@rental)
    expect(book_rentals).to eq true
  end
end
