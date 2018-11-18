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

getSelectedChannelIndex selectedChannel =
    case selectedChannel of
        Just slctdChnl -> slctdChnl.index
        Nothing -> ChannelSelectedIndex 1
                        
getSelectedChannelName  selectedChannel = 
    case selectedChannel of
        Just slctdChnl -> slctdChnl.name
        Nothing -> "      " --this can happen if the list is empty or either for the first run, so when u call this function and gets empty, then call getFirstChannel|> getFirstChannelName
            
unboxSelectedIndexValue : ChannelSelectedIndex -> Int
unboxSelectedIndexValue (ChannelSelectedIndex index) =
        index

type alias Model
    = {
        channelList : List Channel
        , chatMessages : List ChatMessage
        , selectedChannel : Maybe Channel
    }

type alias Channel
    = {
        name : String
        ,index : ChannelSelectedIndex
    }

type alias ChatMessage =
    { author : String, time : String, text : String }

type ChannelSelectedIndex = 
    ChannelSelectedIndex Int

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
                    Channel "elm-core" (ChannelSelectedIndex 1)
                    ,Channel "elm-format" (ChannelSelectedIndex 2)
                    ,Channel "elm-ui" (ChannelSelectedIndex 3)
                    ,Channel "elm-discuss" (ChannelSelectedIndex 4)
                    ,Channel "general" (ChannelSelectedIndex 5)
                    ,Channel "news and links" (ChannelSelectedIndex 6)
                    ,Channel "elm-discuss" (ChannelSelectedIndex 7)
                ]
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
                            ] ++ -- List concating -> produces new list with combined lists
                            [ 
                                ChatMessage  "Suresh Yadali" "12:30 AM" "By the way, elm-ui does away with the rather troublesome concept of margins and padding that's found in CSS. Instead, you can specify internal padding for an element, and you can also specify the spacing between its child elements. I find this much more intuitive."
                                ,ChatMessage "Indira Yadali" "10:30 PM" "By At first glance, this might look like a lot of code, however note that it's really straightforward, and most of it is simply layout and styling attributes. At the bottom of the function, it's very clearly stated that we have vertically arranged header, messages and footer."
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
                                ,ChatMessage "Indira Yadali" "10:30 PM" "At first glance, this might look like a lot of code, however note that it's really straightforward, and most of it is simply layout and styling attributes. At the bottom of the function, it's very clearly stated that we have vertically arranged header, messages and footer.Indira Yadali glance, this might look like a lot of code, however note that it's really straightforward, and most of it is simply layout and styling attributes. At the bottom of the function, it's very clearly stated that we have vertically arranged header, messages and footer"    
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
                selectedChannelIndex = getSelectedChannelIndex selectedChannel                
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
                getFirstChannel model.channelList
                    |> getFirstChannelName
            else
                expectedSelectedChannelName
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
                <| List.map messageEntry model.chatMessages
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