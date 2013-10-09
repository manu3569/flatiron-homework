class School

  attr_accessor :name, :roster

  def initialize(name)
    @name = name
    @roster = {}
      
  end  
  
  def add_student(name, grade)
    roster[grade] ||= []
    roster[grade] << name
  end

  def grade(grade)
    roster[grade]
  end

  def sort
    Hash[roster.sort.map {|grade,students| [grade,students.sort] }]
  end

end