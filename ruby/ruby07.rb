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

# 34. Viral Advertising
    # When they launch a new product, they advertise it to exactly 5 people on social media
    # Each day, floor(recipients / 2) of the recipients like the advertisement and will share it with 3 friends on the following day
    # return the cumulative number of people who have liked the ad at a given time.
    # viral_advertising has the following parameter(s):
        # n: the integer number of days

    def viral_advertising n
        recipients = 5
        total_likes = 0
        (0...n).each do |d|
            liked = recipients / 2
            recipients = liked * 3
            total_likes += liked
        end
        total_likes
    end

# 35. Save the Prisoner
    # A chair number will be drawn from a hat. Beginning with the prisoner in that chair,
    # one candy will be handed to each prisoner sequentially around the table until all have been distributed.
    # return the chair number occupied by the prisoner who will receive the last candy.
    # save_the_prisoner has the following parameter(s):
        # n: an integer, the number of prisoners
        # m: an integer, the number of sweets
        # s: an integer, the chair number to begin passing out sweets from

    def save_the_prisoner(n, m, s)
        ((m - 1) % n + s - 1) % n + 1
    end