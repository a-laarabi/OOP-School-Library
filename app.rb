require_relative './classes/book'
require_relative './classes/person'
require_relative './classes/student'
require_relative './classes/teacher'
require_relative './classes/rental'
require 'date'

class App
  attr_accessor :people, :books

  def initialize
    @people = []
    @books = []
    @rentals = []
  end

  def create_person
    puts 'Do you whant to create a Student (1) 0r Teacher (2)? [input the number]'
    input = gets.chomp.to_i
    case input
    when 1
      create_student
    when 2
      create_teacher
    else
      puts 'incorrect choice'
    end
  end

  def create_book
    puts 'Create a Book'
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    book = Book.new(title, author)
    @books.push(book)
    puts 'Book created successfully'
  end

  def create_rental
    puts 'Select a book from the following list by number'
    list_books
    book_index = gets.chomp.to_i
    puts 'Select a person from the following list by number (not id)'
    list_people
    person_index = gets.chomp.to_i
    print "Date: #{Date.today}"
    date = gets.chomp
    rental = Rental.new(@people[person_index], @books[book_index], date)
    @rentals.push(rental)
    puts 'Rental created successfully'
  end

  def list_books
    return puts 'No books found!' if @books.empty?

    @books.each_with_index { |book, index| puts "#{index}) Title: #{book.title}, Author: #{book.author}" }
  end

  def list_people
    return puts 'No people found!' if @people.empty?

    @people.each_with_index do |person, i|
      puts "#{i}) [#{person.class}] Name: #{person.name}, Age: #{person.age}, ID: #{person.id}"
    end
  end

  def list_rentals
    puts 'Enter ID of the person'
    list_people
    person_id = gets.chomp.to_i
    person = @people.select { |p| p.id == person_id }[0]
    person.rentals.each_with_index { |rental, i| puts "#{i}) Book: #{rental.book.title}, Date: #{rental.date}" }
  end

  def create_student
    puts 'Create a Student'
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    puts 'Has parent permissiom [Y/N]?'
    parent_permission = gets.chomp.downcase
    student = Student.new(age, name, parent_permission)
    @people.push(student)
    puts 'Student created successfully'
  end

  def create_teacher
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Specialization: '
    specialization = gets.chomp
    teacher = Teacher.new(age, name, specialization)
    @people.push(teacher)
    puts 'Teacher created successfully'
  end
end