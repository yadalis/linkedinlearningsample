module Data.Question exposing (Question)

type alias Question
    = {
        question: String
        ,answerChoices : List String
        ,correctChoice : String
        ,userSelectedChoice: Maybe String
    }