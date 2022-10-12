require_relative './classes/book'
require_relative './classes/person'
require_relative './classes/student'
require_relative './classes/teacher'
require_relative './classes/rental'
require_relative './menu'
require 'date'
require_relative './data/preserve_data'

class App # rubocop:disable Metrics/ClassLength
  attr_accessor :people, :books

  def initialize
    @people = []
    @books = []
    @rentals = []
    @menu = Menu.new
  end

  def load_data
    load_books
    load_people
    load_rentals
  end

  def list_menu
    @menu.list_actions
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
    list_menu
    run
  end

  def create_book
    puts 'Create a Book'
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    book = Book.new(title, author)
    @books.push(book)
    save_book(title, author)
    puts 'Book created successfully'
    list_menu
    run
  end

  def create_rental
    puts 'Select the book from the following list by number (not ID)'
    @books.each_with_index do |book, index|
      puts "#{index}) Title: '#{book.title}', Author: '#{book.author}'"
    end

    selected_book = gets.chomp.to_i
    puts 'Date:'
    date = gets.chomp

    puts 'Select a person from the following list by number (not ID)'
    @people.each_with_index do |person, index|
      puts "#{index}) [#{person.class.name}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    selected_person = gets.chomp.to_i

    rental = Rental.new(date, @books[selected_book], @people[selected_person])
    @rentals.push(rental)
    save_rentals(date, @books[selected_book], @people[selected_person])
    puts "Rental #{@books[selected_book].title} added"
    list_menu
    run
  end

  def list_books
    puts 'No books found!' if @books.empty?

    @books.each_with_index { |book, index| puts "#{index}) Title: #{book.title}, Author: #{book.author}" }
    list_menu
    run
  end

  def list_people
    puts 'No people found!' if @people.empty?

    @people.each_with_index do |person, i|
      puts "#{i}) [#{person.class}] Name: #{person.name}, Age: #{person.age}, ID: #{person.id}"
    end
    list_menu
    run
  end

  def list_rentals
    puts 'Enter ID of the person (not number)'

    id = gets.chomp.to_i
    puts "Rentals by PersonID:#{id}"

    rentals = @rentals.select { |rental| id == rental.person.id }

    if rentals.empty?
      puts 'no rental'
      list_menu
      run
    else

      rentals.each do |item|
        puts "Date: #{item.date},  Book #{item.book.title}, by #{item.book.author}"
        list_menu
        run
      end
    end
  end

  def create_student
    puts 'Create a Student'

    print 'Age: '
    age = gets.chomp.to_i

    print 'Name: '
    name = gets.chomp

    puts 'Has parent permissiom [Y/N]?'
    parent_permission = gets.chomp.upcase
    case parent_permission
    when 'Y'
      parent_permission = true
    when 'N'
      parent_permission = false
    end

    student = Student.new(nil, age, name, parent_permission: parent_permission)
    @people.push(student)
    save_student(name, age, parent_permission)
    puts 'Student created successfully'
  end

  def create_teacher
    print 'Age: '
    age = gets.chomp.to_i

    print 'Name: '
    name = gets.chomp

    print 'Specialization: '
    specialization = gets.chomp

    puts 'Has parent permission? [Y/N]'
    parent_permission = gets.chomp.upcase
    case parent_permission
    when 'Y'
      parent_permission = true
    when 'N'
      parent_permission = false
    end

    teacher = Teacher.new(age, specialization, name, parent_permission: parent_permission)
    @people.push(teacher)
    save_teacher(name, age, specialization)
    puts 'Teacher created successfully'
  end

  def run
    choice = gets.chomp.to_i
    call_app(choice)
  end

  def call_app(choice) # rubocop:disable Metrics/CyclomaticComplexity
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
      exit
    else
      puts 'Invalid input'
      run
    end
  end
end
