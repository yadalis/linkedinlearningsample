module Main exposing (..)

import Html exposing (text)

sum a b=
    a + b

sumWithOne =
    sum 1 

-- question =
--     "Why elm ?"

toUpperLambda =
    (\str -> String.toUpper str)

list =
    1 :: [2] ++ [3]

main = 
    --view init

    -- init
    --     |> String.toUpper
    --     |> view

    --init
        --|> toUpperLambda
        --|> view

    list
        |> String.fromInt
        |> text

-- answer =
--     "Because its great !"

init =
    {   question= "Why elm ?", 
        answer = "Because its great !" 
    }

--view : Model -> Html Msg
-- view model =
--     text 
--         ("Question: "
--             ++ Tuple.first model
--             ++ " Answer: "
--             ++ Tuple.second model
--         )

-- view model =
--     text 
--         ("Question: "
--             --++ model.question
--             ++ .question model
--             ++ " Answer: "
--             --++ model.answer
--             ++ .answer model
--         )

-- view {question, answer} =
--     text 
--         ("Question: "
--             ++ question
--             ++ " Answer: "
--             ++ answer
--         )