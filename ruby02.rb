# 1. Ruby Methods - Variable Arguments
    # Write a method named full_name that generates the full names of people given their first name, followed by some variable number of middle names, followed by their last name.

    def full_name(*args)
        args.join(" ")
    end

#2. Ruby  Methods - Keyword Arguments
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