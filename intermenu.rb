@students = []

def interactive_menu
  loop do
    # print the menu and ask the user what to do
    puts "1. Input the students"
    puts "2. Display the students"
    puts "9. Exit"

    selection = gets.chomp

    case selection
    when "1"
      students = input_students()
    when "2"
      print_header
      print(students)
      print_footer(students)
    when "9"
      exit
    else
      puts "I dont know what you meant, try again"
    end
  end
end

def input_students
  puts "Enter the name of the student"
  puts "Hit enter twice to exit"
  # get the first name
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty?
    # add the student hash to the array
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    # get another name from the user
    name = gets.chomp
  end
  # return the array of students
  #students
end

def print_header
  puts "The students of my cohort at Makers Academy"
  puts "-------------"
end

def print
  students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  print "Overall, we have #{students.count} great students"
end

interactive_menu
#students = input_students
#print_header
#print(students)
#print_footer(students)