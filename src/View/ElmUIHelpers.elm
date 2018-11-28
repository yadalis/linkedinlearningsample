module View.ElmUIHelpers exposing (..)

import Element exposing (htmlAttribute, text)
import Html.Attributes exposing (id)

eId idValue
    = htmlAttribute (id idValue)

textValue stringValue
    = text <| stringValue