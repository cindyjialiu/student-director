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
  if students.length >= 1
    students.map do |student|
      if student[:cohort] == :February
        puts "#{student[:name].center(15)} (#{student[:cohort]})"
      end
    end
  end
end

def print_footer(names)
  if names.length >= 1
    if names.length == 1
      puts "Overall, we have #{names.count} great student"
    else
      puts "Overall, we have #{names.count} great students"
    end
  end
end

def interactive_menu
  students = []
  loop do
    #1. print the menu and ask the user what to do
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit"
    #2. read the input and save it into a variable
    selection = gets.chomp
    #3. do what the user has asked
    case selection
      when "1"
        students = input_students
      when "2"
        print_header
        print(students)
        print_footer(students)
      when "9"
        exit #this will cause the program to terminate
      else
        puts "I don't know what you meant, try again"
     end
   end
end
interactive_menu
