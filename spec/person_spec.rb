require_relative '../person'
describe Person do
  context 'should create an isnance of Person' do
    person = Person.new(30, 'ValentinaKarla', true)

    it 'returns an object of person' do
      expect(person.class) == Person
    end

    it 'returns expected value for name' do
      expect(person.name).to eq 'ValentinaKarla'
    end
  end

  context 'should create an instance of Person class' do
    person1 = Person.new(28, 'Vitoria', false)
    it 'Correct name' do
      expect(person1.correct_name).to eq 'Vitoria'
    end

    it 'Use Service' do
      expect(person1.can_use_services?).to eq true
    end

    it 'Use Service' do
      person1.age = 17
      expect(person1.can_use_services?).to eq false
    end
  end
end
