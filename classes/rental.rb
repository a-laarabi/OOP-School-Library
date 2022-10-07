class Rental
  attr_accessor :date, :book, :person

  def initialize(person, book, date)
    @person = person
    @book = book
    @date = date

    person.rental << self
    book.rentals << self
  end
end
