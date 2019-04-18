# Problem Solving 31 - 40

# 31. Utopian Tree
    # The Utopian Tree sapling has a height of 1. 
    # It goes through 2 cycles of growth every year.
    # Each spring, it doubles in height. Each summer, its height increases by 1 meter
    # If planted in the spring, return the integer height of the tree after the input number of growth cycles.
    # utopian_tree has the following parameter(s):
        # n: an integer, the number of growth cycles to simulate

    # dynamic programming
    def utopian_tree n
        u = [1]
        (1..n).each do |i|
            i % 2 == 0 ? u[i] = u[i - 1] + 1 : u[i] = u[i - 1] * 2 
        end
        u[n]
    end

    # recursion
    def utopian_tree n
        return n + 1 if n < 3
        n % 2 == 0 ? utopian_tree(n - 1) + 1 : utopian_tree(n - 1) * 2
    end

# 32. Angry Professor
    # return YES if class is cancelled, or NO otherwise.
    # angry_professor has the following parameter(s):
        # k: the threshold number of students
        # a: an array of integers representing arrival times
    
    def angry_professor(k, a)
        k <= a.select { |s| s < 1 }.size ? "NO" : "YES"
    end

# 33. Beautiful Days
    # Given a range of numbered days, [i...j] and a number k,
    # determine the number of days in the range that are beautiful.
    # Beautiful numbers are defined as numbers where |i - reverse(i)| is evenly divisible by k
    # return the number of beautiful days in the range.
    # beautiful_days has the following parameter(s):
        # i: the starting day number
        # j: the ending day number
        # k: the divisor

    def beautiful_days(i, j, k)
        count = 0
        (i..j).each do |d|
            count += 1 if (d - d.to_s.reverse.to_i).abs % k == 0
        end
        count 
    end

    def beautiful_days(i, j, k)
        (i..j).select{ |d| (d - d.to_s.reverse.to_i).abs % k == 0 }.size
    end