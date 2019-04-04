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
        min, max, min_index, max_index = nil
        arr.each do |el|
            if min_nums.size < 4
                min_nums.push(el)
                if max.nil? || el > max
                    max = el
                    max_index = min_nums.size - 1
                end
            elsif el < max
                max = el
                min_nums[max_index] = el 
            end
            if max_nums.size < 4
                max_nums.push(el)
                if min.nil? || el < min
                    min = el
                    min_index = max_nums.size - 1
                end
            elsif el > min
                min = el
                max_nums[min_index] = el
            end
        end
        print "#{min_nums.reduce(:+)} #{max_nums.reduce(:+)}"
    end

    def miniMaxSum arr
        min_nums = arr.take(4)
        max_nums = arr.take(4)
        minMax = arr.minmax
        min_nums[min_nums.index(minMax[1])] = arr[4] if arr[4] < minMax[1]
        max_nums[max_nums.index(minMax[0])] = arr[4] if arr[4] > minMax[0]
        print "#{min_nums.reduce(:+)} #{max_nums.reduce(:+)}"
    end

    def miniMaxSum arr
        min_nums = arr.take(5)
        max_nums = arr.take(5)
        minMax = arr.minmax
        min_nums[arr.index(minMax[1])] = 0
        max_nums[arr.index(minMax[0])] = 0
        print "#{min_nums.reduce(:+)} #{max_nums.reduce(:+)}"
    end

    def miniMaxSum arr
        sorted = arr.sort
        print "#{sorted.take(4).sum} #{sorted.slice(1,4).sum}"
    end

# 9. Birthday Cake Candles
    # You are in charge of the cake for your niece's birthday and have decided the cake will have one candle for each year of her total age.
    # When she blows out the candles, she’ll only be able to blow out the tallest ones. Your task is to find out how many candles she can successfully blow out.

    def birthdayCakeCandles arr
        arr.count(arr.max)
    end

    def birthdayCakeCandles arr
        max = nil
        count = 0
        arr.each do |val|
            if max.nil? || val > max
                max = val
                count = 1
            elsif val == max
                count += 1
            end
        end
        count 
    end

# 10. Time Conversion
    # Given a time in 12-hour AM/PM format, convert it to military (24-hour) time

    def timeConversion s
        converted_time = "#{(s[0,2].to_i + 12) % 12}#{s[2,6]}".rjust(8, "0")
        converted_time = "#{converted_time[0,2].to_i + 12}#{s[2,6]}" if s[8,9] == "PM"
        converted_time
    end

    def timeConversion s
        array = s.split(":")
        array[0] = "#{(array[0].to_i + 12) % 12}".rjust(2, "0")
        array[0] = (array[0].to_i + 12).to_s if array[2].slice!(2..3) == "PM"
        array.join(":")
    end