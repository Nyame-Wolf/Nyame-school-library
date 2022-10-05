require './person'

class Teacher < Person
  def initialize(specialization, age, name, id)
    super(name, age)
    @specialization = specialization
    @id = id || Random.rand(1..1000)
  end

  attr_accessor :specialization

  def can_use_services?
    true
  end
end
