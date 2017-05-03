require_relative('../models/student.rb')
require_relative('../models/house.rb')

house1 = House.new({
  "house_name" => "Hufflepuff"
  })
house1.save()
house2 = House.new({
  "house_name" => "Gryffindor"
  })
house2.save()
house3 = House.new({
  "house_name" => "Ravenclaw"
  })
house3.save()
house4 = House.new({
  "house_name" => "Slytherin"
  })
house4.save()


student1 = Student.new({
  "first_name" => "Harry",
  "last_name" => "Snotter",
  "house_id" => 2,
  "age" => 15
  })
student1.save()

student2 = Student.new({
  "first_name" => "Hermione",
  "last_name" => "Stranger",
  "house_id" => 2,
  "age" => 13
  })
student2.save()

student3 = Student.new({
  "first_name" => "Ronn",
  "last_name" => "Sneezy",
  "house_id" => 2,
  "age" => 14
  })
student3.save()

student4 = Student.new({
  "first_name" => "Draco",
  "last_name" => "Whatever",
  "house_id" => 4,
  "age" => 11
  })
student4.save()

