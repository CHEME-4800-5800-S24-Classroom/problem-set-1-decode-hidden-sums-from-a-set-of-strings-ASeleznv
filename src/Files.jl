
# ===== PUBLIC METHODS BELOW HERE ==================================================================================== #
"""
    puzzleparse(filename::String) -> Dict{Int64, MyPuzzleRecordModel}

This method takes a file path as an input and returns a Dictionary whose keys 
represent a line numbers (starting from index 1), and whose value should are 
MyPuzzleRecordModel instances holding the corresponding encoded line of text.
"""
function puzzleparse(filename::String)::Dict{Int64,MyPuzzleRecordModel}

    # initialize -
    records = Dict{Int64,MyPuzzleRecordModel}()
    linecounter = 1

    # main -
    open(filename, "r") do io
        for line ∈ eachline(io)
            records[linecounter] = build(line)
            linecounter += 1
        end
    end

    # return the header and the records -
    return records
end
# ===== PUBLIC METHODS ABOVE HERE ==================================================================================== #