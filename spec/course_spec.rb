require 'rspec'
require './lib/student'
require './lib/course'

describe Course do
  before(:each) do
    @course = Course.new("Calculus", 2)
    @student1 = Student.new({name: "Morgan", age: 21})
    @student2 = Student.new({name: "Jordan", age: 29})
  end

  describe '#initialize' do
    it 'exists' do
      expect(@course).to be_a Course
    end

    it 'has a name' do
      expect(@course.name).to eq("Calculus")
    end

    it 'has a capacity' do
      expect(@course.capacity).to eq(2)
    end

    it 'starts with no students by default' do
      expect(@course.students).to eq([])
    end
  end

  describe '#full?' do
    it 'can respond false when course is not at capacity' do
      expect(@course.full?).to be false
    end

    it 'can respond true when course is at capacity' do
      @course.enroll(@student1)
      @course.enroll(@student2)

      expect(@course.full?).to be true
    end
  end

  describe '#enroll' do
    it 'can add students to the course' do
      expect(@course.students).to eq([])

      @course.enroll(@student1)
      @course.enroll(@student2)

      expect(@course.students).to eq([@student1, @student2])
    end
  end
end
