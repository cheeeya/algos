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