# Warmup

# 1.

    def solveMeFirst(a, b)
        a + b
    end

# 2. Simple Array Sum
  
    def simpleArraySum arr
        arr.reduce(:+)
    end

# 3. Compare the Triplets
    # The function compareTriplets must return an array of two integers, the first being Alice's score and the second being Bob's.
    # compareTriplets has the following parameter(s):
        # a: an array of integers representing Alice's challenge rating
        # b: an array of integers representing Bob's challenge rating   
    
    def compareTriplets(a,b)
        scores = [0,0]
        a.each_with_index do |val, index|
            case val <=> b[index]
            when 1
                scores[0] += 1
            when -1
                scores[1] += 1
            end
        end
        scores
    end

# 4. A Very Big Sum
    # Calculate and print the sum of the elements in an array, keeping in mind that some of those integers may be quite large.
        # **BigNum and FixNum are unified in ruby as Integer, use Long for java

    def aVeryBigSum arr
        arr.reduce(:+)
    end

# 5. Diagonal Difference
    # Given a square matrix, calculate the absolute difference between the sums of its diagonals.
    # diagonalDifference takes the following parameter:
        # arr: an array of integers .

    def diagonalDifference arr
        diagonal_difference = 0
        arr.each_with_index do |val, index|
            diagonal_difference  = diagonal_difference + val[index] - val[val.size - index - 1]
        end
        diagonal_difference.abs
    end

# 6. Plus Minus
    # Given an array of integers, calculate the fractions of its elements that are positive, negative, and are zeros.
    # Print the decimal value of each fraction on a new line.

    # iterates across array 1x
    def plusMinus arr
        positive_count = 0
        negative_count = 0
        zero_count = 0
        arr.each do |val|
            case val <=> 0
            when 1
                positive_count += 1
            when -1
                negative_count += 1
            else
                zero_count += 1
            end
        end
        p positive_count / arr.size.to_f
        p negative_count / arr.size.to_f
        p zero_count / arr.size.to_f
    end

    # solved in 3 lines, iterates across array 3x
    def plusMinus arr
        p arr.select { |el| el > 0 }.size / arr.size.to_f
        p arr.select { |el| el < 0 }.size / arr.size.to_f
        p arr.select { |el| el == 0 }.size / arr.size.to_f
    end

# 7. Staircase
    # Consider a staircase of size n.
    # The base and height are both equal to n, and the image is drawn using # symbols and spaces.
    # The last line is not preceded by any spaces.

    def staircase n 
        (1..n).each do |line|
            (1..n - line).each { |spaces| print " " }
            (1..line).each { |hashtags| print "#" }
            puts
        end
    end

# 8. Mini-Max Sum
    # Given five positive integers, find the minimum and maximum values that can be calculated by summing exactly four of the five integers.
    # Then print the respective minimum and maximum values as a single line of two space-separated long integers.

    def miniMaxSum arr
        min_nums = Array.new
        max_nums = Array.new
        hash = { "min": nil, "max": nil, "min_index": 0, "max_index": 0 }
        arr.each do |el|
            if min_nums.size < 4
                min_nums.push(el)
                if hash["max"].nil? || el > hash["max"]
                    hash["max"] = el
                    hash["max_index"] = min_nums.size - 1
                end
            elsif el < hash["max"]
                hash["max"] = el
                min_nums[hash["max_index"]] = el 
            end
            if max_nums.size < 4
                max_nums.push(el)
                if hash["min"].nil? || el < hash["min"]
                    hash["min"] = el
                    hash["min_index"] = max_nums.size - 1
                end
            elsif el > hash["min"]
                hash["min"] = el
                max_nums[hash["min_index"]] = el
            end
        end
        print "#{min_nums.reduce(:+)} "
        print max_nums.reduce(:+)
    end