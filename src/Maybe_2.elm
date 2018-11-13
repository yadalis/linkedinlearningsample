module Main exposing (..)

import Html exposing (text)
import Maybe

type alias Question
    = {
        userResponse: Maybe String
        ,question: String
        ,correct : String
        ,incorrect : List String
    }

type DifficultLevel
    = 
        Any
        |Easy
        |Medium
        |Hard

type alias Model
    = {
            difficultLevel : DifficultLevel
            ,questions : List Question
      }

init =
    {
        -- questions = [
        --     {question ="A question",correct ="A", incorrect = ["A1","A2","A3"]}
        --     ,{question ="B question",correct ="B", incorrect = ["B1","B2","B3"]}
        --     ,{question ="C question",correct ="C", incorrect = ["C1","C2","C3"]}
        -- ]

        -- this works too, we can treat type aliases as a contructor funtion
        difficultLevel = Medium
        ,questions = [
            Question  (Just "aaaaaA2") "A question" "A" ["A1","A2","A3"]
            ,Question (Nothing) "B question" "A" ["B1","B2","B3"]
            ,Question (Just "cccccccccccccccccccccccccccccccccccccccccccccccccC3") "C question" "A" ["C1","C2","C3"]
        ]
    }

-- unboxUserResponseValue userResponse --2nd way
--     =   case userResponse of
--             Nothing -> 
--                         "there is no answer yet!"
--                             |> String.toUpper
--             Just value ->
--                         value
--                             |> String.fromInt
--                             |> String.reverse

unboxUserResponseValue userResponse --2nd way
    =   Maybe.withDefault
                         ("there is no answer yet!"
                            |> String.toUpper)

                        (userResponse 
                             )
                        

--parseStringToInteger: String -> Result String Int
parseStringToInteger stringValue
     = String.toInt stringValue

main = 
        -- "5d" -- this goes to Nothing case
        -- |> parseStringToInteger
        -- |> unboxUserResponseValue
        -- |> text
 
         "57"  -- this goes to Just value case
        |> parseStringToInteger
        --|> unboxUserResponseValue
        |> text



  