class Rental
  attr_accessor :date
  attr_reader :person, :book

  def initialize(person, book, date)
    @person = person
    @book = book
    @date = date

    person.rental << self
    book.rentals << self
  end
end
