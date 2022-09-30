require './person'

class Student < Person
  attr_accessor :classroom

  def initialize(classroom = '', *args)
    super(*args)
    @classroom = classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end

  def update_classroom(classroom)
    classroom.students.push(self) unless classroom.students.include?(self)
  end
end
