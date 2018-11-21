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


type alias JobStep =
    { 
          number : Int
          ,customerComplaint : String
          ,correction : String
    }

type Msg
    = VMRSContentIsRequired

init : () -> (RepairOrder, Cmd Msg)
init _=
     ( RepairOrder 30189 20 370 "816-123-1234" "FedEx" "4860 College Blvd" "Overland Park KS 66221" "785-532-8264"
                    "UN-12334" "1HGCM82633A004352" 2018 "Peterbilt" "PB 2809" 123123 "Paccar" "PC-X3443 56345cw3 45w34534 " "45ASDF"
                    [
                        JobStep 1 "OIL COOLER HOUSING GASKET AND AIR COMPRESSOR COOLANT LINES" " OIL COOLER HOUSING GASKET AND AIR COMPRESSOR COOLANT LINES LEAKING."
                        ,JobStep 2 "POWER STEERING PUMP AND STEERING GEAR BOX LEAKING." "POWER STEERING PUMP AND STEERING GEAR BOX LEAKING."
                        ,JobStep 3 "PICK UP AND DELIVER" "PICK UP AND DELIVER"
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
    layout [paddingXY 15 0, Background.color <| rgb255 0 0 0, Border.width 2, Border.color <| rgb255 66 134 244] <|
            column [width fill, Background.color <| rgb255 150 150 150, Border.width 2, Border.color <| rgb255 212 47 47]
                [ 
                    homeHeaderPanel ,
                    middlePanel
                    --leftNavigationPanel,
                    --rightContentPanel,
                    --footerPanel
                ]

middlePanel =
            row[Border.width 2, Border.color <| rgb255 47 46 49, width fill, spaceEvenly]
            [
                column[ width <| fillPortion 2, Border.width 2]
                [              
                    text "asdf"
                    ,text "asdf"
                    ,text "asdf"
                    ,text "asdf"
                    ,text "asdf"
                    ,text "asdf"
                    ,text "asdf"
                    ,text "asdf"
                    ,text "asdf"
                    ,text "asdf"
                    ,text "asdf"
                    ,text "asdf"
                    ,text "asdf"
                    ,text "asdf"
                    ,text "asdf"
                    ,text "asdf"
                    ,text "asdf"
                    ,text "asdf"
                ]
                ,
                column[width <| fillPortion 5, Border.width 2]
                [              
                    text "asdf"
                ]
            ]

homeHeaderPanel =
    row[Border.width 2, Border.color <| rgb255 244 66 203, width fill, spaceEvenly]
    [
        column[ width fill, Border.width 2]
        [
            column[spacingXY 0 25, padding 3 ]
            [
                paragraph []
                [ 
                    image [centerY] {src = "logo.png", description ="Logo" }
                ]
                ,paragraph []
                [ 
                            text "An awesome dealers of large trucks !"
                ]
            ]
        ]
        ,column [width <| fillPortion 3, Border.width 3, alignBottom, height fill]
        [
            row[ width <| fill, Border.width 2, alignBottom ]
            [
                el [width <| fillPortion 3 , Border.width 0] <| text ""
                -- [
                  
                -- ]
                ,column [Font.alignLeft, width fill, Border.width 2, alignBottom]
                [
                    paragraph [] 
                        [ 
                                text ("RO# " ++ String.fromInt 309178)
                        ]   
                    ,paragraph []
                        [ 
                                text "DRAFT 2018-10-30 10:45 AM "
                        ]
                ]
            ]
        ]
    ]