#!/usr/bin/env ruby
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
  students.each_with_index do |student, index|
    # Find out the names begin with a specific letter
    if student[:name].length <= 12
    puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
    end
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end
students = input_students
print_header
print(students)
print_footer(students)
