# Problem Solving 11

# 11. Grading Students
    # If the difference between the grade and the next multiple of  is less than 3, round grade up to the next multiple of 5
    # If the value of grade is less than 38, no rounding occurs as the result will still be a failing grade
    # grading_students has the following parameter(s):
        # grades: an array of integers representing grades before rounding
    # return an integer array consisting of rounded grades.

    def grading_students grades
        grades.map do |grade|
            if grade > 37 && (grade % 5).between?(3,4)
                grade += 5 - (grade % 5)
            else
                grade
            end
        end
    end
    
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

# 13. Kangaroo
    # return YES if they reach the same position at the same time, or NO if they don't.
    # kangaroo has the following parameter(s):
        # x1, v1: integers, starting position and jump distance for kangaroo 1
        # x2, v2: integers, starting position and jump distance for kangaroo 2

    def kangaroo(x1, v1, x2, v2)
        num_jumps = (x1 - x2) / (v1 - v2).to_f
        if num_jumps < 0 && num_jumps % 1 == 0
            "YES"
        else
            "NO"
        end
    end

# 14. Between Two Sets
    # You will be given two arrays of integers and asked to determine all integers that satisfy the following two conditions.
        # The elements of the first array are all factors of the integer being considered
        # The integer being considered is a factor of all elements of the second array
    # Return the number of integers that are betwen the sets

    def get_total_x(a,b)
        (a.max..b.min).count{ |f| a.all?{ |x| f % x == 0 } && b.all?{ |y| y % f == 0 }}
    end

# 15. Breaking the Records
    # return an integer array containing the numbers of times she broke her records.
    # Index 0 is for breaking most points records, and index 1 is for breaking least points records.
    # breaking_records has the following parameter(s):
        # scores: an array of integers, in the same order as the games played

    def breaking_records(scores)
        min, max = scores[0], scores[0]
        record_breaks = [0,0]
        scores.drop(1).each do |score|
            if score < min
                min = score
                record_breaks[1] += 1
            elsif score > max
                max = score
                record_breaks[0] += 1
            end
        end
        record_breaks
    end

# 16. Birthday Chocolate
    # return an integer denoting the number of ways Lily can divide the chocolate bar, 
    # where the length of the segment matches Ron's birth month and the sum of the integers on the squares is equal to his birth day.
    # birthday has the following parameter(s):
        # s: an array of integers, the numbers on each of the squares of chocolate
        # d: an integer, Ron's birth day
        # m: an integer, Ron's birth month

    def birthday(s, d, m)
        (0..s.length - m).count{ |i| s[i..i + m - 1].reduce(:+) == d}
    end