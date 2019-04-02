# 1.

    def solveMeFirst (a, b)
        a + b
    end

# 2. Simple Array Sum
  
    def simpleArraySum(ar)
        ar.reduce(:+)
    end

# 3. Compare the Triplets
    # Complete the function compareTriplets. It must return an array of two integers, the first being Alice's score and the second being Bob's.
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

    def aVeryBigSum(ar)
        ar.reduce(:+)
    end

# 5. Diagonal Difference
    # Given a square matrix, calculate the absolute difference between the sums of its diagonals.
    # diagonalDifference takes the following parameter:
        # arr: an array of integers .

    def diagonalDifference(arr)
        diagonal_difference = 0
        arr.each_with_index do |val, index|
            diagonal_difference  = diagonal_difference + val[index] - val[val.size - index - 1]
        end
        diagonal_difference.abs
    end
