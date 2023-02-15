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
    @student4 = Student.new({name: "Alice", age: 30})
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

    it 'can return a list of all courses' do
      @gradebook.add_course(@course1)

      expect(@gradebook.add_course(@course2)).to eq([@course1, @course2])
      expect(@gradebook.add_course(@course2)[0]).to be_a Course
    end
  end

  describe '#list_all_students' do
    it 'can return a hash of Courses and their students' do
      @course1.enroll(@student1)
      @course1.enroll(@student2)
      @course2.enroll(@student3)
      @gradebook.add_course(@course1)
      @gradebook.add_course(@course2)

      expect(@gradebook.list_all_students).to be_a Hash
      expect(@gradebook.list_all_students.keys).to eq([@course1, @course2])
      expect(@gradebook.list_all_students.values).to eq([[@student1, @student2], [@student3]])
      expect(@gradebook.list_all_students[@course1]).to eq([@student1, @student2])
      expect(@gradebook.list_all_students[@course2]).to eq([@student3])
    end
  end

  describe '#students_below' do
    it 'can return a list of students with grades below a given threshold' do
      @student1.log_score(50)
      @student2.log_score(100)
      @student3.log_score(75)
      @student4.log_score(60)
      @course1.enroll(@student1)
      @course1.enroll(@student2)
      @course2.enroll(@student3)
      @course2.enroll(@student4)
      @gradebook.add_course(@course1)
      @gradebook.add_course(@course2)

      expect(@gradebook.students_below(60)).to be_a Array
      expect(@gradebook.students_below(60)[0]).to be_a Student
      expect(@gradebook.students_below(60)).to eq([@student1])
      expect(@gradebook.students_below(60)).to_not include(@student4)
    end
  end

  describe '#all_grades' do
    it 'can print grades for all courses' do
      @student1.log_score(50)
      @student1.log_score(100)
      @student2.log_score(100)
      @student3.log_score(75)
      @student4.log_score(60)
      @course1.enroll(@student1)
      @course1.enroll(@student2)
      @course2.enroll(@student3)
      @course2.enroll(@student4)
      @gradebook.add_course(@course1)
      @gradebook.add_course(@course2)

      expect(@gradebook.all_grades).to be_a Array
      expect(@gradebook.all_grades.count).to eq(4)
      expect(@gradebook.all_grades).to eq([60, 75, 75, 100])
    end
  end

  describe '#students_with_grades' do
    it 'can return all students with grades in a given range' do
      @student1.log_score(50)
      @student1.log_score(100)
      @student2.log_score(100)
      @student3.log_score(75)
      @student4.log_score(60)
      @course1.enroll(@student1)
      @course1.enroll(@student2)
      @course2.enroll(@student3)
      @course2.enroll(@student4)
      @gradebook.add_course(@course1)
      @gradebook.add_course(@course2)

      expect(@gradebook.students_with_grades(70, 100)).to be_a Array
      expect(@gradebook.students_with_grades(70, 100)[0]).to be_a Student
      expect(@gradebook.students_with_grades(70, 100)).to eq([@student1, @student2, @student3])
      expect(@gradebook.students_with_grades(70, 100)).to_not include (@student4)
    end
  end

  describe '#grade_in_range' do
    it 'can check to see if a grade is within a given range' do
      @student1.log_score(50)
      @student2.log_score(100)

      expect(@gradebook.grade_in_range?(@student1.grade, 70, 100)).to be false
      expect(@gradebook.grade_in_range?(@student2.grade, 70, 100)).to be true
    end
  end
end
