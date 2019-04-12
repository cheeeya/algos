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

# 17. Divisible Sum Pairs
    # You are given an array of n integers, and a positive integer, k.
    # Find and print the number of (i,j) pairs where i < j and ar[i] + ar[j] is divisible by k.
    # divisible_sum_pairs has the following parameter(s):
        # n: the integer length of array 
        # ar: an array of integers
        # k: the integer to divide the pair sum by

    def divisible_sum_pairs(n, k, ar)
        (0..n - 1).inject do |sum, i|
            sum + ar.drop(i).count { |el| (ar[i - 1] + el) % k == 0 }
        end
    end

    def divisible_sum_pairs(n, k, ar)
        total = 0
        (0..n - 2).each do |i|
            total += ar.drop(i+1).count{ |el| (ar[i] + el) % k == 0 }
        end
        total
    end

    def divisible_sum_pairs(n, k, ar)
        ar.each_with_index.map { |e1, i| ar.drop(i+1).count{ |e2| (e1 + e2) % k == 0} }.reduce(:+)
    end

# 18. Migratory Birds
    # return the lowest type number of the most frequently sighted bird.
    # migratory_birds has the following parameter(s):
        # arr: an array of integers representing types of birds sighted

    def migratory_birds arr
        frequency_hash = { 1 => 0, 2 => 0, 3 => 0, 4 => 0, 5=> 0 }
        arr.each { |type| frequency_hash[type] += 1 }
        frequency_hash.max_by { |k,v| v }[0]
        # frequency_hash.key(frequency_hash.values.max)
    end

# 19. Day of the Programmer
    # From 1700 to 1917, Russia's official calendar was the Julian calendar; since 1919 they used the Gregorian calendar system.
    # The transition from the Julian to Gregorian calendar system occurred in 1918, when the next day after January 31st was February 14th.
    # Given a year, y, find the date of the 256th day of that year according to the official Russian calendar during that year.
    # Then print it in the format dd.mm.yyyy, where dd is the two-digit day, mm is the two-digit month, and yyyy is y.

    def day_of_programmer year
        if year == 1918
            "26.09.1918"
        else
            if leap_year?(year)
                "12.09.#{year}"
            else
                "13.09.#{year}"
            end
        end
    end

    def leap_year? year
        # (year < 1918 && year % 4 == 0) || (year > 1918 && (year % 400 == 0 || (year % 4 == 0 && year % 100 != 0)))
        if year < 1918
            year % 4 == 0
        else
            year % 400 == 0 || (year % 4 == 0 && year % 100 != 0)
        end
    end

# 20. Bon Appétit
    # print Bon Appetit if the bill is fairly split. Otherwise, it should print the integer amount of money that Brian owes Anna.
    # bon_appetit has the following parameter(s):
        # bill: an array of integers representing the cost of each item ordered
        # k: an integer representing the zero-based index of the item Anna doesn't eat
        # b: the amount of money that Anna contributed to the bill

    def bon_appetit(bill, k ,b)
        refund = (bill.reduce(:+) - bill[k]) / 2 - b
        if refund == 0
            print "Bon Appetit"
        else
            print refund
        end
    end