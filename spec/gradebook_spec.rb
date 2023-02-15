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

  describe '#add_course' do
    it 'can add courses to the gradebook' do
      expect(@gradebook.courses).to eq([])

      @gradebook.add_course(@course1)
      @gradebook.add_course(@course2)

      expect(@gradebook.courses).to eq([@course1, @course2])
    end

    it 'returns a list of all courses' do
      @gradebook.add_course(@course1)

      expect(@gradebook.add_course(@course2)).to eq([@course1, @course2])
      expect(@gradebook.add_course(@course2)[0]).to be_a Course
    end
  end

  describe '#list_all_students' do
    it 'returns a hash of Courses and their students' do
      @course1.enroll(@student1)
      @course1.enroll(@student2)
      @course2.enroll(@student3)
      @gradebook.add_course(@course1)
      @gradebook.add_course(@course2)

      expect(@gradebook.list_all_students).to be_a Hash
      expect(@gradebook.list_all_students.keys).to eq([@course1, @course2])
      expect(@gradebook.list_all_students.values).to eq([[@student1, @student2], [@student3]])
      expect(@gradebook.list_all_students[:course1]).to eq([@student1, @student2])
      expect(@gradebook.list_all_students[:course2]).to eq([@student3])
    end
  end
end
