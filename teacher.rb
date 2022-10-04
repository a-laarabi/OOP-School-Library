require_relative 'person'

class Teacher < Person
  attr_accessor :specialization

  def can_use_services?
    true
  end

  def initialize(age, specialization, name = 'Unknown', parent_permission: true)
    @specialization = specialization
    
    super(name, age, parent_permission)
  end
end