require_relative '../person'
require_relative '../capitalize_decorator'

describe 'Testing the decorator classes' do
  before :each do
    @person = Person.new(25, 'ahmad', true)
  end

  it 'should return Ahmad' do
    cap_name = CapitalizeDecorator.new(@person)
    cap_name.correct_name.should eql 'Ahmad'
  end
end
