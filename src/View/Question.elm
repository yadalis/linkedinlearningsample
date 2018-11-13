module View.Question exposing (questionView)

import Data.Question exposing (Question)
import View.Button exposing (btn)
import Html exposing (div, text, Html)

 
questionView: Question -> Html msg
questionView {question, answerChoices} =
    div []
        [
            text question
            ,div []
                (answerChoices
                    |> List.map btn
                    |> List.intersperse (text "  ") )
        ]