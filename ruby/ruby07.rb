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