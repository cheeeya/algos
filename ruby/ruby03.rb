# Ruby Strings

# 1. Intro

    def single_quote
        # single quote string here
        'Hello World and others!'
    end
    
    def double_quote
        # Double quote string here
        "Hello World and others!"
    end
    
    def here_doc
        # Here doc string here
        <<-HERE
            Hello World and others!
        HERE
    end

# 2. Encoding
    # In this challenge, we practice setting the encoding information for some string of text using Ruby's Encoding methods.
    # Write a function named transcode which takes a ISO-8859-1 encoded string as a parameter, converts it to an UTF-8 encoded string, and returns the result.

    def transcode string
        string.force_encoding(Encoding::UTF_8)
    end

# 3. Indexing
    # In this challenge, your task is to code a serial_average method which is described below:
        # It takes a fixed width string in format: SSS-XX.XX-YY.YY. SSS is a three digit serial number, XX.XX and YY.YY are two digit numbers including up to two decimal digits.
        # It returns a string containing the answer in format SSS-ZZ.ZZ where SSS is the serial number of that input string, and ZZ.ZZ is the average of XX.XX and YY.YY.
        # All numbers are rounded off to two decimal places.

    def serial_average serial_num
        average = (serial_num[4,5].to_f + serial_num[10,5].to_f) / 2.0
        "#{serial_num[0,3]}-#{average.round(2)}"
    end

# 4. Iteration
    # Challenge: Write the method count_multibyte_char which takes a string as input and returns the number of multibyte characters (byte size > 1) in it.

    def count_multibyte_char string
        count = 0
        string.each_char { |c| count += 1 if c.bytesize > 1}
        count
    end

# 5. Methods 1
    # In this challenge, your task is to code a process_text method,
    # which takes an array of strings as input and returns a single joined string with all flanking whitespace and new lines removed.
    # Each string has to be separated by a single space.

    def process_text string_array
        final = Array.new
        string_array.each { |s| final.push(s.strip)}
        final.join(" ")
    end

# 6. Methods 2
    #In this challenge, your task is to write the following methods:
        # mask_article which appends strike tags around certain words in a text. The method takes 2 arguments: A string and an array of words. It then replaces all the instances of words in the text with the modified version.
        # A helper method strike, given one string, appends strike off HTML tags around it. The strike off HTML tag is <strike></strike>.

    def strike string
        return "<strike>#{string}</strike>"
    end

    def mask_article(str, words_array)
        words_array.each do |word|
            str = str.gsub(word, strike(word))
        end
        return str
    end
        