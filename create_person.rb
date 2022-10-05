class PersonCreator
  @user_input = 0

  def self.create_person(array)
    @user_input = gets.chomp.to_i
    print 'Age: '
    age = gets.chomp.to_i

    print 'Name: '
    name = gets.chomp
    case @user_input
    when 1
      print 'Has parent permission? [Y | N] '
      parent_permission = gets.chomp.downcase

      array << Student.new(age, name, parent_permission, nil)
    when 2
      print 'Specialization: '
      specialization = gets.chomp
      array << Teacher.new(specialization, age, name, nil)
    end
    puts '\nPerson created successfully'
  end
end
