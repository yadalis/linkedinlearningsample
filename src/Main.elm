module Main exposing (..)

import Browser
import Element exposing (..)
import Element.Background as Background
import Element.Border as Border
import Element.Events exposing (..)
import Element.Font as Font
import Element.Input as Input
import Html exposing (Html)

type alias Model
    = {
        channelList : List String
        , chatMessages : List ChatMessage
    }

type alias ChatMessage =
    { author : String, time : String, text : String }

type Msg
    = Answer Int

init : () -> (Model, Cmd Msg)
init _=
    (
        {
            channelList = ["ellie", "elm-core", "elm-format", "elm-ui", "elm-discuss", "general", "news and links"]
            ,chatMessages = 
                            [
                                { author = "augustin82", time = "6:09AM", text = "@gampleman I think you need to `clip` the `scrollable` element, and that that element should be larger than its parent, which (I think) means that the containing parent should have a fixed width" }
                                , { author = "u0421793", time = "6:22AM", text = "I’ve been trying to make a few links on a page in elm and elm-ui but I’ve not found a way to make it work because I haven’t found any examples of elm-ui which incorporate an anchor element" }
                                , { author = "augustin82", time = "6:27AM", text = "@u0421793 what are you looking for exactly? do you have an Ellie where you've tried  doing some stuff?" }
                                , { author = "icepac", time = "7:53 AM", text = "Anybody replied to @lango https://elmlang.slack.com/archives/C4F9NBLR1/p1541911789377400 About Animation vs Element ?" }
                                , { author = "mgriffith", time = "8:00 AM", text = "You can use them together, for sure :smile: You just need to use `Element.htmlAttribute` to render the style attribute." }
                                , { author = "duncan", time = "9:32 AM", text = "so ideally, it'd be nice to get the r,g,b,a components from a `Color` so that I could do the string interp (edited)" }
                                , { author = "lango", time = "1:23 PM", text = "@mgriffith But that isn't really them 'working together' is it, its more they just happen to be together? For example, `elm-ui` has `background.gradient` but `elm-style-animation` only has `backgroundColor`. It's not clear to me how I could animation `elm-ui`'s `background.gradient` using `elm-animation`?" }
                                , { author = "mgriffith", time = "4:28 PM", text = "@lango Oh, yeah I totally agree it isn’t seamless :smile: That’s why I’ve been putting a lot of time towards an API for animation for elm-ui.  But technically `elm-style-animation` and `elm-ui` can work together." }
                                , { author = "eniac314", time = "6:49 AM", text = "It seems it it possible to press buttons without the event handler associated being fired when one clicks the thin area along the top border. In this example: https://ellie-app.com/3T4KLBKbnTQa1 it's possible to see the button moving without the counter increasing or decreasing. Is this due to the way I did the styling for the buttons? It seems to be related to the shadow (edited)" }
                                , { author = "anthony.deschamps", time = "10:24 AM", text = "What's the most recent version of elm-ui/stylish-elephants that works on 0.18?" }
                                , { author = "progger", time = "10:46 AM", text = "I've got some text that I'm laying out in a paragraph, and I want to put a link in there too.  Paragraph put the link on its own line though.  Shouldn't it all flow together?" }
                                , { author = "progger", time = "11:22 AM", text = "Ha, I filed an issue about this back in oct.  Used my own workaround!" }
                            ]
                            -- [ 
                            --     ChatMessage  "Suresh Yadali" "12:30 AM" "By the way, elm-ui does away with the rather troublesome concept of margins and padding that's found in CSS. Instead, you can specify internal padding for an element, and you can also specify the spacing between its child elements. I find this much more intuitive."
                            --     ,ChatMessage "Indira Yadali" "10:30 PM" "By At first glance, this might look like a lot of code, however note that it's really straightforward, and most of it is simply layout and styling attributes. At the bottom of the function, it's very clearly stated that we have vertically arranged header, messages and footer."
                            --     ,ChatMessage "Indira Yadali" "10:30 PM" "At first glance, this might look like a lot of code, however note that it's really straightforward, and most of it is simply layout and styling attributes. At the bottom of the function, it's very clearly stated that we have vertically arranged header, messages and footer."
                            --     ,ChatMessage "Indira Yadali" "10:30 PM" "At first glance, this might look like a lot of code, however note that it's really straightforward, and most of it is simply layout and styling attributes. At the bottom of the function, it's very clearly stated that we have vertically arranged header, messages and footer."
                            --     ,ChatMessage "Indira Yadali" "10:30 PM" "At first glance, this might look like a lot of code, however note that it's really straightforward, and most of it is simply layout and styling attributes. At the bottom of the function, it's very clearly stated that we have vertically arranged header, messages and footer."
                            --     ,ChatMessage "Indira Yadali" "10:30 PM" "At first glance, this might look like a lot of code, however note that it's really straightforward, and most of it is simply layout and styling attributes. At the bottom of the function, it's very clearly stated that we have vertically arranged header, messages and footer."
                            --     ,ChatMessage "Indira Yadali" "10:30 PM" "At first glance, this might look like a lot of code, however note that it's really straightforward, and most of it is simply layout and styling attributes. At the bottom of the function, it's very clearly stated that we have vertically arranged header, messages and footer."
                            --     ,ChatMessage "Indira Yadali" "10:30 PM" "At first glance, this might look like a lot of code, however note that it's really straightforward, and most of it is simply layout and styling attributes. At the bottom of the function, it's very clearly stated that we have vertically arranged header, messages and footer."
                            --     ,ChatMessage "Indira Yadali" "10:30 PM" "At first glance, this might look like a lot of code, however note that it's really straightforward, and most of it is simply layout and styling attributes. At the bottom of the function, it's very clearly stated that we have vertically arranged header, messages and footer."
                            --     ,ChatMessage "Indira Yadali" "10:30 PM" "At first glance, this might look like a lot of code, however note that it's really straightforward, and most of it is simply layout and styling attributes. At the bottom of the function, it's very clearly stated that we have vertically arranged header, messages and footer."
                            --     ,ChatMessage "Indira Yadali" "10:30 PM" "At first glance, this might look like a lot of code, however note that it's really straightforward, and most of it is simply layout and styling attributes. At the bottom of the function, it's very clearly stated that we have vertically arranged header, messages and footer."
                            --     ,ChatMessage "Indira Yadali" "10:30 PM" "At first glance, this might look like a lot of code, however note that it's really straightforward, and most of it is simply layout and styling attributes. At the bottom of the function, it's very clearly stated that we have vertically arranged header, messages and footer."
                            --     ,ChatMessage "Indira Yadali" "10:30 PM" "At first glance, this might look like a lot of code, however note that it's really straightforward, and most of it is simply layout and styling attributes. At the bottom of the function, it's very clearly stated that we have vertically arranged header, messages and footer."
                            --     ,ChatMessage "Indira Yadali" "10:30 PM" "At first glance, this might look like a lot of code, however note that it's really straightforward, and most of it is simply layout and styling attributes. At the bottom of the function, it's very clearly stated that we have vertically arranged header, messages and footer."
                            --     ,ChatMessage "Indira Yadali" "10:30 PM" "At first glance, this might look like a lot of code, however note that it's really straightforward, and most of it is simply layout and styling attributes. At the bottom of the function, it's very clearly stated that we have vertically arranged header, messages and footer."
                            --     ,ChatMessage "Indira Yadali" "10:30 PM" "At first glance, this might look like a lot of code, however note that it's really straightforward, and most of it is simply layout and styling attributes. At the bottom of the function, it's very clearly stated that we have vertically arranged header, messages and footer.Indira Yadali glance, this might look like a lot of code, however note that it's really straightforward, and most of it is simply layout and styling attributes. At the bottom of the function, it's very clearly stated that we have vertically arranged header, messages and footer"
                                
                            -- ]
        }, Cmd.none)

update: Msg -> Model -> (Model, Cmd Msg)
update msg model =
    (model, Cmd.none)

main: Program () Model Msg
main = 
     Browser.element { init = init, update = update, view = view, subscriptions = always Sub.none }

view : Model -> Html Msg
view  model =
    layout [height fill] <|
        row [ height fill, width fill,Border.glow (rgb255 244 65 65) 1]
            [ channelPanel model "elm-core"
            , chatPanel model
            ]

channelPanel : Model -> String -> Element msg
channelPanel {channelList} activeChannel =
    let
        activeChannelAttrs =
            [ Background.color <| rgb255 117 179 201, Font.bold ]

        channelAttrs =
            [ paddingXY 15 5]

        channelEl channel =
            el -- div
                ( 
                    ([width fill] ) ++ --concatinating two lists is just using ++
                    if channel == activeChannel then
                        channelAttrs ++ activeChannelAttrs
                    else
                        channelAttrs
                )
                    <|
                        el [] -- div
                            <| text ("# " ++ channel)

            -- el
            --     (if channel == activeChannel then
            --         activeChannelAttrs ++ channelAttrs
            --      else
            --         channelAttrs
            --     )
            -- <|
            --     text ("# " ++ channel)
    in
    column
        [ height fill
        , width <| fillPortion 1
        , paddingXY 0 30
        , Background.color <| rgb255 92 99 118
        , Font.color <| rgb255 255 255 255
        ]
        <|
            List.map channelEl channelList

messageEntry message =
                        column [paddingXY 50 10, width fill ] 
                        [
                            row [ Border.widthEach { bottom = 1, top = 0, left = 0, right = 0 }, width fill]
                            [
                                  el [ Font.bold, width <| fillPortion 10, Font.alignLeft ] <| text message.author
                                , el [ Background.color <| rgb255 209 79 79, Font.color <| rgb255 249 249 249, width <| fill] <| text message.time
                            ]
                            ,
                            paragraph [paddingEach { bottom = 0, top = 10, left = 0, right = 0 }, Font.alignLeft] 
                            [ 
                                 el [alignLeft,  Border.rounded 3, Border.color <| rgb255 92 99 118, Border.width 0] <| text message.text 
                            ]
                        ]


        
chatPanel : Model -> Element msg
chatPanel model =
    column [ height fill, width <| fillPortion 4]
    [
        -- column [width fill, paddingXY 20 10
        --         , Border.widthEach { bottom = 1, top = 0, left = 0, right = 0 }
        --         , Border.color <| rgb255 200 200 200]
        --     [
                row[width fill, paddingXY 20 10
                , Border.widthEach { bottom = 1, top = 0, left = 0, right = 0 }
                , Border.color <| rgb255 200 200 200]
                [el [] <| text "Left"
                , Input.button
                    [ padding 5
                    , alignRight
                    , Border.width 1
                    , Border.rounded 3
                    , Border.color <| rgb255 200 200 200
                    ]
                    { onPress = Nothing
                    , label = text "Search"
                    }
                ]
            -- ]
        --,column [Background.color <| rgb255  204 201 201, height fill, padding 20,width fill] [ text "asdf"]
        ,column [scrollbarY, width fill] 
                <| List.map messageEntry model.chatMessages

--Border.glow (rgb255 244 65 65) 3

        -- ,wrappedRow [  ] [col1]
        -- ,row [  ] [col1]
        -- ,row [  ] [col1]
        -- ,row [  ] [col1]
        -- ,row [  ] [col1]
        -- ,row [  ] [col1]
        -- ,row [  ] [col1]
        -- ,row [  ] [col1]
        -- ,row [  ] [col1]
        -- ,row [  ] [col1]
            
        -- column [ height fill, width fill,Border.glow (rgb255 244 65 65) 0 ]
        --     [ 
        --         col1
        --         ,col1
        --         ,col1
        --         ,col1
        --         ,col1
        --         ,col1
        --         ,col1
        --         ,col1
        --     ]
          
        ,column [ alignBottom, padding 20, width fill ]
        [
                row
                    [ spacingXY 2 0
                    , width fill
                    , Border.width 2
                    , Border.rounded 4
                    , Border.color <| rgb255 200 200 200
                    ]
                    [ el
                        [ padding 5
                        , Border.widthEach { right = 2, left = 0, top = 0, bottom = 0 }
                        , Border.color <| rgb255 200 200 200
                        , mouseOver [ Background.color <| rgb255 86 182 139 ]
                        ]
                      <|
                        text "+"
                    , el [ Background.color <| rgb255 255 255 255 ] none
                    ]
        ]
    ]



-- channelPanel : Model -> Element msg
-- channelPanel {channelList} =
--     column
--         [ height fill
--         , width <| fillPortion 1
--         , paddingXY 0 10
--         , Background.color <| rgb255 255 114 114
--         , Font.color <| rgb255 255 255 255
--         ]
--         (List.map (\c -> el [paddingXY 15 5, alignLeft, Background.color <| rgb255 117 179 201, Font.bold] <| text ("#" ++ c )) channelList)


-- col1 =
--         column [paddingXY 50 10, width fill] 
--         [
--             row [width fill, Border.widthEach { bottom = 2, top = 0, left = 0, right = 0 }]
--             [
--                   el [ Font.bold  ] <| text "message.author"
--                 , el [ alignRight   ] <| text "message.time"
--             ]
--             ,el []
--                 <|
--                     paragraph [alignLeft, width fill, paddingEach { bottom = 0, top = 3, left = 0, right = 0 }, spacing 19] 
--                     [ 
--                         -- el [alignLeft, Border.dashed, Border.color <| rgb255 92 99 118, Border.width 0] <|
--                         --     text "@mgriffithHow many times did you How many times did you find yourself doing something totally reasonable that should be simple with CSS, only to find yourself getting derailed in bizarre ways? Maybe the text just won't align vertically, or you just can't seem to get the width of the elements right, or the style you've added doesn't seem to have any effect at all find yourself doing something totally reasonable that should be simple with CSS, only to find yourself getting derailed in bizarre ways? Maybe the text just won't align vertically, or you just can't seem to get the width of the elements right, or the style you've added doesn't seem to have any effect at all" 
--                     ]
--         ]


