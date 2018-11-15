module View.Question exposing (questionView)

import Data.Question exposing (Question)
import View.Button exposing (btn)
import Html exposing (div, text, Html, input)
 
questionView:  (String -> msg) -> Question -> Html msg
questionView msg {question, incorrect, isCorrect} =
    let
        str = 
            if (isCorrect == "Nothing") then
                ""
            else
                isCorrect
    in

    div []
        [
            text question
            ,div []
                (
                    incorrect
                        |> List.map(\a -> btn (msg a) a)
                        |> List.intersperse (text " ---  ")
                )
            ,div []
            [
               text "Answer: ",  text  str
            ]
        ]