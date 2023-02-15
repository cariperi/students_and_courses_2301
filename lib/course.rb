class Course
  attr_reader :name,
              :capacity,
              :students
  def initialize(name, capacity)
    @name = name
    @capacity = capacity
    @students = []
  end
end
