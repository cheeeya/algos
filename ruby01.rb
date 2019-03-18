# HackerRank exercises

# 1. Your task is to iterate through each of the elements in the array using each and call the method update_score on every element.

def scoring(array)
    # iterate through each of the element in array using *each* and call update_score on it
    array.each do |user|
        user.update_score
    end
end

# 2. Use an infinite loop and call the method coder.practice within it and break if coder.oh_one? is true.

loop do
    coder.practice
    break if coder.oh_one?
end