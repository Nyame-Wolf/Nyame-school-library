require 'person'

class Student < Person
  attr_accessor :classroom

  def initialize(*args, classroom)
    super(*args)
    @classroom = classroom
    update_classroom(@classroom)
  end

  def play_hooky
    "¯\(ツ)/¯"
  end

  def update_classroom(classroom)
    classroom.students.push(self) unless classroom.students.include?(self)
  end
end
