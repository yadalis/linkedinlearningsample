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

--Height
hf = 
   height fill
hfp number = 
    height <| fillPortion number
hpx number
    = height <| px number

--Width
wf = 
   width fill
wfp number 
    = width <| fillPortion number
wpx number
    = width <| px number

--Spacing
sp number
    = spacing number
spx number
    = spacingXY number 0
spy number
    = spacingXY 0 number

-- Border
bw number
    = Border.width number
bwe top right bottom left
    = Border.widthEach    {top = top, right = right, bottom = bottom, left = left}

bwx number
    = Border.widthXY number 0
bwy number
    = Border.widthXY 0 number

bwt number
    = Border.widthEach    {edges | top = number}
bwr number
    = Border.widthEach    {edges | right = number}
bwb number
    = Border.widthEach    {edges | bottom = number}
bwl number
    = Border.widthEach    {edges | left = number}


brc red green blue 
    = Border.color <| rgb255 red green blue
br number
    = Border.rounded number
bre topLeft topRight bottomLeft bottomRight
    = Border.roundEach   {topLeft = topLeft, topRight = topRight, bottomLeft = bottomLeft, bottomRight = bottomRight}

--Background
bc red green blue 
    = Background.color <| rgb255 red green blue

--Padding
pd number
    = padding number
pde top right bottom left
    = paddingEach    {top = top, right = right, bottom = bottom, left = left}

pdx number
    = paddingXY number 0
pdy number
    = paddingXY 0 number

pdt number
    = paddingEach    {edges | top = number}
pdr number
    = paddingEach    {edges | right = number}
pdb number
    = paddingEach    {edges | bottom = number}
pdl number
    = paddingEach    {edges | left = number}


--Font Alignments
fal 
    = Font.alignLeft
far 
    = Font.alignRight
fac 
    = Font.center