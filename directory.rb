def input_students
  puts "please enter the names of the students"
  puts "To finish, just hit the return twice"
  # create an empty array
  students = []
  while true do
    name = gets.chomp
    break if name == ""
    puts "please enter the hobbies of the students"
    hobby = gets.chomp
    puts "please enter the countries of birth of the students"
    country_of_birth = gets.chomp
    puts "please enter the heights of the students"
    height = gets.chomp
    students << {name: name, cohort: :november, hobby: hobby, country_of_birth:
    country_of_birth, height: height}
    puts "Now we have #{students.count} students"
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
    puts "#{student[:name]} #{student[:hobby]} #{student[:country_of_birth]} #{student[:height]}cm (#{student[:cohort]} cohort)"
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end
students = input_students
print_header
print(students)
print_footer(students)
