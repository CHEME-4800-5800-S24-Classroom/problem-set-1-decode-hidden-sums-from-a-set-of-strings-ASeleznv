"""
    MyPuzzleRecordModel

Holds information about encoded lines of text from a document. See the 
production.txt file.
"""
mutable struct MyPuzzleRecordModel
    record::String
    characters::Array{Char,1}
    len::Int64

    MyPuzzleRecordModel(rec::String) = new(rec, collect(rec), length(rec))
end