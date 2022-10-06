class Classroom
  attr_accessor :label, :students

  def initialize(label)
    @label = label
    @students = []
  end

  def add_students(student)
    @student.push(student)
    student.classroom = self
  end
end
