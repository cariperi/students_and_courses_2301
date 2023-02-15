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
end
