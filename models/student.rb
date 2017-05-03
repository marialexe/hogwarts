require_relative('../db/SqlRunner.rb')
require_relative('house.rb')

class Student

attr_reader :id
attr_accessor :first_name, :last_name, :house_id, :age

  def initialize(params)
    @id = params['id'].to_i if params['id']
    @first_name = params['first_name']
    @last_name = params['last_name']
    @house_id = params['house_id'].to_i
    @age = params['age'].to_i
  end
  
  def save()
    sql = "INSERT INTO students (first_name, last_name, house_id, age) VALUES ('#{@first_name}', '#{@last_name}', #{@house_id}, #{@age}) RETURNING id;"
    student_array = SqlRunner.run(sql)
    student_hash = student_array.first()
    @id = student_hash['id'].to_i
  end

  def house
    sql = "SELECT * FROM houses WHERE id = #{@house_id};"
    house_hash = SqlRunner.run(sql).first()
    return House.new(house_hash)
  end

  def Student.all()
    sql ="SELECT * FROM students;"
    students_array = SqlRunner.run(sql)
    result = students_array.map {|student| Student.new(student)} 
    return result
  end
    
  def Student.find(id)
    sql = "SELECT FROM student WHERE id = #{id};"
    students_hash = SqlRunner.run(sql).first()
    result = Student.new(students_hash)
    return result
  end



  
end