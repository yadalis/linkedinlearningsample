module Data.Difficulty exposing (DifficultyLevel, defaultDiffcultyLevel, keys, getConvertedDifficultyLevelFromString, convertDifficutlyLevelToString, isAnyDifficultLevel)

type DifficultyLevel
    = 
        Any
        |Easy
        |Medium
        |Hard

defaultDiffcultyLevel =
    Any

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


getConvertedDifficultyLevelFromString : String -> DifficultyLevel
getConvertedDifficultyLevelFromString key = 
    list
        |> List.filter (\(k, v) -> k == key)
        |> List.head
        |> Maybe.map Tuple.second
        |> Maybe.withDefault defaultDiffcultyLevel

convertDifficutlyLevelToString difficutlyLevel =
    list
        |> List.filter(\(_, v) -> v == difficutlyLevel)
        |> List.head
        |> Maybe.map Tuple.first
        |> Maybe.withDefault "Any"
        |> String.toLower

isAnyDifficultLevel difficutlyLevel =
    difficutlyLevel == Any
