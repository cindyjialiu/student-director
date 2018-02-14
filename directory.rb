def input_students
  puts "please enter the names of the students"
  puts "To finish, just hit the return twice"
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp
  #While the name is not empty, repeat this code
  while name != "" do
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    name = gets.chomp
  end
  # return the array of the students
  students
end

def print_header
  puts "The students of Villains Acedemy"
  puts "-------------"
end

def print(students)
  students.each do |student|
    puts "#{student[:name].center(15)} (#{student[:cohort]})"
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end
students = input_students
print_header
print(students)
print_footer(students)
