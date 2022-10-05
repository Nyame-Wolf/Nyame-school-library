require './person'

class Student < Person
  attr_accessor :classroom

  def initialize(age, name, parent_permission, id)
    super(age, name, parent_permission)
    @classroom = classroom
    @id = id || Random.rand(1..1000)
  end

  def play_hooky
    "¯\(ツ)/¯"
  end

  def update_classroom(classroom)
    classroom.students.push(self) unless classroom.students.include?(self)
  end
end
