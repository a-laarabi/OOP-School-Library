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
    puts "Today: #{Date.today}"
    print 'Enter date of the rental: '
    date = gets.chomp
    @rentals << Rental.new(@people[person_index], @books[book_index], date)
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
    puts 'Enter ID of the person (not number)'
    list_people
    person_id = gets.chomp.to_i

    is_id_exist = @people.any? { |person| person.id == person_id }
    if is_id_exist
      puts
      puts "_ _ _Rentals for person id: #{person_id}_ _ _"
      @rentals.each do |rental|
        if rental.person.id == person_id
          puts "Date: #{rental.date}, Book: #{rental.book.title} by #{rental.book.author}"
        end
      end
    else
      puts 'ID not found'
    end
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

  def call_app(choice)
    case choice
    when 1
      list_books
    when 2
      list_people
    when 3
      create_person
    when 4
      create_book
    when 5
      create_rental
    when 6
      list_rentals
    when 7
      puts 'Thanks for using this app!'
      break
    else
      puts 'Invalid input'
    end
  end
end
