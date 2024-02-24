# ===== PRIVATE METHODS BELOW HERE =================================================================================== #
"""
    _substring_genertor(length_str::Int64)

This method takes an Int64 length_str as an input and returns a 1D Array of 
strings that are the substrings (starting from the first character) of 
length length_str on the words "one" through "nine". 
"""
function _substring_genertor(length_str::Int64)
    numbers = ["one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]
    rules = []
    for number in numbers
        if (length(number) <= length_str)
            push!(rules, number)
        else
            push!(rules, number[1:length_str])
        end
    end
    return rules
end
# ===== PRIVATE METHODS ABOVE HERE =================================================================================== #


# ===== PUBLIC METHODS BELOW HERE ==================================================================================== #
"""
    decode_part_1(models::Dict{Int64, MyPuzzleRecordModel}) -> Tuple{Int64, Dict{Int64, Int64}}

This method takes models::Dict{Int64, MyPuzzleRecordModel} as an input and 
returns a Tuple with two elements. The first element is the overall hidden sum 
(type Int64) computed from all the encoded lines of text in a file. The second 
element is a dictionary (type Dict{Int64, Int64}) where the key represents a line 
number (starting from index 1), and the value is a two-digit integer computed from 
the first digit and the last digit of the encoded line of text (the numbers are 
represented as digits and have a range 1-9). 
"""
function decode_part_1(models::Dict{Int64,MyPuzzleRecordModel})::Tuple{Int64,Dict{Int64,Int64}}

    # initialize -
    total = 0
    codes = Dict{Int64,Int64}()

    # Iterate over key-value pairs of models
    for (line_number, record) in models

        # Extract the encoded line of text
        encoded_text = record.record

        # Initialize counter for digits and empty array to store them
        count = 0
        digit_array = Int64[]

        # Loop over each character of the current line of text 
        for position in 1:lastindex(encoded_text)

            # Check if the character is a digit
            if isdigit(encoded_text[position])

                # If it is a digit, convert the character to an Int64 and append it 
                # to an array.
                push!(digit_array, parse(Int64, encoded_text[position]))

                # Keep track of how many digits are contained in the line of text
                count += 1
            end
        end

        # Extract the text code by concatenating the first digit from your 
        # storage array as well as the last digit. If there is only one digit,
        # concatenate the first digit with itself.
        code = string(digit_array[1], count == 1 ? digit_array[1] : digit_array[end])

        # Convert your code string to an Int64
        code_value = parse(Int64, code)

        # Add the code value to the running total
        total += code_value

        # Store the code in the dictionary with its line number as a key
        codes[line_number] = code_value
    end

    # return the total -
    return (total, codes)

end

"""
    decode_part_2(models::Dict{Int64, MyPuzzleRecordModel}) -> Tuple{Int64, Dict{Int64, Int64}}

This method takes models::Dict{Int64, MyPuzzleRecordModel} as an input and 
returns a Tuple with two elements. The first element is the overall hidden sum 
(type Int64) computed from all the encoded lines of text in a file. The second 
element is a dictionary (type Dict{Int64, Int64}) where the key represents a line 
number (starting from index 1), and the value is a two-digit integer computed from 
the first number and the last number of the encoded line of text (the numbers are 
represented either as a digit or a word, and have a range of 1-9).
"""
function decode_part_2(models::Dict{Int64,MyPuzzleRecordModel})::Tuple{Int64,Dict{Int64,Int64}}

    # initialize -
    total = 0
    codes = Dict{Int64,Int64}()

    # TODO: Add the logic for part 2 here
    # ...

    word_to_number = Dict("one" => 1, "two" => 2, "three" => 3, "four" => 4, "five" => 5,
        "six" => 6, "seven" => 7, "eight" => 8, "nine" => 9)

    for (line_number, record) in models

        # Extract the encoded line of text
        encoded_text = record.record

        # Initialize counter for digits and empty array to store them
        count = 0
        digit_array = Int64[]

        current_string = ""

        for position in 1:lastindex(encoded_text)

            # Current substring of the encoded line we're looking at
            current_string *= encoded_text[position]

            # Check if the character is a digit, updte counter and reset current substring if true
            if isdigit(encoded_text[position])  # Check if the character is a digit
                push!(digit_array, parse(Int64, encoded_text[position]))
                current_string = ""
                count += 1
            end

            # If the current substring has length one, check if the letter doesn't match
            # one that a number begins with. If so, reset the current substring
            if (!(current_string in _substring_genertor(length(current_string))) && length(current_string) <= 1)
                current_string = ""

                # If the current substring has length > 1, check if the letters don't match
                # up with the start of a number. If so, discard the first character
            elseif (!(current_string in _substring_genertor(length(current_string))) && length(current_string) > 1)
                current_string = string(current_string[2:end])

                # Check if the substring up to this point contains a number. If so, append to array,
                # reset substring to the last character (to combat frameshifts), and update counter
            elseif haskey(word_to_number, current_string)
                push!(digit_array, word_to_number[current_string])
                current_string = string(current_string[end])
                count += 1
            end

        end

        # Extract the text code by concatenating the first digit from your 
        # storage array as well as the last digit. If there is only one digit,
        # concatenate the first digit with itself.        
        code = string(digit_array[1], count == 1 ? digit_array[1] : digit_array[end])

        # Convert your code string to an Int64
        code_value = parse(Int64, code)

        # Add the code value to the running total
        total += code_value

        # Store the code in the dictionary with its line number as a key
        codes[line_number] = code_value

    end
    # return the total -
    return (total, codes)
end
# ===== PUBLIC METHODS ABOVE HERE ==================================================================================== #