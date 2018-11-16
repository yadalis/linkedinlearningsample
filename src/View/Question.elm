module View.Question exposing (questionView)

import Data.Question exposing (Question)
import View.Button exposing (btn)
import Html exposing (div, text, Html, input)
 
questionView:  (String -> msg) -> Question -> Html msg
questionView msg {question, incorrect, isCorrect, correct, difficulty} =
    let
        str = 
            case isCorrect of -- this is when isCorrect is a Maybe Bool type
                Just val ->
                    if not val then
                        "Incorrect"
                    else
                        "Correct"
            
                Nothing ->
                    String.toUpper "Not Answered yet"

            -- if (isCorrect == "Nothing") then -- this is when isCorrect is a String type
            --     ""
            -- else
            --     isCorrect
    in

    div []
        [
            text question
            ,div []
                (
                    correct :: incorrect
                        |> List.sort
                        |> List.map(\a -> btn (msg a) a)
                        |> List.intersperse (text " ")
                )
            ,div []
            [
               text "Answer: ",  text  str
            ]
            ,div []
            [
               text "Difficulty Level: ",  text  difficulty
            ]
        ]