module Data.Difficulty exposing (DifficultyLevel, defaultDiffcultyLevel, keys, get)

type DifficultyLevel
    = 
        Any
        |Easy
        |Medium
        |Hard

defaultDiffcultyLevel =
    Medium

list : List (String, DifficultyLevel)
list = 
    [
        ("Any", Any)
        ,("Easy", Easy)
        ,("Medium", Medium)
        ,("Hard", Hard)
    ]


keys : List String
keys = 
    list
        |> List.unzip
        |> Tuple.first


get : String -> DifficultyLevel
get key = 
    list
        |> List.filter (\(k, v) -> k == key)
        |> List.head
        |> Maybe.map Tuple.second
        |> Maybe.withDefault defaultDiffcultyLevel
