# 1. Ruby Methods - Introduction
    # In this challenge, you need to write a method prime? that takes an argument and returns true or false depending on if the number is prime or not.
    def prime? num
        return false if num < 2
        (2..Math.sqrt(num)).none? {|n| num % n == 0 }
    end

# 2. 

# 3. Ruby Methods - Variable Arguments
    # Write a method named full_name that generates the full names of people given their first name, followed by some variable number of middle names, followed by their last name.

    def full_name(*args)
        args.join(" ")
    end

# 4. Ruby Methods - Keyword Arguments
    # In this challenge, your task is to write a method convert_temp that helps in temperature conversion.
    # The method will receive a number as an input (temperature), a named parameter input_scale (scale for input temperature),
    # and an optional parameter output_scale (output temperature scale, defaults to Celsius) and return the converted temperature.
    # It should perform interconversion between Celsius, Fahrenheit and Kelvin scale.

    def convert_temp(temperature, input_scale: "celsius", output_scale: "celsius")
        return temperature if input_scale == output_scale
        new_temp = temperature    
        new_temp = (temperature - 32) * 5.0 / 9.0 if input_scale == "fahrenheit"
        new_temp = temperature - 273.15 if input_scale == "kelvin"
        new_temp += 273.15 if output_scale == "kelvin"
        new_temp = new_temp * 9.0 / 5.0 + 32 if output_scale == "fahrenheit"
        return new_temp
    end

# 5. Blocks

    def factorial
        yield
    end
    
    n = gets.to_i

    factorial do
        puts (1..n).reduce(:*)
    end

# 6. Procs
    
    def square_of_sum (my_array, proc_square, proc_sum)
        sum = proc_sum.call(my_array)
        proc_square.call(sum)
    end

    proc_square_number = proc {|n| n * n}
    proc_sum_array = proc {|arr| arr.reduce(:+)}
    my_array = gets.split().map(&:to_i)

    puts square_of_sum(my_array, proc_square_number, proc_sum_array)