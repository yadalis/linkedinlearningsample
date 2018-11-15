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

type alias Model
    = {
            amount : Int
            ,difficultLevel : DifficultyLevel
            ,questions : Array Question
      }

init: Model
init =
    {
        amount = 5
        ,difficultLevel = defaultDiffcultyLevel
        ,questions = (Array.fromList
            [   -- this style of constructing Question unlike record style, works too, we can treat type aliases as a contructor funtion
                Question  Nothing "Is Elm the best UI Language "           "True"   ["True", "False"] "Nothing" --["A1","A2","A3","A4","A5"]
                ,Question Nothing "Does Elm supports Native Mobile apps " "False"   ["True", "False"] "Nothing" --["B1","B2","B3","B4","B5"]
                ,Question Nothing "Has Elm invented by MHC "               "False"  ["True", "False"] "Nothing" --["D1","D2","D3","D4","D5"]
            ]
        )
    }

type Msg
    = Answer Int String
    | UpdateAmount String
    | ChangeDifficulty DifficultyLevel

main: Program () Model Msg
main = 
     Browser.sandbox { init = init, update = update, view = view }
 
update: Msg -> Model -> Model
update msg model =
    case msg of
        Answer index userSelectedAnswer ->
        -- First style
            model.questions
                |> Array.get index
                |> Maybe.map (\q -> {q |    
                                        userAnswer = Just userSelectedAnswer, 
                                        isCorrect = if (q.correct == userSelectedAnswer) then "Yes" else "No" })
                --|> Maybe.map (\q -> {q | isCorrect = if (q.correct == userSelectedAnswer) then "Yes" else "No" })
                |> Maybe.map (\q -> Array.set index q model.questions)
                |> Maybe.map (\arr -> {model | questions = arr})
                |> Maybe.withDefault model
    
        UpdateAmount amountString ->
            case (String.toInt amountString) of
                Just val ->
                    {model | amount = val}
            
                Nothing ->
                    model

        ChangeDifficulty newDiffcultyLevel ->
            {model | difficultLevel = newDiffcultyLevel}


view: Model -> Html Msg
view {amount, questions} =
    let
        qlist = (questions
                    |> Array.indexedMap(\i q -> questionView (Answer i) q) 
                    |> Array.toList)
                --|> List.intersperse (text " ---  ")
    in
        div []
            [
                input [ onInput UpdateAmount,  value (String.fromInt amount)][]
                , select [onInput (ChangeDifficulty << get)]
                    (
                        List.map (\key -> option [] [text key]) keys
                    )
                ,div[]
                   qlist
            ]