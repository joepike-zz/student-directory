student_count = 11

def input_students
    puts "Please enter the name of the students"
    puts "To finish, just hit the return twice"
    
    students = []
    
    name = gets.chomp
    
    while !name.empty? do
        students << {name: name, cohort: :november}
        puts "Now we have #{students.count} students"
        name = gets.chomp
    end
    students
end

def print_header
    # first we print the list of students
    puts "The students of Villians Academy"
    puts "-------------"
end

def print_footer
    # finally, we print the total number of students
    puts "Overall we have #{students.count} students"
end

def print(students)
    students.each do |student|
        puts "#{student[:name]} (#{student[:cohort]} cohort)"
    end
end

students = input_students
print_header
print(students)
print_footer