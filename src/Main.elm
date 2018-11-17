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
            ,chatMessages = [ 
                                ChatMessage "Suresh Yadali" "12:30 AM" "By the way, elm-ui does away with the rather troublesome concept of margins and padding that's found in CSS. Instead, you can specify internal padding for an element, and you can also specify the spacing between its child elements. I find this much more intuitive."
                                ,ChatMessage "Indira Yadali" "10:30 PM" "At first glance, this might look like a lot of code, however note that it's really straightforward, and most of it is simply layout and styling attributes. At the bottom of the function, it's very clearly stated that we have vertically arranged header, messages and footer."
                                ,ChatMessage "Indira Yadali" "10:30 PM" "At first glance, this might look like a lot of code, however note that it's really straightforward, and most of it is simply layout and styling attributes. At the bottom of the function, it's very clearly stated that we have vertically arranged header, messages and footer."
                                ,ChatMessage "Indira Yadali" "10:30 PM" "At first glance, this might look like a lot of code, however note that it's really straightforward, and most of it is simply layout and styling attributes. At the bottom of the function, it's very clearly stated that we have vertically arranged header, messages and footer."
                                ,ChatMessage "Indira Yadali" "10:30 PM" "At first glance, this might look like a lot of code, however note that it's really straightforward, and most of it is simply layout and styling attributes. At the bottom of the function, it's very clearly stated that we have vertically arranged header, messages and footer."
                                ,ChatMessage "Indira Yadali" "10:30 PM" "At first glance, this might look like a lot of code, however note that it's really straightforward, and most of it is simply layout and styling attributes. At the bottom of the function, it's very clearly stated that we have vertically arranged header, messages and footer."
                                ,ChatMessage "Indira Yadali" "10:30 PM" "At first glance, this might look like a lot of code, however note that it's really straightforward, and most of it is simply layout and styling attributes. At the bottom of the function, it's very clearly stated that we have vertically arranged header, messages and footer."
                                ,ChatMessage "Indira Yadali" "10:30 PM" "At first glance, this might look like a lot of code, however note that it's really straightforward, and most of it is simply layout and styling attributes. At the bottom of the function, it's very clearly stated that we have vertically arranged header, messages and footer."
                                ,ChatMessage "Indira Yadali" "10:30 PM" "At first glance, this might look like a lot of code, however note that it's really straightforward, and most of it is simply layout and styling attributes. At the bottom of the function, it's very clearly stated that we have vertically arranged header, messages and footer."
                                ,ChatMessage "Indira Yadali" "10:30 PM" "At first glance, this might look like a lot of code, however note that it's really straightforward, and most of it is simply layout and styling attributes. At the bottom of the function, it's very clearly stated that we have vertically arranged header, messages and footer."
                                ,ChatMessage "Indira Yadali" "10:30 PM" "At first glance, this might look like a lot of code, however note that it's really straightforward, and most of it is simply layout and styling attributes. At the bottom of the function, it's very clearly stated that we have vertically arranged header, messages and footer."
                                ,ChatMessage "Indira Yadali" "10:30 PM" "At first glance, this might look like a lot of code, however note that it's really straightforward, and most of it is simply layout and styling attributes. At the bottom of the function, it's very clearly stated that we have vertically arranged header, messages and footer."
                                ,ChatMessage "Indira Yadali" "10:30 PM" "At first glance, this might look like a lot of code, however note that it's really straightforward, and most of it is simply layout and styling attributes. At the bottom of the function, it's very clearly stated that we have vertically arranged header, messages and footer."
                                ,ChatMessage "Indira Yadali" "10:30 PM" "At first glance, this might look like a lot of code, however note that it's really straightforward, and most of it is simply layout and styling attributes. At the bottom of the function, it's very clearly stated that we have vertically arranged header, messages and footer."
                                ,ChatMessage "Indira Yadali" "10:30 PM" "At first glance, this might look like a lot of code, however note that it's really straightforward, and most of it is simply layout and styling attributes. At the bottom of the function, it's very clearly stated that we have vertically arranged header, messages and footer."
                                ,ChatMessage "Indira Yadali" "10:30 PM" "At first glance, this might look like a lot of code, however note that it's really straightforward, and most of it is simply layout and styling attributes. At the bottom of the function, it's very clearly stated that we have vertically arranged header, messages and footer."
                                
                            ]
        }, Cmd.none)

update: Msg -> Model -> (Model, Cmd Msg)
update msg model =
    (model, Cmd.none)

main: Program () Model Msg
main = 
     Browser.element { init = init, update = update, view = view, subscriptions = always Sub.none }

view : Model -> Html Msg
view  model =
    layout [height fill  ] <|
        row [ height fill, width fill,Border.glow (rgb255 244 65 65) 0 ]
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
                    column [ ] 
                        
                        [
                            row [width fill , Border.widthEach { bottom = 1, top = 0, left = 0, right = 0 }] [
                          el [ Font.bold ] <| text message.author
                        , el [ Font.bold, alignRight ] <| text message.time ]
                        , paragraph [alignLeft,  paddingEach { bottom = 0, top = 10, left = 0, right = 0 }] [ text message.text ]
                        ]                    
            -- column [ width fill, spacingXY 0 5 ]
            --     [ 
            --     ]

chatPanel : Model -> Element msg
chatPanel {chatMessages}=
    column [ height fill, width <| fillPortion 5]
    [
        row [width fill, paddingXY 20 10
                , Border.widthEach { bottom = 1, top = 0, left = 0, right = 0 }
                , Border.color <| rgb255 200 200 200]
            [
                el [] <| text "Left"
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
        --,column [Background.color <| rgb255  204 201 201, height fill, padding 20,width fill] [ text "asdf"]
        ,column [ paddingXY 100 3, spacingXY 0 5, scrollbarY] <|
                List.map messageEntry chatMessages
        ,el [ alignBottom, padding 20, width fill ] <|
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




