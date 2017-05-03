require_relative('../db/SqlRunner.rb')

class House
  attr_reader :id
  attr_accessor :house_name

  def initialize(params)
    @id = params['id'].to_i if params['id']
    @house_name = params['house_name']
  end

  def save()
    sql = "INSERT INTO houses (house_name) VALUES ('#{@house_name}') RETURNING *;"
    result = SqlRunner.run(sql)[0]
    @id = result['id'].to_i
  end

  def House.all()
    sql = "SELECT * FROM houses;"
    house_array = SqlRunner.run(sql)
    result = house_array.map {|house| House.new(house)}
    return result
  end

  def House.find(id)
    sql = "SELECT FROM houses WHERE id=#{id};"
    house_hash = SqlRunner.run(sql).first()
    return House.new(house_hash)

  end
  
  
end