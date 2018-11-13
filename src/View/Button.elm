module View.Button exposing (btn)

import Html exposing (button, text)
import Html.Attributes exposing (class)

btn txt
    = button [class "btn btn-primary"] [text txt]