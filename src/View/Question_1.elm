module View.Question exposing (questionView)
import Data.Question exposing (..)

import Html exposing (text)

unboxUserResponseValue userResponse --2nd way
    =   case userResponse of
            Nothing -> 
                        "there is no answer yet!"
                            |> String.toUpper
            Just value ->
                        value

anwerChoicesView answerChoices =
    answerChoices
        |> String.join (", ")

questionView: Question -> String
questionView {question, answerChoices} =
            "Question: "
                ++ question
                ++ " Choices: "
                ++ 
                    -- (userResponse
                    --     |> unboxUserResponseValue) --- 1st way

                    anwerChoicesView answerChoices
                        --|> Maybe.map String.toUpper
                        --|> Maybe.map String.reverse
                        --|> anwerChoicesView) --- 1st way

                    --unboxUserResponseValue userResponse - 2nd way

                    -- 3rd way
                    -- (
                    --     case userResponse of
                    --         Nothing -> 
                    --                     "bbb"
                    --         Just a ->
                    --                     a
                    -- )