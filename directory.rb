@students = []

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end
    
def print_menu
  puts "1. Input the students"
  puts "2. Display the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit"
end

def show_students
  print_header
  print_students_list
  print_footer
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
      exit
    else
      puts "I dont know what you meant, try again"
  end
end

def input_students
  puts "Enter the name of the student"
  puts "Hit enter twice to exit"
  count = 0
  name = STDIN.gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty?
    # add the student hash to the array
    add_student_info(name, :november)
    puts "Now we have #{@students.count} students"
    count += 1
    # get another name from the user
    name = STDIN.gets.chomp
  end
  count > 0 ? (puts "You have just inputted #{count} students. Reselect to add more students to the list") : (puts "You did not enter a name. Reselect to add students")
end

def print_header
  puts "The students of my cohort at Makers Academy"
  puts "-------------"
end

def print_students_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
  puts "Printed the complete list of students..."
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end

def save_students
  puts "Enter the filename for the file you wish to save the list of students to"
  filename = gets.chomp
  if File.exist?(filename)
    File.open(filename, "w") do |f|
      @students.each do |student|
        student_data = [student[:name], student[:cohort]]
        csv_line = student_data.join(",")
        f.puts csv_line
      end
    end
    puts "Saved #{@students.count} students to #{filename}"
  else
    puts "This file does not exist. Please reselect to enter another filename to save to"
  end
end

def try_load_students
  filename = startup_check_filename
    if File.exist?(filename)
      load(filename)
    else
      puts "Sorry, #{filename} does not exist"
      exit
    end
end

def load(filename)
  File.open(filename, "r") do |f|
    f.readlines.each do |line|
      name, cohort = line.chomp.split(',')
      add_student_info(name, cohort)
    end
  end
end

def load_students
  puts "Enter the filename for the file you wish to load the list of students from"
  filename = gets.chomp
  if File.exist?(filename)
    load(filename)
    puts "Loaded #{@students.count} students from #{filename}"
  else
    puts "This file does not exist. Please reselect to enter another filename to load"
  end
end

def add_student_info(name, cohort)
  @students << {name: name, cohort: cohort.to_sym}
end

def startup_check_filename
  ARGV.empty? ? filename = "students.csv" : filename = ARGV.firs
end

try_load_students    
interactive_menu

