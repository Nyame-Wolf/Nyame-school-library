require_relative '../book'
describe Book do
  context 'Testing Book' do
    it 'creates a new Book instance' do
      book = Book.new('New Dawn', 'James', 1)
      expect(book.title).to eq('New Dawn')
    end
  end
end
