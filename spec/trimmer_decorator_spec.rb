require_relative '../person'
require_relative '../trimmer_decorator'
describe TrimmerDecorator do
  context 'Use decorator to trim name' do
    it 'Return a name with only 10 characters' do
      person = Person.new(30, 'ValentinaKarla', true)
      trimmed_name = TrimmerDecorator.new(person)
      expect(trimmed_name.correct_name).to eq('ValentinaK')
    end
  end
end