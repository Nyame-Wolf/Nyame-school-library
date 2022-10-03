class Menu 
  
  def run_menu
    loop do
      print "\nPlease choose an option by entering a number:\n1 - List all books\n2 - List all people\n3 - Create a person\n4 - Create a book\n5 - Create a rental\n6 - List all rentals for a given person id\n7 - Exit\n"
      @user_input = gets.chomp.to_i
      (1..7).include?(@user_input) ? switch_case : wrong_input
    end
  end
end