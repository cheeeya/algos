# 1.

    def solveMeFirst (a, b)
        a + b
    end
    
    val1 = gets.to_i
    val2 = gets.to_i
    sum = solveMeFirst(val1,val2)
    print (sum)

# 2. Simple Array Sum
  
    def simpleArraySum(ar)
        ar.reduce(:+)
    end

    fptr = File.open(ENV['OUTPUT_PATH'], 'w')

    ar_count = gets.to_i

    ar = gets.rstrip.split(' ').map(&:to_i)

    result = simpleArraySum ar

    fptr.write result
    fptr.write "\n"

    fptr.close()
