module View.ElmUIShotcuts exposing (..)

import Element exposing (..)
import Element.Background as Background
import Element.Border as Border
import Element.Events exposing (..)
import Element.Font as Font
import Element.Input as Input
 
edges =
    { top = 0
    , right = 0
    , bottom = 0
    , left = 0
    }

hf = 
   height fill

hfp number = 
    if number == 1 then height fill else height <| fillPortion number

wf = 
   width fill

wfp number = 
    if number == 1 then width fill else width <| fillPortion number

sp number
    =   spacing number

spx number
    =   spacingXY number 0

spy number
    =   spacingXY 0 number

bw number
    =   Border.width number

bc red green blue 
    =   Background.color <| rgb255 red green blue

bwe top right bottom left
    =   Border.widthEach    {top = top, right = right, bottom = bottom, left = left}

pde top right bottom left
    =   paddingEach    {top = top, right = right, bottom = bottom, left = left}

pd number
    =   padding number

fal 
    = Font.alignLeft

far 
    = Font.alignRight

fac 
    = Font.center

hpx number
    = height <| px 24

wpx number
    = width <| px 24

br number
    = Border.rounded number

bre topLeft topRight bottomLeft bottomRight
    = Border.roundEach   {topLeft = topLeft, topRight = topRight, bottomLeft = bottomLeft, bottomRight = bottomRight}