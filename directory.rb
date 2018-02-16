@students = []
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
  while true do
    name = input_name
    break if name == nil
    cohort = input_cohort
    @students << {name: name, cohort: cohort}
  end
  puts "Now we have #{@students.count} students"
end

def print_header
  puts "The students of Villains Acedemy"
  puts "-------------"
end

def print_students_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  student_num = @students.length == 1 ? "student" : "students"
  puts "Overall, we have #{@students.count} great #{student_num}"
end

def save_students
  file = File.open("students.csv", "w")
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def load_students
  file = File.open("students.csv", "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(",")
    @students << {name: name, cohort: cohort.to_sym}
  end
  file.close
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit"
end

def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "3"
      save_students
    when "4"
      load_students
    when "9"
      exit #this will cause the program to terminate
    else
      puts "I don't know what you meant, try again"
  end
end

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

def show_students
    print_header
    print_students_list
    print_footer
end
interactive_menu
