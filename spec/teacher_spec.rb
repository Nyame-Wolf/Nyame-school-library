require_relative '../teacher'
require_relative '../person'

describe Teacher do
  before :each do
    @teacher = Teacher.new('math', 'Ahmad', 30, 687)
  end

  it 'teacher should be an instance of Person' do
    @teacher.should be_a Person
  end

  it "teacher\'s age should be 30" do
    @teacher.age.should eq 30
  end

  it "teacher\'s name should be Ahmad" do
    @teacher.name.should eql 'Ahmad'
  end

  it "teacher\'s specialization should be math" do
    @teacher.specialization.should eql 'math'
  end

  it 'can_use_services? should return true' do
    @teacher.can_use_services?.should eq true
  end
end
