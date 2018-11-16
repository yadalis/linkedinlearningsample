module Main exposing (..)

import Html exposing (..)
import Maybe
import Array exposing (Array)
import Data.Difficulty exposing (..)
import Data.Question exposing (..)
import View.Question exposing (..)
import Html.Attributes exposing (value)
import Html.Events exposing (onInput, onClick)
import Browser
import Task
--import Json.Decode exposing (Value)
import Http exposing(..)

import Json.Decode as Decode
import Json.Encode as Encode

import Utils exposing (..)

type alias Model
    = {
        amount : Int
        ,difficultLevel : DifficultyLevel
        ,questions : Array Question
      }

type alias Flagsx =
    Int

init : Flagsx -> (Model, Cmd Msg)
init intialQuestionCount =
    ({
        amount = intialQuestionCount -- this gets value from the index.js file
        ,difficultLevel = defaultDiffcultyLevel
        ,questions = Array.empty
            -- (Array.fromList
            --     [ 
            --         -- this style of constructing Question unlike record style, works too, we can treat type aliases as a contructor funtion
            --     --     Question  Nothing "Is Elm the best UI Language "           "True"   ["True", "False"] "Nothing" --["A1","A2","A3","A4","A5"]
            --     --     ,Question Nothing "Does Elm supports Native Mobile apps " "False"   ["True", "False"] "Nothing" --["B1","B2","B3","B4","B5"]
            --     --     ,Question Nothing "Has Elm invented by MHC "               "False"  ["True", "False"] "Nothing" --["D1","D2","D3","D4","D5"]

            --         Question  Nothing "Is Elm the best UI Language "           "True"   ["True", "False"] Nothing --["A1","A2","A3","A4","A5"]
            --         ,Question Nothing "Does Elm supports Native Mobile apps " "False"   ["True", "False"] Nothing --["B1","B2","B3","B4","B5"]
            --         ,Question Nothing "Has Elm invented by MHC "               "False"  ["True", "False"] Nothing --["D1","D2","D3","D4","D5"]
            --     ]
            -- )
    }, Cmd.none)

type Msg
    = Answer Int String
    | UpdateAmount String
    | ChangeDifficulty DifficultyLevel
    | Start
    | GetQuestions (Result Error TriviaResults)

main: Program Flagsx Model Msg
main = 
     Browser.element { init = init, update = update, view = view, subscriptions = always Sub.none }
 
update: Msg -> Model -> (Model, Cmd Msg)
update msg model =
    case msg of
        Start -> 
            let
                difficutlyValue =
                    model.difficultLevel
                        |> convertDifficutlyLevelToString
                        |> String.toLower
                
                urlArgs =  String.fromInt model.amount ++ "&type=boolean" ++
                            if isAnyDifficultLevel model.difficultLevel then
                                 ""
                            else
                                "&difficulty=" ++ convertDifficutlyLevelToString model.difficultLevel

            in
                (model,  Http.get { url = "https://opentdb.com/api.php?amount=" ++ urlArgs, expect = Http.expectJson GetQuestions rootResultDecoder })
            
        GetQuestions triviaResult -> 
            let
                questionsList = 
                                case triviaResult of
                                    Ok triviaResultValue ->
                                            -- (Array.fromList
                                            --     [
                                            --         Question  Nothing "Is Elm the best UI Language "           "True"   ["True", "False"] Nothing --["A1","A2","A3","A4","A5"]
                                            --         ,Question Nothing "Does Elm supports Native Mobile apps " "False"   ["True", "False"] Nothing --["B1","B2","B3","B4","B5"]
                                            --         ,Question Nothing "Has Elm invented by MHC "               "False"  ["True", "False"] Nothing --["D1","D2","D3","D4","D5"] 
                                            --     ]
                                            -- )
                                            Array.fromList triviaResultValue.results -- questions from the http.get
                                    Err err ->
                                            Array.empty
            in
            
                ( { model | questions = questionsList } , Cmd.none )

        Answer index userSelectedAnswer ->
        -- First style
            (model.questions
                |> Array.get index
                |> Maybe.map (\q -> {q |    
                                        userAnswer = Just userSelectedAnswer, 
                                        --isCorrect = if (q.correct == userSelectedAnswer) then "Yes" else "No" })  -- this is when isCorrect is a String type
                                        isCorrect = if (q.correct == userSelectedAnswer) then Just True else Just False })  -- this is when isCorrect is a Maybe Bool type
                
                --|> Maybe.map (\q -> {q | isCorrect = if (q.correct == userSelectedAnswer) then "Yes" else "No" })
                |> Maybe.map (\q -> Array.set index q model.questions)
                |> Maybe.map (\arr -> {model | questions = arr})
                |> Maybe.withDefault model
            , Cmd.none)
    
        UpdateAmount amountString ->
           (case (String.toInt amountString) of
                Just val ->
                    {model | amount = val}
            
                Nothing ->
                    model
           ,Cmd.none)

        ChangeDifficulty newDiffcultyLevel ->
            -- the commented two lines also works to send Start message back to update function, but below code is the best option
            -- {model | difficultLevel = newDiffcultyLevel}
            -- |> update (Start)
            ({model | difficultLevel = newDiffcultyLevel},
            sendMessage Start)
               
view: Model -> Html Msg
view {amount, questions} =
    let
        qlist = (questions
                    |> Array.indexedMap(\i q -> questionView (Answer i) q) -- Answer i creates a partial function which takes a string and btn function calls that with the string value to complete the Answer message with both int and string params
                    --its like attaching a function to click events and call the function runtime, but here it is just a 
                    |> Array.toList)
                --|> List.intersperse (text " ---  ")
        --selectedDifficultyLevel = get "Easy"
    in
        div []
            [
                input [ onInput UpdateAmount,  value (String.fromInt amount)][]
                --, select [onInput (ChangeDifficulty << getConvertedDifficultyLevelFromString)] -- this one automatically sends selectedOptiontext value to get function
                -- and feeds the response which is converted from string to DifficultyLevel in to ChangeDifficulty Message
                ,select [onInput (\selectedOptionText -> ChangeDifficulty (getConvertedDifficultyLevelFromString selectedOptionText)) ] -- You can do this too
                    (
                        List.map (\key -> option [] [text key]) keys
                    )
                ,button [onClick Start][text "Start Quiz "]
                ,div[]
                   qlist
            ]

-- this is just to send a message back in to update function when there are no side-effects needed and just a way to put the message back in to update function
sendMessage : msg -> Cmd msg
sendMessage msg =
    Task.succeed msg
        |> Task.perform identity -- dont what is identity, find out.     