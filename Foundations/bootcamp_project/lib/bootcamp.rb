class Bootcamp

  def initialize(name, slogan, student_capacity)
    @name = name
    @slogan = slogan
    @student_capacity = student_capacity
    @teachers = Array.new
    @students = Array.new
    @grades = Hash.new{|hash, key| hash[key] = []  }
  end

  def name
    @name
  end

  def slogan
    @slogan
  end

  def teachers
    @teachers
  end
  
  def students
    @students
  end

  def hire(teacher)
    @teachers << teacher
  end

  def enroll(student)
    if students.length < @student_capacity
        students << student
        return true
    else
        return false
    end
  end

  def enrolled?(student)
    @students.map(&:downcase).include?(student.downcase)
  end

  def student_to_teacher_ratio
    @students.length / @teachers.length
  end

  def add_grade(student, number)
    if @students.map(&:downcase).include?(student.downcase)
      @grades[student] << number
      return true
    else
      
      return false
    end
  end

  def num_grades(student)
    @grades[student].length
  end

  def average_grade(student)
    if @students.map(&:downcase).include?(student.downcase) 
      if @grades[student].length != 0
        return  @grades[student].inject(0) {|acc, ele| acc + ele} / @grades[student].length
      end
    end
    return nil
  end
end
