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

    def transcode (string)
        string.force_encoding(Encoding::UTF_8)
    end

# 3. Indexing
    # In this challenge, your task is to code a serial_average method which is described below:
        # It takes a fixed width string in format: SSS-XX.XX-YY.YY. SSS is a three digit serial number, XX.XX and YY.YY are two digit numbers including up to two decimal digits.
        # It returns a string containing the answer in format SSS-ZZ.ZZ where SSS is the serial number of that input string, and ZZ.ZZ is the average of XX.XX and YY.YY.
        # All numbers are rounded off to two decimal places.

    def serial_average(serial_num)
        average = (serial_num[4,5].to_f + serial_num[10,5].to_f) / 2.0
        "#{serial_num[0,3]}-#{average.round(2)}"
    end