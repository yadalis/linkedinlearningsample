module View.Button exposing (btn)

import Html exposing (button, text)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)

btn msg txt
    = button [onClick msg, class "btn btn-primary"] [text txt]