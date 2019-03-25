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

    def infinite_loop
        loop do
            coder.practice
            break if coder.oh_one?
        end
    end

# 4. You have been given a function where an object which may or may not be of the above mentioned type is sent as an argument.
    # You have to use the case control structure in Ruby to identify the class to which the object belongs and print the following output:
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

    def array_initialization
        array1 = []
        array_1 = Array.new

        array2 = [nil]
        array_2 = Array.new(1)

        array3 = [10,10]
        array_3 = Array.new(2,10)
    end

# 6. Array Indexing

    def element_at(arr, index)
        # return the element of the Array variable `arr` at the position `index`
        # arr.at(index) # or
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
        return arr[-index]
    end

    def first_element(arr)
        # return the first element of the array
        return arr.first
    end

    def last_element(arr)
        # return the last element of the array
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

# 8. Ruby Array - Addition
    # In this challenge, your task is to complete three functions that take in the array arr and
        # Add an element to the end of the list
        # Add an element to the beginning of the list
        # Add an element after a given index (position)
        # Add more than one element after a given index (position)

    def end_arr_add(arr, element)
         # Add `element` to the end of the Array variable `arr` and return `arr`
        return arr.push(element)
    end
        
    def begin_arr_add(arr, element)
        # Add `element` to the beginning of the Array variable `arr` and return `arr`
        return arr.unshift(element)
    end
        
    def index_arr_add(arr, index, element)
        # Add `element` at position `index` to the Array variable `arr` and return `arr`
        return arr.insert(index, element)
    end
        
    def index_arr_multiple_add(arr, index, *args)
        # add any two elements to the arr at the index
        return arr.insert(index, nil, nil) unless args.length > 0
        args.each do |element|
            arr.insert(index, element)
            index += 1
        end
        return arr
    end

# 9. Until

    def using_until
        coder.practice until coder.oh_one?

        while not coder.oh_one?
            coder.practice
        end

        until coder.oh_one?
            coder.practice
        end
    end

# 10. Array Deletion

    def end_arr_delete(arr)
        # delete the element from the end of the array and return the deleted element
        return arr.pop
    end

    def start_arr_delete(arr)
        # delete the element at the beginning of the array and return the deleted element
        return arr.shift
    end

    def delete_at_arr(arr, index)
        # delete the element at the position #index
        arr.delete_at(index)
    end

    def delete_all(arr, val)
        # delete all the elements of the array where element = val
        arr.delete(val)
    end

# 11. Array Selection

    def select_arr(arr)
        # select and return all odd numbers from the Array variable `arr`
        arr.select { |v| v % 2 != 0 }
    end
    
    def reject_arr(arr)
        # reject all elements which are divisible by 3
        arr.reject { |v| v % 3 == 0 }
    end
    
    def delete_arr(arr)
        # delete all negative elements
        arr.delete_if { |v| v < 0 }
    end
    
    def keep_arr(arr)
        # keep all non negative elements ( >= 0)
        arr.keep_if { |v| v >= 0 }
    end

# 12. Hash

    def hash_initialization
        empty_hash = Hash.new

        default_hash = Hash.new(1)

        default_hash_2 = Hash.new
        default_hash_2.default = 1

        hackerrank = {"simmy" => 100, "vivmbbs" => 200}

        hackerrank_2 = Hash.new
        hackerrank_2["simmy"] = 100
        hackerrank_2["vivmmbs"]= 200
    end

# 13. Hash - Each

    def iter_hash(hash)
        hash.each do |key, value|
            puts key
            puts value
        end

        hash.each do |arr|
            puts arr[0]     # key
            puts arr[1]     # value
        end
    end

# 14. Hash - Addition, Deletion, Selection
    #In this challenge, a hash object called hackerrank is already created. You have to add
        # A key-value pair [543121, 100] to the hackerrank object using store
        # Retain all key-value pairs where keys are Integers ( clue : is_a? Integer )
        # Delete all key-value pairs where keys are even-valued.

    def hash_methods
        hackerrank.store(543121, 100)
        hackerrank.keep_if { |key, value| key.is_a? Integer}
        hackerrank.delete_if { |key, value| key % 2 == 0 }
    end

# 15. String Methods
    #In this challenge, your task is to write the following methods:
        # mask_article which appends strike tags around certain words in a text. The method takes 2 arguments: A string and an array of words. It then replaces all the instances of words in the text with the modified version.
        # A helper method strike, given one string, appends strike off HTML tags around it. The strike off HTML tag is <strike></strike>.

    def strike(str)
        return "<strike>#{str}</strike>"
    end

    def mask_article(str, words_array)
        words_array.each do |word|
            str = str.gsub(word, strike(word))
        end
        return str
    end
    
# 16. Enumerables
    # In this challenge, you have been provided with a custom object called colors that defines its own each method. You need to iterate over the items and return an Array containing the values.

    def iterate_colors(colors)
        # Your code here
        colors_arr = Array.new
        colors.each do |color|
            colors_arr.push(color)
        end
        return colors_arr
    end

# 17. Enumerables - Each with Index
    # In this challenge, your task is to complete the skip_animals method that takes an animals array and a skip integer and returns an array of all elements except first skip number of items as shown in the example below.

    def skip_animals(animals, skip)
        skipped = Array.new
        animals.each_with_index do |animal, index|
            skipped.push("#{index}:#{animal}") if index >= skip
        end
        return skipped
    end

# 18. Enumerables - map
    # In this challenge, your task is to write a method which takes an array of strings (containing secret enemy message bits!) and decodes its elements using ROT13 cipher system; returning an array containing the final messages.

    # non-destructive
    def rot13(secret_messages)
        secret_messages.map do |msg|
            decoded = ""
            msg.each_byte do |c|
                c +13 > 122 ? c = c + 13 - 26 : c += 13 unless c == 32
                decoded += c.chr
            end
            msg = decoded
        end
    end

    # destructive
    def rot13(secret_messages)
        secret_messages.map do |msg|
            msg.chars.each_with_index do |c, index|
                c.ord + 13 > 122 ? c = (c.ord - 13).chr : c = (c.ord + 13).chr unless c.ord == 32
                msg[index] = c
            end
        end
        return secret_messages
    end

    # destructive
    def rot13(secret_messages)
        secret_messages.map do |msg|
            rot13 = "nopqrstuvwxyzabcdefghijklm "
            alph = "abcdefghijklmnopqrstuvwxyz "
            msg.chars.each_with_index do |c, index|
                msg[index] = rot13[alph.index(c)]
            end
        end
        return secret_messages
    end

# 19. Enumerable - reduce
    # In this challenge, your task is to complete the sum method which takes an integer n and returns the sum to the n terms of the series.

    def sum_terms(n)
          (0..n).inject { |sum, num| sum + num**2 + 1 }
    end

    def sum_terms(n)
          (0..n).reduce { |sum, num| sum + num**2 + 1 }
    end

# 20. Enumerable - group_by
    # In this challenge, your task is to group the students into two categories corresponding to their marks obtained in a test.
    # The list of students will be provided in a marks hash with student name as key and marks obtained (out of 100) as value pair, along with the pass_marks as argument.

    def group_by_marks(marks, pass_marks)
        marks.group_by {|key, value| value >= pass_marks ? "Passed" : "Failed"}
    end