module Main exposing (..)

import Html exposing (text)

sum a b=
    a + b

sumWithOne =
    sum 1 

-- question =
--     "Why elm ?"

toStringList =
    (\num -> String.fromInt num)

toUpperLambda =
    (\str -> String.toUpper str)


list =
    1 :: [2] ++ [3]

main =
    --text ("dfdfdffd")

    --text (String.join " " (List.map toStringList list))

    text(
            list 
                |> List.map toStringList
                |> String.join " "
        )

    -- list 
    --     |> List.map toStringList
    --     |> String.join " "
    --     |> text


    --view init

    -- init
    --     |> String.toUpper
    --     |> view

    --init
        --|> toUpperLambda
        --|> view

    -- list
    --     |> String.fromInt
    --     |> text

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