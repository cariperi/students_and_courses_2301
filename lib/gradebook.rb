class Gradebook
  attr_reader :instructor,
              :courses

  def initialize(instructor)
    @instructor = instructor
    @courses = []
  end

  def add_course(course)
    @courses << course
    @courses
  end

  def list_all_students
    students = {}
    @courses.each do |course|
        students[course] = course.students
      end
    students
  end

  def students_below(threshold)
    all_students = @courses.map{|course| course.students}.flatten
    all_students.find_all{|student| student.grade < threshold}
  end

  def all_grades
    all_students = @courses.map{|course| course.students}.flatten
    all_students.map{|student| student.grade}.sort
  end

  def students_with_grades(low_end, high_end)
    all_students = @courses.map{|course| course.students}.flatten
    all_students.find_all{|student| grade_in_range?(student.grade, low_end, high_end)}
  end

  def grade_in_range?(grade, low_end, high_end)
    (grade >= low_end) && (grade <= high_end)
  end
end
