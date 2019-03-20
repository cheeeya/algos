# HackerRank exercises

# 1. Your task is to iterate through each of the elements in the array using each and call the method update_score on every element.

    def scoring(array)
        # iterate through each of the element in array using *each* and call update_score on it
        array.each do |user|
            user.update_score
        end
    end

# 2. User has two public methods, is_admin? and update_score. Your task in this challenge is to use the control structure unless and update all elements of the array who are not admins.

    def scoring(array)
        # update_score of every user in the array unless the user is admin
        array.each do |user|
            user.update_score unless user.is_admin?
        end
    end

# 3. Use an infinite loop and call the method coder.practice within it and break if coder.oh_one? is true.

    loop do
        coder.practice
        break if coder.oh_one?
    end

# 4. You have been given a function where an object which may or may not be of the above mentioned type is sent as an argument. You have to use the case control structure in Ruby to identify the class to which the object belongs and print the following output:

    # if Hacker, output "It's a Hacker!"
    # if Submission, output "It's a Submission!"
    # if TestCase, output "It's a TestCase!"
    # if Contest, output "It's a Contest!"
    # for any other object, output "It's an unknown model"

    def identify_class(obj)
        # write your case control structure here
        case obj
        when Hacker, Submission, TestCase, Contest
            puts "It's a #{obj.class}!"
        else
            puts "It's an unknown model"
        end
    end

# 5. Array

    array1 = []
    array_1 = Array.new

    array2 = [nil]
    array_2 = Array.new(1)

    array3 = [10,10]
    array_3 = Array.new(2,10)

# 6. Array Indexing

    def element_at(arr, index)
        # return the element of the Array variable `arr` at the position `index`
        # arr.at(index) # or
        # arr[index]
        return arr[index]
    end

    def inclusive_range(arr, start_pos, end_pos)
        # return the elements of the Array variable `arr` between the start_pos and end_pos (both inclusive)
        return arr[start_pos..end_pos]
    end

    def non_inclusive_range(arr, start_pos, end_pos)
        # return the elements of the Array variable `arr`, start_pos inclusive and end_pos exclusive
        return arr[start_pos...end_pos]
    end

    def start_and_length(arr, start_pos, length)
        # return `length` elements of the Array variable `arr` starting from `start_pos`
        return arr[start_pos, length]
    end
# 7. Array Indexing 2

    def neg_pos(arr, index)
        # return the element of the array at the position `index` from the end of the list
        # Clue : arr[-index]
        return arr[-index]
    end

    def first_element(arr)
        # return the first element of the array
        # arr.first
        return arr.first
    end

    def last_element(arr)
        # return the last element of the array
        # arr.last
        return arr.last
    end

    def first_n(arr, n)
        # return the first n elements of the array
        return arr.take(n)
    end

    def drop_n(arr, n)
        # drop the first n elements of the array and return the rest
        return arr.drop(n)
    end


