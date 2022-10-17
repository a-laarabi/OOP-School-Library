require_relative '../classes/book'
require_relative '../classes/rental'

describe Book do
  context 'Instantiate the book object' do
    book = Book.new 'title', 'author'

    it 'should print the title' do
      expect(book.title).to eq 'title'
    end

    it 'should print the author' do
      expect(book.author).to eql 'author'
    end
  end
end
