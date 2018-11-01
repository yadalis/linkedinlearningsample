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

main = 
    --view init

    -- init
    --     |> String.toUpper
    --     |> view

    init
        --|> toUpperLambda
        |> view

-- answer =
--     "Because its great !"

init =
     ( "Why elm ?",  "Because its great !")

--view : Model -> Html Msg
-- view model =
--     text 
--         ("Question: "
--             ++ Tuple.first model
--             ++ " Answer: "
--             ++ Tuple.second model
--         )
    
view (question, answer) =
    text 
        ("Question: "
            ++ question
            ++ " Answer: "
            ++ answer
        )