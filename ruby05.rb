# 11. Grading Students
    # If the difference between the grade and the next multiple of  is less than 3, round grade up to the next multiple of 5
    # If the value of grade is less than 38, no rounding occurs as the result will still be a failing grade
    # gradingStudents has the following parameter(s):
        # grades: an array of integers representing grades before rounding
    # return an integer array consisting of rounded grades.
    
    def grading_students grades
        rounded_grades = Array.new
        grades.each do |grade|
            if grade > 37 && (grade % 5).between?(3,4)
                rounded = grade.round(-1)
                rounded += 5 if grade > rounded
                rounded_grades.push(rounded)
            else
                rounded_grades.push(grade)
            end
        end
        rounded_grades
    end