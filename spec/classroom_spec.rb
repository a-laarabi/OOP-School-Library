require_relative '../classes/classroom'

describe Classroom do
  context 'Instanciate the classroom object' do
    classroom = Classroom.new 'X'

    it 'should print classroom label' do
      expect(classroom.label).to eql 'X'
    end
  end
end
