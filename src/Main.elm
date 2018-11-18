module Main exposing (..)

import Browser
import Element exposing (..)
import Element.Background as Background
import Element.Border as Border
import Element.Events exposing (..)
import Element.Font as Font
import Element.Input as Input
import Html exposing (Html)
import Task

isEmpty str =
    String.isEmpty (String.trim (str) )

getSelectedChannel requiredChannelIndex channelList =
    List.filter(\c -> c.index == requiredChannelIndex) channelList
                        |> List.head

getFirstChannel channelList =
    List.head channelList

getFirstChannelName : Maybe Channel -> String
getFirstChannelName channel =
    case channel of
        Just chnl -> chnl.name
        Nothing -> "" --this can happen if the list is empty

getFirstChannelMessages : Maybe Channel -> List ChatMessage
getFirstChannelMessages channel = 
    case channel of
        Just chnl -> chnl.chatMessages
        Nothing -> []

getSelectedChannelIndex selectedChannel =
    case selectedChannel of
        Just slctdChnl -> slctdChnl.index
        Nothing -> ChannelSelectedIndex Nothing
                        
getSelectedChannelName  selectedChannel = 
    case selectedChannel of
        Just slctdChnl -> slctdChnl.name
        Nothing -> "      " --this can happen if the list is empty or either for the first run, so when u call this function and gets empty, then call getFirstChannel|> getFirstChannelName
            
getSelectedChannelMessages  selectedChannel = 
    case selectedChannel of
        Just slctdChnl -> slctdChnl.chatMessages
        Nothing -> [] --this can happen if the list is empty or either for the first run, so when u call this function and gets empty, then call getFirstChannel|> getFirstChannelName
            
unboxSelectedIndexValue : ChannelSelectedIndex -> Int
unboxSelectedIndexValue (ChannelSelectedIndex index) =
        case index of
            Just val -> val
            Nothing -> 0

type alias Model
    = {
        channelList : List Channel
        , selectedChannel : Maybe Channel
    }

type alias Channel
    = {
        name : String
        ,index : ChannelSelectedIndex
        , chatMessages : List ChatMessage
    }

type alias ChatMessage =
    { author : String, time : String, text : String }

type ChannelSelectedIndex = 
    ChannelSelectedIndex (Maybe Int)

type Msg
    = ChannelSelected ChannelSelectedIndex
    | Start ChannelSelectedIndex

init : () -> (Model, Cmd Msg)
init _=
    (
        {
            selectedChannel = Nothing
            ,
            channelList = 
                [
                    Channel "elm-core" (ChannelSelectedIndex (Just 1) )
                        [
                            ChatMessage  "Suresh Yadali" "12:30 AM" "By the way, elm-ui does away with the rather troublesome concept of margins and padding that's found in CSS. Instead, you can specify internal padding for an element, and you can also specify the spacing between its child elements. I find this much more intuitive."
                            ,ChatMessage "Indira Yadali" "10:30 PM" "By At first glance, this might look like a lot of code, however note that it's really straightforward, and most of it is simply layout and styling attributes. At the bottom of the function, it's very clearly stated that we have vertically arranged header, messages and footer."
                            ,ChatMessage "Indira Yadali" "10:30 PM" "At first glance, this might look like a lot of code, however note that it's really straightforward, and most of it is simply layout and styling attributes. At the bottom of the function, it's very clearly stated that we have vertically arranged header, messages and footer."
                        ]
                    ,Channel "elm-format" (ChannelSelectedIndex (Just 2)) 
                        [
                            ChatMessage "Indira Yadali" "10:30 PM" "At first glance, this might look like a lot of code, however note that it's really straightforward, and most of it is simply layout and styling attributes. At the bottom of the function, it's very clearly stated that we have vertically arranged header, messages and footer."
                            ,ChatMessage "Indira Yadali" "10:30 PM" "At first glance, this might look like a lot of code, however note that it's really straightforward, and most of it is simply layout and styling attributes. At the bottom of the function, it's very clearly stated that we have vertically arranged header, messages and footer."
                            ,ChatMessage "Indira Yadali" "10:30 PM" "At first glance, this might look like a lot of code, however note that it's really straightforward, and most of it is simply layout and styling attributes. At the bottom of the function, it's very clearly stated that we have vertically arranged header, messages and footer."
                            ,ChatMessage "Indira Yadali" "10:30 PM" "At first glance, this might look like a lot of code, however note that it's really straightforward, and most of it is simply layout and styling attributes. At the bottom of the function, it's very clearly stated that we have vertically arranged header, messages and footer."
                            ,ChatMessage "Indira Yadali" "10:30 PM" "At first glance, this might look like a lot of code, however note that it's really straightforward, and most of it is simply layout and styling attributes. At the bottom of the function, it's very clearly stated that we have vertically arranged header, messages and footer."
                            ,ChatMessage "Indira Yadali" "10:30 PM" "At first glance, this might look like a lot of code, however note that it's really straightforward, and most of it is simply layout and styling attributes. At the bottom of the function, it's very clearly stated that we have vertically arranged header, messages and footer."
                            ,ChatMessage "Indira Yadali" "10:30 PM" "At first glance, this might look like a lot of code, however note that it's really straightforward, and most of it is simply layout and styling attributes. At the bottom of the function, it's very clearly stated that we have vertically arranged header, messages and footer."
                            ,ChatMessage "Indira Yadali" "10:30 PM" "At first glance, this might look like a lot of code, however note that it's really straightforward, and most of it is simply layout and styling attributes. At the bottom of the function, it's very clearly stated that we have vertically arranged header, messages and footer."
                        ]
                    ,Channel "elm-ui" (ChannelSelectedIndex (Just 3))
                        [
                            ChatMessage "Indira Yadali" "10:30 PM" "At first glance, this might look like a lot of code, however note that it's really straightforward, and most of it is simply layout and styling attributes. At the bottom of the function, it's very clearly stated that we have vertically arranged header, messages and footer."
                            ,ChatMessage "Indira Yadali" "10:30 PM" "At first glance, this might look like a lot of code, however note that it's really straightforward, and most of it is simply layout and styling attributes. At the bottom of the function, it's very clearly stated that we have vertically arranged header, messages and footer."
                            ,ChatMessage "Indira Yadali" "10:30 PM" "At first glance, this might look like a lot of code, however note that it's really straightforward, and most of it is simply layout and styling attributes. At the bottom of the function, it's very clearly stated that we have vertically arranged header, messages and footer."
                            ,ChatMessage "Indira Yadali" "10:30 PM" "At first glance, this might look like a lot of code, however note that it's really straightforward, and most of it is simply layout and styling attributes. At the bottom of the function, it's very clearly stated that we have vertically arranged header, messages and footer."
                            ,ChatMessage "Indira Yadali" "10:30 PM" "At first glance, this might look like a lot of code, however note that it's really straightforward, and most of it is simply layout and styling attributes. At the bottom of the function, it's very clearly stated that we have vertically arranged header, messages and footer."
                            ,ChatMessage "Indira Yadali" "10:30 PM" "At first glance, this might look like a lot of code, however note that it's really straightforward, and most of it is simply layout and styling attributes. At the bottom of the function, it's very clearly stated that we have vertically arranged header, messages and footer."
                        ]
                    ,Channel "elm-discuss" (ChannelSelectedIndex (Just 4)) 
                        [
                            ChatMessage "Indira Yadali" "10:30 PM" "At first glance, this might look like a lot of code, however note that it's really straightforward, and most of it is simply layout and styling attributes. At the bottom of the function, it's very clearly stated that we have vertically arranged header, messages and footer."
                            ,ChatMessage "Indira Yadali" "10:30 PM" "At first glance, this might look like a lot of code, however note that it's really straightforward, and most of it is simply layout and styling attributes. At the bottom of the function, it's very clearly stated that we have vertically arranged header, messages and footer.Indira Yadali glance, this might look like a lot of code, however note that it's really straightforward, and most of it is simply layout and styling attributes. At the bottom of the function, it's very clearly stated that we have vertically arranged header, messages and footer"    
                        ]
                    ,Channel "general" (ChannelSelectedIndex (Just 5)) []
                    ,Channel "news and links" (ChannelSelectedIndex (Just 6)) 
                        [
                            ChatMessage  "Suresh Yadali" "12:30 AM" "By the way, elm-ui does away with the rather troublesome concept of margins and padding that's found in CSS. Instead, you can specify internal padding for an element, and you can also specify the spacing between its child elements. I find this much more intuitive."
                            ,ChatMessage "Indira Yadali" "10:30 PM" "By At first glance, this might look like a lot of code, however note that it's really straightforward, and most of it is simply layout and styling attributes. At the bottom of the function, it's very clearly stated that we have vertically arranged header, messages and footer."
                            ,ChatMessage "Indira Yadali" "10:30 PM" "At first glance, this might look like a lot of code, however note that it's really straightforward, and most of it is simply layout and styling attributes. At the bottom of the function, it's very clearly stated that we have vertically arranged header, messages and footer."

                        ]
                    ,Channel "elm-discuss" (ChannelSelectedIndex (Just 7)) []
                ]
        }
        --, sendMessage (Start (ChannelSelectedIndex 2)))
        , Cmd.none)

update: Msg -> Model -> (Model, Cmd Msg)
update msg model =
    case msg of
        Start index ->
            let
                defaultChannel = getSelectedChannel index model.channelList
            in
                ({model | selectedChannel = defaultChannel}, Cmd.none)

        ChannelSelected index ->
            let
                slctdCnnl = getSelectedChannel index model.channelList
            in
                ( {model | selectedChannel = slctdCnnl} , Cmd.none)
            
main: Program () Model Msg
main = 
     Browser.element { init = init, update = update, view = view, subscriptions = always Sub.none }

view : Model -> Html Msg
view  model =
    let
       defaultChannel = List.head model.channelList
    in
        layout [height fill] <|
            row [ height fill, width fill,Border.glow (rgb255 244 65 65) 1]
                [ channelPanel model
                , chatPanel model
                ]

channelPanel : Model -> Element Msg
channelPanel {channelList, selectedChannel} =
    let
        activeChannelAttrs =
            [ Background.color <| rgb255 117 179 201, Font.bold ]

        channelAttrs =
            [ 
                paddingXY 15 5, width fill, Font.alignLeft, mouseOver [ Background.color <| rgb255 86 182 139], pointer
            ]

        channelEl {name, index} =
            let
                newchannelAttrs = channelAttrs ++ [onClick (ChannelSelected index)] 
                expectedSelectedChannelIndex = getSelectedChannelIndex selectedChannel       
                selectedChannelIndex = 
                    if (expectedSelectedChannelIndex == ChannelSelectedIndex Nothing) then
                        ChannelSelectedIndex Nothing
                    else
                        expectedSelectedChannelIndex
            in
                el -- div
                    (
                        --if name == getSelectedChannelName selectedChannel then  -- this if stmt produces a list by combining the attrs from activeChannelAttrs and channelAttrs
                        
                        --comparing the index values gives more uniqueness to the selction of channels, that is 
                        --if the list of channels contains duplicate channel names, this IF will ensure to select only the clicked channel name
                        --event though the list has other channels with the same name
                        --, but if you use the above IF which compares name with name, then the selecting a duplicate channel name will select all of those
                        --channels, which isnt desired....
                        if index == selectedChannelIndex then  -- this if stmt produces a list by combining the attrs from activeChannelAttrs and channelAttrs
                            newchannelAttrs ++ activeChannelAttrs --concatinating two lists is just using ++
                        else
                            newchannelAttrs
                    )
                    
                    <| text ("# " ++ name ++ " - " ++ String.fromInt (unboxSelectedIndexValue index) )
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
                                , el [ Background.color <| rgb255 216 212 212, Font.color <| rgb255 91 79 79, width <| fill] <| text message.time
                            ]
                            ,
                            paragraph [paddingEach { bottom = 0, top = 10, left = 0, right = 0 }, Font.alignLeft] 
                            [ 
                                 el [alignLeft,  Border.rounded 3, Border.color <| rgb255 92 99 118, Border.width 0] <| text message.text 
                            ]
                        ]

chatPanel : Model -> Element msg
chatPanel model =
    let
        expectedSelectedChannelName = getSelectedChannelName model.selectedChannel
        selectedChannelName =
            if isEmpty expectedSelectedChannelName then
                "Select a Channel to view messages"
                -- getFirstChannel model.channelList
                --     |> getFirstChannelName
            else
                expectedSelectedChannelName
        
        expectedSelectedChannelMessages = getSelectedChannelMessages  model.selectedChannel
        selectedChannelNameMessages =
            if (model.selectedChannel == Nothing) then
                []
            else
                expectedSelectedChannelMessages
            -- if (List.length  expectedSelectedChannelMessages == 0 && model.selectedChannel == Nothing) then
            --     getFirstChannel model.channelList
            --         |> getFirstChannelMessages
            -- else if (List.length  expectedSelectedChannelMessages == 0) then
            --     []
            -- else
            --     expectedSelectedChannelMessages
    in
        column [ height fill, width <| fillPortion 4]
        [
            row[width fill, paddingXY 20 10
                , Border.widthEach { bottom = 1, top = 0, left = 0, right = 0 }
                , Border.color <| rgb255 200 200 200]
            [
                el [] <| text selectedChannelName
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
            ,column [scrollbarY] 
                <| List.map messageEntry selectedChannelNameMessages
                        -- (case model.selectedChannel of
                        --     Just val -> val.chatMessages
                        --     Nothing -> getFirstChannelMessages (List.head model.channelList) )
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

-- this is just to send a message back in to update function when there are no side-effects needed and just a way to put the message back in to update function
sendMessage : msg -> Cmd msg
sendMessage msg =
    Task.succeed msg
        |> Task.perform identity -- dont know what is identity, find out. 