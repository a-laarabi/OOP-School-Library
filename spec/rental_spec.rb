require_relative '../classes/rental'
require_relative '../classes/book'
require_relative '../classes/person'

describe Rental do
  let(:rental) { 
    Rental.new('2020-01-01', Book.new('book', 'author'), Person.new(55, 'Name_2'))
   }

  describe '#new' do
    it 'creates a new rental' do
      expect(rental).to be_an_instance_of(Rental)
    end

    it 'test date' do
      expect(rental.date).to eq('2020-01-01')
    end

    it 'the book has a title' do
      expect(rental.book.title).to eq('book')
    end

    it 'author name' do
      expect(rental.book.author).to eq('author')
    end

    it 'name of the person rented the book' do
      expect(rental.person.name).to eq('Name_2')
    end

    it 'age of the person rented the book' do
      expect(rental.person.age).to eq(55)
    end

  end
end