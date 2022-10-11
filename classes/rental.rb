require_relative 'book'

class Rental
  attr_accessor :date, :book, :person

  def initialize(date, book, person)
    @person = person
    @book = book
    @date = date

    person.rentals << self
    book.rentals << self
  end
end
