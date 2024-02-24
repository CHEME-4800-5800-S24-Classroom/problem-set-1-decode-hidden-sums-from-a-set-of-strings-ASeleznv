
# ===== PRIVATE METHODS BELOW HERE =================================================================================== #
# TODO: Put private helper methods here. Don't forget to use the _ naming convention, and to add basic documentation.
# ===== PRIVATE METHODS ABOVE HERE =================================================================================== #

# ===== PUBLIC METHODS BELOW HERE =================================================================================== #
"""
    build(text::String)::MyPuzzleRecordModel

Factory method to build an instance of the MyPuzzleRecordModel type. 
MyPuzzleRecordModel is a model of a line of text contained in the production.txt file
"""
function build(text::String)::MyPuzzleRecordModel

  inst = MyPuzzleRecordModel(text)
  return inst

end
# ===== PUBLIC METHODS ABOVE HERE =================================================================================== #
