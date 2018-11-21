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
import Utils exposing (..)

import View.ROEstimateHeaderView exposing (..)

-- type alias Model
--     = {
--         repairOrder : RepairOrder
--     }


type alias RepairOrder =
    { 
          repairOrderNumber : Int
        -- , aggregateRootId: String
        , branchNumber : Int
        , branchDepartmentNumber : Int
        , branchPhoneNumber : String
        , customerName : String
        , customerAddressLine1 : String
        , customerAddressLine2 : String
        , customerPhoneNumber : String
        , unitNumber : String
        , unitVehicleIdNumber : String
        , year : Int
        , make : String
        , model : String
        , mileage : Int
        , engineMake : String
        , engineModel : String
        , engineSerial : String
        -- , internalStatus: String
        , jobSteps : List JobStep
        -- , driverWaiting: Bool
        -- , isPortalUser: Int
        -- , timeZoneDisplay: String
        -- , estimatedWorkFinish: Maybe String
    }

dataValueFont =
    Font.size 15

dataValuePragraph = 
    paragraph [Font.size 16]

dataHeaderPragraph = 
    paragraph [Font.size 18]

type alias JobStep =
    { 
          number : Int
          ,customerComplaint : String
          ,correction : String
          ,vmrsCodes : List VMRS
          ,parts : List Part
    }




init : () -> (RepairOrder, Cmd Msg)
init _=
     ( RepairOrder 30189 20 370 "816-123-1234" "FedEx" "4860 College Blvd" "Overland Park KS 66221" "785-532-8264"
                    "UN-12334" "1HGCM82633A004352" 2018 "Peterbilt" "PB 2809" 123123 "Paccar" "PC-X3443 56345cw3 45w34534 " "45ASDF"
                    [
                        JobStep 1 "OIL COOLER HOUSING GASKET AND AIR COMPRESSOR COOLANT LINES" " OIL COOLER HOUSING GASKET AND AIR COMPRESSOR COOLANT LINES LEAKING."
                        [VMRS "119-03-01-05-132" "Brakes and Cluth combo Brakes and Cluth combo Brakes and Cluth combo Brakes and Cluth combo Brakes and Cluth combo Brakes and Cluth combo Brakes and Cluth combo" 12.5
                        , VMRS "119-031-011-015-132" "Brakes and Cluth combo " 14.0
                        , VMRS "219-031-011-015-132" "Brakes and Cluth combo " 16.5]
                        [Part 1 "P1asdfasdfasdfasdf34343434343asdgsadgsdgf asdfasdfasdf asdfasdfasdfasdfasfasdf asdfasfasfasdfasdf asdfas" "OIL COOLER HOUSING GASKET AND AIR COMPRESSOR COOLANT LINES OIL COOLER HOUSING GASKET AND AIR", Part 2 "Brakes and Cluth combo" "OIL COOLER HOUSING GASKET AND AIR COMPRESSOR COOLANT LINES OIL COOLER HOUSING GASKET AND AIR COMPRESSOR COOLANT LINES" , Part 5 "P3asd" "Part 3"]
                        ,JobStep 2 "POWER STEERING PUMP AND STEERING GEAR BOX LEAKING." "POWER STEERING PUMP AND STEERING GEAR BOX LEAKING."
                        [][]
                        ,JobStep 3 "PICK UP AND DELIVER" "PICK UP AND DELIVER"
                        [][]
                    ] ,Cmd.none)

update: Msg -> RepairOrder -> (RepairOrder, Cmd Msg)
update msg model =
    case msg of
        VMRSContentIsRequired   ->
           ( RepairOrder 30189 20 370 "816-123-1234" "FedEx" "4860 College Blvd" "Overland Park KS 66221" "785-532-8264"
                    "UN-12334" "1NXSDRFGSCD45ASDF" 2018 "Peterbilt" "PB 2809" 123123 "Paccar" "PC-X344356" "45ASDF" [],Cmd.none)
            
main: Program () RepairOrder Msg
main = 
     Browser.element { init = init, update = update, view = view, subscriptions = always Sub.none }

view : RepairOrder -> Html Msg
view  model =
    layout [height fill] <|
        column[] [
            row [ height fill, width fill, Border.glow (rgb255 244 65 65) 0]
                [ 
                    optionsPanel model
                    , estimatePanel model
                ]
        ]
        
optionsPanel : RepairOrder -> Element Msg
optionsPanel _ =
    let
        activeChannelAttrs =
            [ Background.color <| rgb255 117 179 201, Font.bold ]

        channelAttrs =
            [ 
                paddingXY 15 5, width fill, Font.alignLeft, mouseOver [ Background.color <| rgb255 86 182 139], pointer
            ]

        channelEl {name, index} =
                el -- div
                    (
                        --if name == getSelectedChannelName selectedChannel then  -- this if stmt produces a list by combining the attrs from activeChannelAttrs and channelAttrs
                        
                        --comparing the index values gives more uniqueness to the selction of channels, that is 
                        --if the list of channels contains duplicate channel names, this IF will ensure to select only the clicked channel name
                        --event though the list has other channels with the same name
                        --, but if you use the above IF which compares name with name, then the selecting a duplicate channel name will select all of those
                        --channels, which isnt desired....
                     channelAttrs
                    )
                    
                    <| text ("#   " )
    in
    column
        [ height fill
        , width <| fillPortion 1
        , paddingXY 0 30
        , Background.color <| rgb255 219 219 219
        , Font.color <| rgb255 25 25 25
        ]
        [
            text " "
        ]
 
estimatePanel : RepairOrder -> Element Msg
estimatePanel model =
        column [ height fill, width <| fillPortion 4,  paddingXY 10 10, Border.widthEach {edges | left = 1}, scrollbarY]
        [
            roEstimateHeaderView model.repairOrderNumber
            ,roInfoView model.repairOrderNumber model.branchNumber model.branchDepartmentNumber model.branchPhoneNumber
            ,customerInfoView model.customerName model.customerAddressLine1 model.customerAddressLine2 model.customerPhoneNumber
            ,unitInfoView model
            ,column[width fill]
                        (List.map jobStepInfoView model.jobSteps)
            ,estimateNotesAndGrandTotalsView model
         ]

                    
-- this is just to send a message back in to update function when there are no side-effects needed and just a way to put the message back in to update function
sendMessage : msg -> Cmd msg
sendMessage msg =
    Task.succeed msg
        |> Task.perform identity -- dont know what is identity, find out.