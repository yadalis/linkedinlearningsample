module Main exposing (..)

import Html exposing (..)
import Maybe
import Array exposing (Array)
--import Data.Difficulty as SSS
--import Data.Question as QQQ
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
            --,questions : List Question
            ,questions : Array Question
      }

init: Model
init =
    {
        -- questions = [
        --     {question ="A question",correct ="A", incorrect = ["A1","A2","A3"]}
        --     ,{question ="B question",correct ="B", incorrect = ["B1","B2","B3"]}
        --     ,{question ="C question",correct ="C", incorrect = ["C1","C2","C3"]}
        -- ]

        -- this works too, we can treat type aliases as a contructor funtion
        amount = 5
        ,difficultLevel = defaultDiffcultyLevel
        ,questions = (Array.fromList
            [
                Question  Nothing "Is Elm the best UI Language ?"           "True"  ["True", "False"]--["A1","A2","A3","A4","A5"]
                ,Question Nothing "Does Elm supports Native Mobile apps ? " "False" ["True", "False"] --["B1","B2","B3","B4","B5"]
                ,Question Nothing "Has Elm invented by MHC ?"               "False" ["True","False"] --["D1","D2","D3","D4","D5"]
            ]
        )
        -- ,questions = [
        --     Question  Nothing "Is Elm the best UI Language ?"           "True"  ["True", "False"]--["A1","A2","A3","A4","A5"]
        --     ,Question Nothing "Does Elm supports Native Mobile apps ? " "False" ["True", "False"] --["B1","B2","B3","B4","B5"]
        --     ,Question Nothing "Has Elm invented by MHC ?"               "False" ["True","False"] --["D1","D2","D3","D4","D5"]
        --     -- ,Question (Nothing) "B question" "A" ["B1","B2","B3"]
        --     -- ,Question (Just "cccccccccccccccccccccccccccccccccccccccccccccccccC3") "C question" "A" ["C1","C2","C3"]
        -- ]
    }

type Msg
    = Answer Int String
    | UpdateAmount String
    | ChangeDifficulty DifficultyLevel

main: Program () Model Msg
main = 
    --view init

    Browser.sandbox { init = init, update = update, view = view }

-- unboxUserResponseValue userResponse - 1st way
--     =   Maybe.withDefault "there is no answer yet!" userResponse

-- unboxUserResponseValue userResponse --2nd way
--     =   case userResponse of
--             Nothing -> 
--                         "there is no answer yet!"
--                             |> String.toUpper
--             Just value ->
--                         value

--parseStringToInteger: String -> Result String Int
-- parseStringToInteger stringValue
--      = String.toInt stringValue

update: Msg -> Model -> Model
update msg model =
    case msg of
        Answer index userSelectedAnswer ->
        -- First style
            -- model.questions
            --     |> Array.get index
            --     |> Maybe.map (\q -> {q | userAnswer = Just userSelectedAnswer })
            --     |> Maybe.map (\q -> Array.set index q model.questions)
            --     |> Maybe.map (\arr -> {model | questions = arr})
            --     |> Maybe.withDefault model
        -- Second style
            -- model.questions
            --     |> Array.get index
            --                 -- |> Maybe.map (\q -> {q | userAnswer = Just userSelectedAnswer })
            --                 -- |> Maybe.map (\q -> Array.set index q model.questions)
            --                 -- |> Maybe.map (\arr -> {model | questions = arr})
            --     |> Maybe.map (\userAnsweredQuestion ->  
            --                     let
            --                         modifiedUserAnsweredQuestion = {userAnsweredQuestion | userAnswer = Just userSelectedAnswer}
            --                     in
            --                         {model | questions = Array.set index modifiedUserAnsweredQuestion model.questions}
            --         )
            --     |> Maybe.withDefault model
        -- Third style
            let
                userAnsweredQuestion = model.questions
                                                |> Array.get 7 -- 7 is out of index, so it returns Nothing and the below case returns Hardcoded question

                question = case userAnsweredQuestion of
                                Just val ->
                                    val
                    
                                Nothing ->
                                    --Question  (Just userSelectedAnswer) "Out of index"  "True"  ["True", "False"]
                                    Question  Nothing "Out of index"  "X"  ["X", "Y"]
                
                modifiedUserAnsweredQuestion = { question | userAnswer = Just userSelectedAnswer}
            in
                if not (String.contains "Out of index" modifiedUserAnsweredQuestion.question) then
                    {model | questions = Array.set index modifiedUserAnsweredQuestion model.questions}
                else
                    model
                --{model | questions = Array.set index modifiedUserAnsweredQuestion model.questions}
                
    
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
    -- questions
    --     |> List.map questionView
    --     |> String.join (",")
    --     |> text

    -- div []
    --     (questions
    --       |> List.map questionView)       

    div []
        [
            input [ onInput UpdateAmount,  value (String.fromInt amount)][]
            , select [onInput (ChangeDifficulty << get)]
                (
                    List.map (\key -> option [] [text key]) keys
                )
            ,div[]
                (questions
                |> Array.indexedMap(\i q -> questionView (Answer i) q) 
                |> Array.toList)
        ]