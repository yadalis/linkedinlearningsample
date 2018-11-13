module Data.Difficulty exposing (DifficultLevel, defaultDiffcultyLevel)

type DifficultLevel
    = 
        Any
        |Easy
        |Medium
        |Hard

defaultDiffcultyLevel =
    Medium