# Problem Solving 41-50

# 41. Append and Delete
    # You have a string of lowercase English alphabetic letters. You can perform two types of operations on the string:
        # Append a lowercase English alphabetic letter to the end of the string.
        # Delete the last character in the string. Performing this operation on an empty string results in an empty string.
    # Given an integer, k, and two strings, s and t, determine whether or not you can convert s to t by performing exactly k of the above operations on s.
    # If it's possible, print Yes. Otherwise, print No.
    # return a string, either Yes or No.
    # append_and_delete has the following parameter(s):
        # s: the initial string
        # t: the desired string
        # k: an integer that represents the number of operations

    def append_and_delete(s, t, k)
        split = s.length
        (0..s.length - 1).each do |n|
            if t[n].nil? || s[n] != t[n]
                split = n
                break
            end
        end
        if s[split..-1].length + t[split..-1].length <= k
            if split == s.length && split != t.length
                if (t[split..-1].length % 2 != k % 2)
                    return "No"
                end
            end
            return "Yes"
        else
            return "No"
        end
    end