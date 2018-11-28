module Model exposing (..)

import Html exposing (..)
import Html.Attributes exposing (value)
import Html.Events exposing (on, targetValue)
import Json.Decode as Decode
import Http
import Data.Difficulty exposing (..)
import Data.Question exposing (..)
import Array exposing (Array)

type Msg
    = Start
    | VMRSContentIsRequired
    | RB String
    | ShowVMRSCodes Bool
    | ShowParts Bool
    | SelectJobStep Bool Int
    | SetComment String
    | PrintEstimate
    | ShowLaborRate Bool
    
type alias JobStep =
    {   
        number : Int
        ,customerComplaint : String
        ,correction : String
        ,vmrsCodes : List VMRS
        ,parts : List Part
        ,isPresentable : Bool
    }

type alias UIModel =
    {   
        showVMRSCodes : Bool
        , showParts : Bool
        , showLaborRate : Bool
        , selectedChoice : String
        , jobSteps : Array JobStep
        , jobStepNumbers : Array Int
    }

type alias VMRS =
    { 
          code : String
          ,description : String
          ,strHours : Float
    }

type alias Part =
    { 
          count : Int
          ,code : String
          , description : String
    }

onChange  tagger =
    on "change" (Decode.map tagger targetValue)

appendIf flag value list =
    if flag == True then
        --list ++ [value] -- this is fine as well, to add the item to the list
        value :: list
    else
        list

buildQueryString list =
    list    
        |> List.map (\(a,b) -> a ++ "=" ++ b)
        |> String.join "&"
        |> (++) "?"

apiURL str =
    "https://opentdb.com/api.php" ++ str