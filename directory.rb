require "csv"
@students = []
def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to a file"
  puts "4. Load the list from a file"
  puts "9. Exit"
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
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

def input_name
  puts "please enter the name of the student"
  puts "To finish, just hit return twice"
  name = STDIN.gets.chomp
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
    return cohort_months[cohort] if cohort_months.has_key?(cohort)
    puts "Please enter a month between 1 to 12"
  end
end

def input_students
  puts "You are in 1. 'Input the studetns'"
  while true do
    name = input_name
    break if name == nil
    cohort = input_cohort
    add_students(name, cohort)
  end
  puts "Now we have #{@students.count} students"
end

def add_students(name, cohort)
  @students << {name: name, cohort: cohort.to_sym}
end

def show_students
  puts "You are in '2. Show the students'"
  print_header
  print_students_list
  print_footer
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

def filename_secure?(filename)
  /^\w+$/.match(filename) != nil
end

def create_filename
  loop do
    puts "Please creat a file name (only contain letters or numbers)"
    file_name = STDIN.gets.chomp
    return file_name if filename_secure?(file_name)
    puts "Sorry, the file name is invalid"
  end
end

def save_students
  puts "You are now in '3. Save the list to a file'"
  CSV.open(create_filename + ".csv", "wb") do |csv|
    @students.each do |student|
      student_data = [student[:name], student[:cohort]]
      csv << student_data
    end
  end
end

def load_students
  puts "You are now in '4. Load the list from a file'"
  CSV.foreach(create_filename + ".csv", "r") do |row|
    add_students(row[0], row[1])
  end
end

def try_load_students
  filename = ARGV.first
  return if filename.nil?
  if File.exists?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else
    puts "Sorry, #{filename} doesn't exist"
    exit
  end
end

try_load_students
interactive_menu
