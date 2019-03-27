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

