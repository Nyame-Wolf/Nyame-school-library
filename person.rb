require './nameable'
require './decorator'
require './trimmer_decorator'
require './capitalize_decorator'

class Person < Nameable
  def initialize(age, name, parent_permission)
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end
  attr_reader :id, :rentals
  attr_accessor :name, :age, :parent_permission

  def can_use_services?
    of_age? || @parent_permission ? true : false
  end

  def correct_name
    @name
  end

  def add_book(book, date)
    @rentals << Rental.new(book, date, self)
  end

  private

  def of_age?
    @age <= 18
  end
end
