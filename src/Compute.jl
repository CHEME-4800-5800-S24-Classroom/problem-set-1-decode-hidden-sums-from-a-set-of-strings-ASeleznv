# ===== PRIVATE METHODS BELOW HERE =================================================================================== #
# TODO: Put private helper methods here. Don't forget to use the _ naming convention, and to add basic documentation.
# ===== PRIVATE METHODS ABOVE HERE =================================================================================== #

# ===== PUBLIC METHODS BELOW HERE ==================================================================================== #
"""
    decode_part_1(models::Dict{Int64, MyPuzzleRecordModel}) -> Tuple{Int64, Dict{Int64, Int64}}

This method takes models::Dict{Int64, MyPuzzleRecordModel} as an input and 
returns a Tuple with two elements. The first element is the overall hidden sum 
(type Int64) computed from all the encoded lines of text in a file. The second 
element is a dictionary (type Dict{Int64, Int64}) where the key represents a line 
number (starting from index 1), and the value is a two-digit integer computed from 
the first digit and the last digit of the encoded line of text.
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
        for counter in 1:lastindex(encoded_text)

            # Check if the character is a digit
            if isdigit(encoded_text[counter])

                # If it is a digit, convert the character to an Int64 and append it 
                # to an array.
                push!(digit_array, parse(Int64, encoded_text[counter]))

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

TODO: Add documentation
"""
function decode_part_2(models::Dict{Int64,MyPuzzleRecordModel})::Tuple{Int64,Dict{Int64,Int64}}

    # initialize -
    total = 0
    codes = Dict{Int64,Int64}()

    # TODO: Add the logic for part 2 here
    # ...

    # return the total -
    return (total, codes)
end
# ===== PUBLIC METHODS ABOVE HERE ==================================================================================== #