require './student'
require './teacher'
require './book'
require './rental'
require './capitalize_decorator'
class App
  def initialize
    @user_input = 0
    @book_list = []
    @people = []
    @rental_list = []
  end

  def run
    loop do
      print "\nPlease choose an option by entering a number:\n1 - List all books\n2 - List all people\n3 - Create a person\n4 - Create a book\n5 - Create a rental\n6 - List all rentals for a given person id\n7 - Exit\n"
      @user_input = gets.chomp.to_i
      (1..7).include?(@user_input) ? switch_case : wrong_input
    end
  end

  def switch_case
    case @user_input
    when 1 then list_all_books
    when 2 then list_all_people
    when 3
      puts 'Do you want to create a student(1) or a teacher(2)? [Input The Number]:'
      create_person
    when 4 then create_book
    when 5 then create_rental
    when 6 then list_all_rental
    when 7 then exit_app
    end
  end

  def wrong_input
    puts "Please Enter a number in the menu\n"
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
    exit
  end

  def create_person
   
    @user_input = gets.chomp.to_i
    print 'Age: '
    age = gets.chomp.to_i

    print 'Name: '
    name = gets.chomp
    case @user_input
    when 1
      print 'Has parent permission? [Y | N] '
      parent_permission = gets.chomp.downcase
      parent_permission = parent_permission == 'y'

      @people << Student.new('none', age, name, parent_permission)
    when 2
      print 'Specialization: '
      specialization = gets.chomp
      parent_permission = true

      @people << Teacher.new(age, name, parent_permission, specialization)
    end
    puts '\nPerson created successfully'
  end

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp

    @book_list << Book.new(title, author)
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
    @rental_list << Rental.new(@people[renter], @book_list[rented_book], date)
    puts '\nPerson created successfully'
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
