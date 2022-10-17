require_relative '../classes/teacher'
describe Teacher do
  let(:teacher) { Teacher.new(75, 'Math', 'Frederick') }

  describe '#new' do
    it 'creates a new teacher' do
      expect(teacher).to be_an_instance_of(Teacher)
    end

    it 'has an age' do
      expect(teacher.age).to eq(75)
    end

    it 'has a name' do
      expect(teacher.name).to eq('Frederick')
    end

    it 'has a specialization' do
      expect(teacher.specialization).to eq('Math')
    end
  end
end
