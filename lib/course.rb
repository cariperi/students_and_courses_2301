class Course
  attr_reader :name,
              :capacity,
              :students
  def initialize(name, capacity)
    @name = name
    @capacity = capacity
    @students = []
  end

  def full?
    @students.count >= @capacity
  end
end
