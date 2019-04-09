# 1. Ruby Methods - Introduction
    # In this challenge, you need to write a method prime? that takes an argument and returns true or false depending on if the number is prime or not.
    def prime? num
        return false if num < 2
        (2..Math.sqrt(num)).none? {|n| num % n == 0 }
    end

# 2. Ruby Methods - Arguments
    #> take([1,2,3], 1)
    # [2, 3]
    # > take([1,2,3], 2)
    # [3]
    # > take([1,2,3])
    # [2, 3]

    def take (arr, index = 1)
        arr.drop(index)
    end

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
    # Blocks are nameless methods that can be passed to another method as a parameter. 

    def factorial
        yield
    end
    
    n = gets.to_i

    factorial do
        puts (1..n).reduce(:*)
    end

# 6. Procs
    # Proc objects are blocks of code that can be bound to a set of local variables. You can think of a proc object as a "saved" block.
    
    def square_of_sum (my_array, proc_square, proc_sum)
        sum = proc_sum.call(my_array)
        proc_square.call(sum)
    end

    proc_square_number = proc {|n| n * n}
    proc_sum_array = proc {|arr| arr.reduce(:+)}
    my_array = gets.split().map(&:to_i)

    puts square_of_sum(my_array, proc_square_number, proc_sum_array)

# 7. Lambdas
    # Lambdas are anonymous functions. Lambdas in Ruby are objects of the class Proc. 

    # Write a lambda which takes an integer and square it
    square      = ->(a) { a * a }

    # Write a lambda which takes an integer and increment it by 1
    plus_one    = ->(b) { b + 1 }

    # Write a lambda which takes an integer and multiply it by 2
    into_2      = ->(c) { c * 2 }

    # Write a lambda which takes two integers and adds them
    adder       = ->(d, e) { d + e } 

    # Write a lambda which takes a hash and returns an array of hash values
    values_only = ->(f) { f.values }


    input_number_1 = gets.to_i
    input_number_2 = gets.to_i
    input_hash = eval(gets)

    a = square.(input_number_1); b = plus_one.(input_number_2);c = into_2.(input_number_1); 
    d = adder.(input_number_1, input_number_2);e = values_only.(input_hash)

    p a; p b; p c; p d; p e

# 8. Closures
    # Closure is a function/method that:
        # Can be passed around like an object.
        # Remembers the value of variables no longer in scope.

    def block_message_printer
        message = "Welcome to Block Message Printer"
        if block_given?
            proc.call
        end
    puts "But in this function/method message is :: #{message}"
    end

    message = gets
    block_message_printer { puts "This message remembers message :: #{message}" }


    def proc_message_printer(my_proc)
        message = "Welcome to Proc Message Printer"
        my_proc.call              #Call my_proc
        puts "But in this function/method message is :: #{message}"
    end

    my_proc = proc { puts "This message remembers message :: #{message}" }
    proc_message_printer(my_proc)
        
        
    def lambda_message_printer(my_lambda)
        message = "Welcome to Lambda Message Printer"
        my_lambda.call              #Call my_lambda
        puts "But in this function/method message is :: #{message}"
    end

    my_lambda = -> { puts "This message remembers message :: #{message}" }
    lambda_message_printer(my_lambda)

# 9. Partial Applications
    # In Partial Application, we create a lambda that takes a parameter and returns a lambda that does something with it.
    # Here, combination is a variable that stores a partial application which computes combination nCr.

    combination = ->(n) do
        ->(r) do
            return 0 if r > n
            factorial(n) / (factorial(r) * factorial(n - r))
        end
    end

    def factorial i
        (1..i).reduce(:*)
    end


    n = gets.to_i
    r = gets.to_i
    nCr = combination.(n)
    puts nCr.(r)

# 10. Currying
    # Currying is a technique in which a function accepts n parameters and turns it into a sequence of n functions, each of them take 1 parameter.

    power_function = -> (x, z) {
        (x) ** z
    }

    base = gets.to_i
    raise_to_power = power_function.curry.(base)

    power = gets.to_i
    puts raise_to_power.(power)

# 11. Lazy Evaluation
    # Lazy evaluation is an evaluation strategy that delays the assessment of an expression until its value is needed.

    palindromic_primes = -> (array_size) do
        2.upto(Float::INFINITY).lazy.select { |i| prime_palindrome?(i) }.first(array_size)
    end
    
    def prime_palindrome? num
        return false if num < 2 || num != num.to_s.reverse.to_i
        (2..Math.sqrt(num)).none? {|n| num % n == 0 }
    end
    
    n = gets.to_i
    
    p palindromic_primes.(n)
