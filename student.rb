require_relative 'person'

class Student < Person
  attr_accessor :classroom

  def intialize(classroom)
    @classroom = classroom
    super(
      age,
      name,
      parent_permission
    )
  end

  def add_classroom(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end
