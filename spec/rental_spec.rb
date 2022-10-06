require_relative '../rental'
require_relative '../person'

describe Rental do
  before :each do
    @rental = Rental.new('01/02/2020', 'Alchemist', 1)
  end

  it "the rentee\'s id should be 1" do
    @rental.person.should eq 1
  end

  it "rental\'s date should be 01/02/2020" do
    @rental.date.should eql '01/02/2020'
  end

  it "rental\'s book should be Alchemist" do
    @rental.book.should eql 'Alchemist'
  end
end
