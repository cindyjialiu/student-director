def input_name
  puts "please enter the name of the student"
  name = gets.chomp
  name == "" ? nil : name
end

def input_cohort
  while true do
    puts "please enter the cohort(number of the month) of the students"
    cohort = gets.chomp.to_i
    cohort_months = {
      1 => :January,
      2 => :February,
      3 => :March,
      4 => :April,
      5 => :May,
      6 => :June,
      7 => :July,
      8 => :August,
      9 => :September,
      10 => :October,
      11 => :November,
      12 => :December
    }
    if cohort_months.has_key?(cohort)
      return cohort_months[cohort]
    end
    puts "Please enter a month between 1 to 12"
  end
end

def input_students
  students = []
  while true do
    name = input_name
    break if name == nil
    cohort = input_cohort
    students << {name: name, cohort: cohort}
  end
  puts "Now we have #{students.count} students"
  students
end

def print_header
  puts "The students of Villains Acedemy"
  puts "-------------"
end

def print(students)
  students.map do |student|
    if student[:cohort] == :February
      puts "#{student[:name].center(15)} (#{student[:cohort]})"
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
