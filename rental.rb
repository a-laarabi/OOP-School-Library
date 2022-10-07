class Rental
  attr_accessor :date, :person, :book

  def initialize(person, book, date)
    @person = person
    @book = book
    @date = date

    person.rental << self
    book.rental << self
  end
end
