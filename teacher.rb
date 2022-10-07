require './person'

class Teacher < Person
  attr_accessor :specialization

  def initialize(specialization, age, name, id)
    super(age, name)
    @specialization = specialization
    @id = id || Random.rand(1..1000)
  end

  def can_use_services?
    true
  end
end
