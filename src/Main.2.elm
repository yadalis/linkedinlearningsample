module Main exposing (..)

import Html exposing (text)

sum a b=
    a + b

sumWithOne =
    sum 1 

question =
    "Why elm ?"

toUpperLambda =
    (\str -> String.toUpper str)

main = 
    --view init

    -- init
    --     |> String.toUpper
    --     |> view

    init
        |> toUpperLambda
        |> view

answer =
    "Because its great !"

init =
    "question: "
        ++ question
        ++ "Answer: "
        ++ answer

--view : Model -> Html Msg
view model =
    text model
    --text (String.fromInt  (sumWithOne 6))