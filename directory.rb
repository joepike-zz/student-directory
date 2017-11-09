student_count = 11

students = [
  "Dr. Hannibal Lecter",
  "Darth Vader",
  "Nurse Ratched",
  "Michael Corleone",
  "Alex DeLarge",
  "The Wicked Witch of the West",
  "Terminator",
  "Freddy Krueger",
  "The Joker",
  "Joffrey Baratheon",
  "Norman Bates"
]

def print_header
    # first we print the list of students
    puts "The students of Villians Academy"
    puts "-------------"
end

def print_names(names)
    names.each do |name|
        puts name
    end
end

def print_footer
    # finally, we print the total number of students
    puts "Overall we have #{students.count} students"
end

print_header
print_names(students)
print_footer