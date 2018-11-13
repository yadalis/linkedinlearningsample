module Main exposing (..)

import Html exposing (text)
import Maybe
--import Data.Difficulty as SSS
--import Data.Question as QQQ
import Data.Difficulty exposing (..)
import Data.Question exposing (..)
import View.Question exposing (..)

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
        difficultLevel = defaultDiffcultyLevel
        ,questions = [
            Question  (Just "aaaaaA2") "A question" "A" ["A1","A2","A3"]
            ,Question (Nothing) "B question" "A" ["B1","B2","B3"]
            ,Question (Just "cccccccccccccccccccccccccccccccccccccccccccccccccC3") "C question" "A" ["C1","C2","C3"]
        ]
    }

main = 
    view init
    

-- unboxUserResponseValue userResponse - 1st way
--     =   Maybe.withDefault "there is no answer yet!" userResponse

-- unboxUserResponseValue userResponse --2nd way
--     =   case userResponse of
--             Nothing -> 
--                         "there is no answer yet!"
--                             |> String.toUpper
--             Just value ->
--                         value

--parseStringToInteger: String -> Result String Int
parseStringToInteger stringValue
     = String.toInt stringValue

view {questions} =
    questions
        |> List.map questionView
        |> String.join (",")
        |> text