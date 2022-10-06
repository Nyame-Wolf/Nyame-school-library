require_relative '../student'
require_relative '../classroom'

describe 'Student' do
  before :each do
    @id = 50
    @age = 11
    @name = 'Vitoria'
    @parent_permission = true
    @student = Student.new(@age, @name, @parent_permission, @id)
    @classroom = Classroom.new(@id)
  end
  it 'Paly hooky' do
    expect(@student.play_hooky).to eq "¯\(ツ)/¯"
  end
  it 'Classroom' do
    expect(@classroom).to be_an_instance_of Classroom
  end
end
