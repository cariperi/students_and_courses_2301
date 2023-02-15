require 'rspec'
require './lib/student'

describe Student do
  before(:each) do
    @student = Student.new({name: "Morgan", age: 21})
  end

  describe '#initialize' do
    it 'exists' do
      expect(@student).to be_a Student
    end

    it 'has a name' do
      expect(@student.name).to eq("Morgan")
    end

    it 'has an age' do
      expect(@student.age).to eq(21)
    end

    it 'starts with no scores by default' do
      expect(@student.scores).to eq([])
    end
  end
end
