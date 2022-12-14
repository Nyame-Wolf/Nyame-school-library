require './student'
require './teacher'
require './book'
require './rental'
require './capitalize_decorator'
require './menu'
require './persist_data'
require './create_person'

class App < Menu
  def initialize
    @user_input = 0
    @book_list = PersistData.load_books
    @people = PersistData.load_people
    @rental_list = PersistData.load_rentals(@book_list, @people)
    super
  end

  def switch_case
    case @user_input
    when 1 then list_all_books
    when 2 then list_all_people
    when 3
      puts 'Do you want to create a student(1) or a teacher(2)? [Input The Number]:'
      PersonCreator.create_person(@people)
    when 4
      Book.create_book(@book_list)
    when 5 then create_rental
    when 6 then list_all_rental
    when 7 then exit_app
    end
  end

  def wrong_input
    puts "Please Enter a number in the menu\n"
  end

  def run
    run_menu
  end

  def list_all_books
    if @book_list.empty?
      puts "\nThere are no books here"
    else
      @book_list.each { |book| puts %(Title: "#{book.title}", Author: #{book.author}) }
    end
  end

  def list_all_people
    if @people.empty?
      puts "\nThere are no people here"
    else
      @people.each { |person| puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}" }
    end
  end

  def exit_app
    puts 'Thank you for using this app'
    PersistData.store_books(@book_list)
    PersistData.store_people(@people)
    PersistData.store_rentals(@rental_list)
    exit
  end

  def create_rental
    if @book_list.empty?
      puts "\nThere are no books available for rent. Want to create one? Enter 4:"
      run
    else
      puts 'Select a book from the following list by number'
      @book_list.each_with_index { |book, index| puts "#{index}) Title: #{book.title}, Author: #{book.author}" }
    end
    rented_book = gets.chomp.to_i
    if @people.empty?
      puts "\nNo users Exist in the system. Want to create one? Enter 3:"
      run
    else
      puts "\nSelect a person from the following list by number (not id):"
      @people.each_with_index do |person, index|
        puts "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      end
    end

    renter = gets.chomp.to_i
    puts 'Date:'
    date = gets.chomp
    @rental_list << Rental.new(date, @book_list[rented_book], @people[renter])
    puts '\nRental created successfully'
  end

  def list_all_rental
    print "\nID of person:"
    person_id = gets.chomp.to_i
    puts "\nRentals:"
    @people.find { |person| person.id == person_id }.rentals.each do |rental|
      puts "Date: #{rental.date}, Book: '#{rental.book.title}' by #{rental.book.author}\n"
    end
  end
end
