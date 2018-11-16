module Data.Question exposing (Question, TriviaResults, rootResultDecoder)

import Json.Decode as Decode

type alias Question
    = {
        userAnswer: Maybe String
        ,question : String
        ,correct : String
        ,incorrect: List String
        --,isCorrect : String
        ,isCorrect : Maybe Bool
        ,difficulty : String
    }

type alias TriviaResults =
    {
        response_code : Int,
        results : List Question
    }

rootResultDecoder : Decode.Decoder TriviaResults
rootResultDecoder =
    Decode.map2
                TriviaResults
                    (Decode.field "response_code" Decode.int)
                    (Decode.field "results" (Decode.list questionDecoder))

questionDecoder : Decode.Decoder (Question)
questionDecoder =
    Decode.map6 Question
                (Decode.succeed Nothing)
                (Decode.field "question" Decode.string)
                (Decode.field "correct_answer" Decode.string)
                (Decode.field "incorrect_answers" (Decode.list Decode.string))
--                (Decode.succeed (Just True) )
                (Decode.succeed Nothing)
                (Decode.field "difficulty" Decode.string)
