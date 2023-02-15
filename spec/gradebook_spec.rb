require 'rspec'
require './lib/student'
require './lib/course'
require './lib/gradebook'

describe Gradebook do
  before(:each) do
    @course1 = Course.new("Calculus", 2)
    @course2 = Course.new("English", 4)
    @student1 = Student.new({name: "Morgan", age: 21})
    @student2 = Student.new({name: "Jordan", age: 29})
    @student3 = Student.new({name: "Kate", age: 25})
    @gradebook = Gradebook.new("Prof. Turing")
  end

  describe '#initialize' do
    it 'exists' do
      expect(@gradebook).to be_a Gradebook
    end

    it 'has an instructor' do
      expect(@gradebook.instructor).to eq("Prof. Turing")
      expect(@gradebook.instructor).to be_a String
    end

    it 'starts with no courses by default' do
      expect(@gradebook.courses).to eq([])
      expect(@gradebook.courses).to be_a Array
    end
  end
end
