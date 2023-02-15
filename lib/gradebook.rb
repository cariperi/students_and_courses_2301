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
end
