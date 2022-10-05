class BookCreator
  @title = 'unknown'
  @author = 'unknown'
  def self.create_book(array)
    print 'Title: '
    @title = gets.chomp
    print 'Author: '
    @author = gets.chomp
    array << Book.new(@title, @author)
    puts '\nBook created successfully'
  end
end
