# Problem Solving 21 - 30

# 21. Sock Merchant
    # Given an array of integers representing the color of each sock, determine how many pairs of socks with matching colors there are.
    # sock_merchant has the following parameter(s):
        # n: the number of socks in the pile
        # ar: the colors of each sock

    def sock_merchant(n, ar)
        sock_hash = ar.each_with_object(Hash.new(0)) { |sock, hash| hash[sock] += 1 }
        sock_hash.values.map { |count| count / 2}.reduce(:+)
    end

# 22. Drawing Book
    # When she opens the book, page 1 is always on the right side:
    # return the minimum number of pages Brie must turn.
    # page_count has the following parameter(s):
        # n: the number of pages in the book
        # p: the page number to turn to

    def page_count(n, p)
        p / 2 < ((n + 1) % 2 + n - p) / 2 ? p / 2 : ((n + 1) % 2 + n - p) / 2
    end

# 23. Counting Valleys
    # A mountain is a sequence of consecutive steps above sea level, starting with a step up from sea level and ending with a step down to sea level.
    # A valley is a sequence of consecutive steps below sea level, starting with a step down from sea level and ending with a step up to sea level.
    # return an integer that denotes the number of valleys Gary traversed.
    # counting_valleys has the following parameter(s):
        # n: the number of steps Gary takes
        # s: a string describing his path, D = downhill step, U = uphill step, each step a 1 unit change in altitude

    def counting_valleys(n, s)
        altitude, prev, count = 0, 0, 0
        s.each_char do |char|
            prev = altitude
            char == 'D' ? altitude -= 1 : altitude += 1
            count += 1 if altitude == 0 && prev < 0
        end
        count
    end
    
# 24. Electronics Shop
    # Given the possible prices of keyboards and mice, return the maximum total price for two items within budget, or -1 if out of budget.
    # get_money_spent has the following parameter(s):
        # keyboards: an array of integers representing keyboard prices
        # drives: an array of integers representing drive prices
        # b: the units of currency in Monica's budget

    def get_money_spent(keyboards, drives, b)
        max_price = -1
        keyboards.each do |k|
            drives.each do |d|
                max_price = k + d if k + d <= b && k + d > max_price
            end
        end
        max_price
    end

# 25. Cats and a Mouse
    # return which Cat reaches the mouse first, or C if the cats reach the mouse at the same time
    # cat_and_mouse has the following parameter(s):
        # x: an integer, Cat A's position
        # y: an integer, Cat B's position
        # z: an integer, Mouse C's position

    def cat_and_mouse(x, y, z)
        case (x - z).abs <=> (y - z).abs
        when - 1
            "Cat A"
        when 0
            "Mouse C"
        when 1
            "Cat B"
        end
    end

# 26. Forming a Magic Square
    # magic square: n x n matric where the sums of any row, column, or diagonal of length n are equal
    # return an integer that represents the minimal total cost of converting the input square to a magic square.
    # formingMagicSquare has the following parameter(s):
        # s: a  array of integers
    
    def forming_magic_square(s)
        magic_square = [[4,9,2],[3,5,7],[8,1,6]]
        magic_hash = Hash.new
        lowest_cost = nil
        (0..7).each do |key|
            if key == 0
                magic_hash[key] = magic_square
            elsif key < 4
                magic_hash[key] = rotate(magic_hash[key - 1])
            else    
                magic_hash[key] = reflect(magic_hash[key - 4])
            end
            temp_cost = 0
            (0..2).each do |i|
                (0..2).each do |j|
                    temp_cost += (s[i][j] - magic_hash[key][i][j]).abs
                end
            end
            lowest_cost = temp_cost if lowest_cost.nil? || temp_cost < lowest_cost
        end
        lowest_cost
    end

    def rotate(s)
        rotated_square = [[],[],[]]
        (0..2).each do |i|
            (0..2).each do |j|
                rotated_square[j][i] = s[i][2 - j]
            end
        end
        rotated_square
    end

    def reflect(s)
        s.reverse
    end