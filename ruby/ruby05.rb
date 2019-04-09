# Problem Solving 11

# 11. Grading Students
    # If the difference between the grade and the next multiple of  is less than 3, round grade up to the next multiple of 5
    # If the value of grade is less than 38, no rounding occurs as the result will still be a failing grade
    # grading_students has the following parameter(s):
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

    def gradingStudents grades
        rounded_grades = grades.map do |grade|
            if grade > 37 && (grade % 5).between?(3,4)
                rounded = grade.round(-1)
                rounded += 5 if grade > rounded
                rounded
            else
                grade
            end
        end
    end

# 12. Apple and Orange
    # print the number of apples and oranges that land on Sam's house, each on a separate line.
    # count_apples_and_oranges has the following parameter(s):
        # s: integer, starting point of Sam's house location.
        # t: integer, ending location of Sam's house location.
        # a: integer, location of the Apple tree.
        # b: integer, location of the Orange tree.
        # apples: integer array, distances at which each apple falls from the tree.
        # oranges: integer array, distances at which each orange falls from the tree.

    def count_apples_and_oranges(s, t, a, b, apples, oranges)
        location_a = apples.map { |d| d + a }
        location_o = oranges.map { |d| d + b }
        puts location_a.count { |a| a.between?(s,t) }
        puts location_o.count { |o| o.between?(s,t) }
    end