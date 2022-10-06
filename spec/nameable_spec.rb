require_relative '../person'
require_relative '../nameable'
require_relative './mockp'

describe Nameable do
  context 'Check if method implemented' do
    it 'Not to Raise an error' do
      person = Person.new(30, 'ValentinaKarla', true)
      expect { person.correct_name }.not_to raise_error(NotImplementedError, "Person has not implemented method 'correct_name'")
    end
    it 'to Raise an error' do
      person2 = NewPerson.new
      expect { person2.correct_name }.to raise_error(NotImplementedError, "NewPerson has not implemented method 'correct_name'")
    end
  end
end
