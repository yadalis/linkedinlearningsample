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
    layout [height fill] <|
            row [ height fill, width fill, Border.glow (rgb255 244 65 65) 0]
                [ optionsPanel model
                , estimatePanel model
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
 
estimatePanel : RepairOrder -> Element msg
estimatePanel model =
        column [ height fill, width <| fillPortion 4,  paddingXY 10 10, Border.widthEach {edges | left = 1}, scrollbarY]
        [
            row[width fill,  spaceEvenly, paddingEach { edges | bottom = 5}
                , Border.widthEach { edges | bottom = 2} -- { bottom = 2, top = 0, left = 0, right = 0 }
                , Border.color <| rgb255 237 45 45]
            [
                image [centerY, height <| px 45] {src = "logo.png", description ="Logo" }
                
                ,column[spacingXY 0 15, Font.semiBold, Font.alignRight, width <| fill ]
                    [
                        paragraph [] 
                            [ 
                                 text ("RO# " ++ String.fromInt model.repairOrderNumber)
                            ]
                        ,
                        
                        paragraph []
                            [ 
                                 text "DRAFT 2018-10-30 10:45 AM "
                            ]
                    ]
            ]

            ,row[width fill, paddingEach  {edges | top = 25, bottom = 25}
                ,Font.alignLeft
                , Border.color <| rgb255 237 45 45]
            [
                column[spacingXY 0 10,width <| fill]
                    [
                        dataHeaderPragraph
                            [ 
                                 text ("Repair Order#")
                            ]
                        ,                        
                        dataValuePragraph
                            [ 
                                 text (String.fromInt model.repairOrderNumber)
                            ]
                    ]
                ,column[spacingXY 0 10,width <| fill ]
                    [
                        dataHeaderPragraph 
                            [ 
                                 text ("Branch Number")
                            ]
                        ,
                        dataValuePragraph
                            [ 
                                 text (String.fromInt model.branchNumber)
                            ]
                    ]
                ,column[spacingXY 0 10,width <| fill ]
                    [
                        dataHeaderPragraph 
                            [ 
                                 text ("Department Number")
                            ]
                        ,
                        dataValuePragraph
                            [ 
                                 text (String.fromInt model.branchDepartmentNumber)
                            ]
                    ]
                ,column[spacingXY 0 10,width <| fill ]
                    [
                        dataHeaderPragraph
                            [ 
                                 text ("Phone Number")
                            ]
                        ,
                        
                        dataValuePragraph
                            [ 
                                 text model.branchPhoneNumber
                            ]
                    ]
            ]

            ,row[width fill, Font.semiBold, Border.widthEach {edges | bottom = 1}]
            [
                text "Customer Information"
            ]
            
            ,row[width fill, paddingEach  {edges | top = 15, bottom = 15}
                ,Font.alignLeft, spaceEvenly
                , Border.color <| rgb255 237 45 45
                ,Background.color <| rgb255 225 225 225 ]
            [
                column[ width <| fill, alignTop ,Border.width 0 , paddingEach  {edges | left = 50}]
                    [
                        paragraph []
                            [ 
                                 text model.customerName
                            ]
                    ]
                ,column[spacingXY 0 15, width <| fill,Border.width 0]
                [
                    paragraph [] 
                        [ 
                                text model.customerAddressLine1
                        ]
                    ,
                    
                    paragraph []
                        [ 
                                text model.customerAddressLine2
                        ]
                ]
                ,column[width <| fill, alignTop ,Border.width 0 ]
                    [
                        paragraph []
                            [ 
                                 text model.customerPhoneNumber
                            ]
                    ]
            ]

            ,row[width fill,paddingEach  {edges | top = 25}, Font.semiBold, Border.widthEach {edges | bottom = 1}]
            [
                text "Unit Information"
            ]
            
            ,row[width fill, paddingXY 50 15
                ,Font.alignLeft, spaceEvenly
                , Border.color <| rgb255 237 45 45
                ,Background.color <| rgb255 225 225 225 ]
            [
                column[spacingXY 0 10,width <| fill]
                    [
                        dataHeaderPragraph
                            [ 
                                 text ("Unit#")
                            ]
                        ,                        
                        dataValuePragraph
                            [ 
                                 text model.unitNumber
                            ]
                    ]
                ,column[spacingXY 0 10,width <| fillPortion 3 ]
                    [
                        dataHeaderPragraph 
                            [ 
                                 text ("VIN")
                            ]
                        ,
                        
                        dataValuePragraph
                            [ 
                                 text model.unitVehicleIdNumber
                            ]
                    ]
            ]
            ,row[width fill, paddingXY 50 15
                ,Font.alignLeft, spaceEvenly
                , Border.color <| rgb255 237 45 45
                ,Background.color <| rgb255 225 225 225 ]
            [
                column[spacingXY 0 10,width <| fill]
                    [
                        dataHeaderPragraph 
                            [ 
                                 text ("Year")
                            ]
                        ,                        
                        dataValuePragraph
                            [ 
                                 text (String.fromInt model.year)
                            ]
                    ]
                ,column[spacingXY 0 10,width <| fill ]
                    [
                        dataHeaderPragraph 
                            [ 
                                 text ("Make")
                            ]
                        ,
                        
                        dataValuePragraph
                            [ 
                                 text model.make
                            ]
                    ]
                ,column[spacingXY 0 10,width <| fill ]
                    [
                        dataHeaderPragraph
                            [ 
                                 text ("Model")
                            ]
                        ,
                        
                        dataValuePragraph
                            [ 
                                 text model.model
                            ]
                    ]
                ,column[spacingXY 0 10,width <| fill ]
                    [
                        dataHeaderPragraph 
                            [ 
                                 text ("Mileage")
                            ]
                        ,
                        
                        dataValuePragraph
                            [ 
                                 text (String.fromInt model.mileage)
                            ]
                    ]
            ]
            ,row[width fill, paddingXY 50 15
                ,Font.alignLeft, spaceEvenly
                , Border.color <| rgb255 237 45 45
                ,Background.color <| rgb255 225 225 225 ]
            [
                column[spacingXY 0 10,width <| fill]
                    [
                        dataHeaderPragraph 
                            [ 
                                 text ("Engine Make")
                            ]
                        ,                        
                        dataValuePragraph
                            [ 
                                 text model.engineMake
                            ]
                    ]
                ,column[spacingXY 0 10,width <| fill ]
                    [
                        dataHeaderPragraph 
                            [ 
                                 text ("Engine Model")
                            ]
                        ,
                        dataValuePragraph
                            [ 
                                 text model.engineModel
                            ]
                    ]
                ,column[spacingXY 0 10,width <| fillPortion 2 ]
                    [
                        dataHeaderPragraph 
                            [ 
                                 text ("Engine Serail")
                            ]
                        ,
                        dataValuePragraph -- great example of a partial function
                            [ 
                                 text model.engineSerial
                            ]
                    ]
            ]

             ,row[width fill,paddingEach  {edges | top = 25}, Font.semiBold, Border.widthEach {edges | bottom = 1}]
            [
                text "Job Step #1"
            ]
            ,row[width fill, paddingXY 5 15
                ,Font.alignLeft, spaceEvenly
                , Border.color <| rgb255 237 45 45
                ,Background.color <| rgb255 225 225 225 ]
            [
                column[spacingXY 0 10,width <| fill]
                    [
                        dataHeaderPragraph
                            [ 
                                 text ("Customer Complaint")
                            ]
                    ]
                ,column[spacingXY 0 10,width <| fillPortion 4 ]
                    [
                        dataValuePragraph
                            [ 
                                 text "Complaint: OIL COOLER HOUSING GASKET AND AIR COMPRESSOR COOLANT LINES"
                            ]
                    ]
            ]
            ,row[width fill, paddingXY 5 0
                ,Font.alignLeft, spaceEvenly
                , Border.color <| rgb255 237 45 45
                ,Background.color <| rgb255 225 225 225 ]
            [
                column[spacingXY 0 10,width <| fill]
                    [
                        dataHeaderPragraph
                            [ 
                                 text ("Correction")
                            ]
                    ]
                ,column[spacingXY 0 10,width <| fillPortion 4 ]
                    [
                        dataValuePragraph
                            [ 
                                 text "Correction: OIL COOLER HOUSING GASKET AND AIR COMPRESSOR COOLANT LINES"
                            ]
                    ]
            ]
            ,row[width fill, paddingEach {edges | right = 75, top = 25, left = 5}
                ,Font.alignLeft, spaceEvenly
                , Border.color <| rgb255 237 45 45
                ,Background.color <| rgb255 225 225 225 ]
            [
                 column[spacingXY 0 10, width <| fill ]
                    [
                        paragraph[Font.size 14, Font.alignLeft, Font.semiBold]
                            [ 
                                 text "CHARGE TYPE"
                            ]
                    ]
                ,
                column[spacingXY 0 10, width <| fill ]
                    [
                        paragraph[Font.size 14, Font.alignRight, Font.semiBold]
                            [ 
                                 text "AMOUNT"
                            ]
                    ]
            ]
            ,row[width fill, paddingEach {edges | right = 75, top = 15, left = 5}
                ,Font.alignLeft, spaceEvenly
                , Border.color <| rgb255 237 45 45
                ,Background.color <| rgb255 225 225 225 ]
            [
                column[spacingXY 0 10, width <| fill ]
                    [
                        paragraph[Font.size 14, Font.alignLeft]
                            [ 
                                 text "LABOR"
                            ]
                    ]
                ,column[spacingXY 0 10, width <| fill ]
                    [
                        paragraph[Font.size 14, Font.alignRight]
                            [ 
                                 text "$173.00"
                            ]
                    ]
            ]
            ,row[width fill, paddingEach {edges | right = 75, top = 8, left = 5}
                ,Font.alignLeft, spaceEvenly
                , Border.color <| rgb255 237 45 45
                ,Background.color <| rgb255 225 225 225 ]
            [
                column[spacingXY 0 10, width <| fill ]
                    [
                        paragraph[Font.size 14, Font.alignLeft]
                            [ 
                                 text "PARTS"
                            ]
                    ]
                ,column[spacingXY 0 10, width <| fill ]
                    [
                        paragraph[Font.size 14, Font.alignRight]
                            [ 
                                 text "$13.00"
                            ]
                    ]
            ]
            ,row[width fill, paddingEach {edges | right = 75, top = 8, left = 5}
                ,Font.alignLeft, spaceEvenly
                , Border.color <| rgb255 237 45 45
                ,Background.color <| rgb255 225 225 225 ]
            [
                column[spacingXY 0 10, width <| fill ]
                    [
                        paragraph[Font.size 14, Font.alignLeft]
                            [ 
                                 text "FRIEGHT"
                            ]
                    ]
                ,column[spacingXY 0 10, width <| fill ]
                    [
                        paragraph[Font.size 14, Font.alignRight]
                            [ 
                                 text "$243.00"
                            ]
                    ]
            ]
            ,row[width fill, paddingEach {edges | right = 75, top = 8, left = 5}
                ,Font.alignLeft, spaceEvenly
                , Border.color <| rgb255 237 45 45
                ,Background.color <| rgb255 225 225 225 ]
            [
                column[spacingXY 0 10, width <| fill ]
                    [
                        paragraph[Font.size 14, Font.alignLeft]
                            [ 
                                 text "SUBLET"
                            ]
                    ]
                ,column[spacingXY 0 10, width <| fill ]
                    [
                        paragraph[Font.size 14, Font.alignRight]
                            [ 
                                 text "$64.00"
                            ]
                    ]
            ]
            ,row[width fill, paddingEach {edges | right = 75, top = 8, left = 5, bottom = 10}
                ,Font.alignLeft, spaceEvenly
                , Border.color <| rgb255 237 45 45
                ,Background.color <| rgb255 225 225 225 ]
            [
                column[spacingXY 0 10, width <| fill ]
                    [
                        paragraph[Font.size 14, Font.alignLeft]
                            [ 
                                 text "SHOP SUPPLIES"
                            ]
                    ]
                ,column[spacingXY 0 10, width <| fill ]
                    [
                        paragraph[Font.size 14, Font.alignRight]
                            [ 
                                 text "$13.00"
                            ]
                    ]
            ]

                ,row[width fill,paddingEach  {edges | top = 25}, Font.semiBold, Border.widthEach {edges | bottom = 1}]
            [
                text "Job Step #2"
            ]
            ,row[width fill, paddingXY 5 15
                ,Font.alignLeft, spaceEvenly
                , Border.color <| rgb255 237 45 45
                ,Background.color <| rgb255 225 225 225 ]
            [
                column[spacingXY 0 10,width <| fill]
                    [
                        dataHeaderPragraph
                            [ 
                                 text ("Customer Complaint")
                            ]
                    ]
                ,column[spacingXY 0 10,width <| fillPortion 4 ]
                    [
                        dataValuePragraph
                            [ 
                                 text "Complaint: POWER STEERING PUMP AND STEERING GEAR BOX LEAKING."
                            ]
                    ]
            ]
            ,row[width fill, paddingXY 5 0
                ,Font.alignLeft, spaceEvenly
                , Border.color <| rgb255 237 45 45
                ,Background.color <| rgb255 225 225 225 ]
            [
                column[spacingXY 0 10,width <| fill]
                    [
                        dataHeaderPragraph
                            [ 
                                 text ("Correction")
                            ]
                    ]
                ,column[spacingXY 0 10,width <| fillPortion 4 ]
                    [
                        dataValuePragraph
                            [ 
                                 text "Correction: POWER STEERING PUMP AND STEERING GEAR BOX LEAKING."
                            ]
                    ]
            ]
            ,row[width fill, paddingEach {edges | right = 75, top = 25, left = 5}
                ,Font.alignLeft, spaceEvenly
                , Border.color <| rgb255 237 45 45
                ,Background.color <| rgb255 225 225 225 ]
            [
                 column[spacingXY 0 10, width <| fill ]
                    [
                        paragraph[Font.size 14, Font.alignLeft, Font.semiBold]
                            [ 
                                 text "CHARGE TYPE"
                            ]
                    ]
                ,
                column[spacingXY 0 10, width <| fill ]
                    [
                        paragraph[Font.size 14, Font.alignRight, Font.semiBold]
                            [ 
                                 text "AMOUNT"
                            ]
                    ]
            ]
            ,row[width fill, paddingEach {edges | right = 75, top = 15, left = 5}
                ,Font.alignLeft, spaceEvenly
                , Border.color <| rgb255 237 45 45
                ,Background.color <| rgb255 225 225 225 ]
            [
                column[spacingXY 0 10, width <| fill ]
                    [
                        paragraph[Font.size 14, Font.alignLeft]
                            [ 
                                 text "LABOR"
                            ]
                    ]
                ,column[spacingXY 0 10, width <| fill ]
                    [
                        paragraph[Font.size 14, Font.alignRight]
                            [ 
                                 text "$573.00"
                            ]
                    ]
            ]
            ,row[width fill, paddingEach {edges | right = 75, top = 8, left = 5}
                ,Font.alignLeft, spaceEvenly
                , Border.color <| rgb255 237 45 45
                ,Background.color <| rgb255 225 225 225 ]
            [
                column[spacingXY 0 10, width <| fill ]
                    [
                        paragraph[Font.size 14, Font.alignLeft]
                            [ 
                                 text "PARTS"
                            ]
                    ]
                ,column[spacingXY 0 10, width <| fill ]
                    [
                        paragraph[Font.size 14, Font.alignRight]
                            [ 
                                 text "$2543.00"
                            ]
                    ]
            ]
            ,row[width fill, paddingEach {edges | right = 75, top = 8, left = 5}
                ,Font.alignLeft, spaceEvenly
                , Border.color <| rgb255 237 45 45
                ,Background.color <| rgb255 225 225 225 ]
            [
                column[spacingXY 0 10, width <| fill ]
                    [
                        paragraph[Font.size 14, Font.alignLeft]
                            [ 
                                 text "FRIEGHT"
                            ]
                    ]
                ,column[spacingXY 0 10, width <| fill ]
                    [
                        paragraph[Font.size 14, Font.alignRight]
                            [ 
                                 text "$1243.00"
                            ]
                    ]
            ]
            ,row[width fill, paddingEach {edges | right = 75, top = 8, left = 5}
                ,Font.alignLeft, spaceEvenly
                , Border.color <| rgb255 237 45 45
                ,Background.color <| rgb255 225 225 225 ]
            [
                column[spacingXY 0 10, width <| fill ]
                    [
                        paragraph[Font.size 14, Font.alignLeft]
                            [ 
                                 text "SUBLET"
                            ]
                    ]
                ,column[spacingXY 0 10, width <| fill ]
                    [
                        paragraph[Font.size 14, Font.alignRight]
                            [ 
                                 text "$364.00"
                            ]
                    ]
            ]
            ,row[width fill, paddingEach {edges | right = 75, top = 8, left = 5, bottom = 10}
                ,Font.alignLeft, spaceEvenly
                , Border.color <| rgb255 237 45 45
                
                ,Background.color <| rgb255 225 225 225 ]
            [
                column[spacingXY 0 10, width <| fill ]
                    [
                        paragraph[Font.size 14, Font.alignLeft]
                            [ 
                                 text "SHOP SUPPLIES"
                            ]
                    ]
                ,column[spacingXY 0 10, width <| fill ]
                    [
                        paragraph[Font.size 14, Font.alignRight]
                            [ 
                                 text "$74.00"
                            ]
                    ]
            ]
             ,row[width fill 
                ,Font.alignLeft, spaceEvenly
                ,Border.widthEach {edges | top = 2}
                --,Border.width 2
                -- ,Background.color <| rgb255 235 235 235
                , height <| px 250
                 ]
            [
                column[width <| fillPortion 5, Border.widthEach {edges | right = 2}, height fill, padding 15]
                [             
                    dataValuePragraph
                        [ 
                                text "Every vehicle you can see on the road has its own, unique Vehicle Identification Number (VIN). It is also sometimes referred to as the body number. VIN is unique to every vehicle, which literally means that no two cars share the same VIN. This is why the number is often compared to a car's DNA or a fingerprint, as it makes it possible to identify a vehicle just as easily and precisely. Most of contemporary vehicles have the VIN number in the lower part of the windscreen, on the driver side. The 17 digits should be easily accessible so you won’t need the seller to assist you in finding the VIN."
                        ]
                ]
                ,column[spacingXY 0 10, width <| fillPortion 2,height fill, paddingEach {edges | top = 15 }]
                [
                    row[width fill , paddingXY 0 5
                    ,Font.alignLeft, spaceEvenly
                    --, Border.color <| rgb255 237 45 45
                    ,Border.widthEach {edges | top = 1}
                    ,Background.color <| rgb255 225 225 225]
                    [
                        column[ width <| fill ]
                            [
                                paragraph[Font.size 18, Font.alignLeft]
                                    [ 
                                        text "Labor Total"
                                    ]
                            ]
                        ,column[ width <| fill ]
                            [
                                paragraph[Font.size 18, Font.alignRight]
                                    [ 
                                        text "$573.00"
                                    ]
                            ]
                    ]
                    ,row[width fill , paddingXY 0 5
                        ,Font.alignLeft, spaceEvenly
                        --, Border.color <| rgb255 237 45 45
                        ,Border.widthEach {edges | top = 1}
                        ,Background.color <| rgb255 225 225 225 ]
                    [
                        column[width <| fill ]
                            [
                                paragraph[Font.size 18, Font.alignLeft]
                                    [ 
                                        text "Parts Total"
                                    ]
                            ]
                        ,column[ width <| fill ]
                            [
                                paragraph[Font.size 18, Font.alignRight]
                                    [ 
                                        text "$2543.00"
                                    ]
                            ]
                    ]
                    ,row[width fill , paddingXY 0 5
                        ,Font.alignLeft, spaceEvenly
                        --, Border.color <| rgb255 237 45 45
                        ,Border.widthEach {edges | top = 1}
                        ,Background.color <| rgb255 225 225 225 ]
                    [
                        column[ width <| fill ]
                            [
                                paragraph[Font.size 18, Font.alignLeft]
                                    [ 
                                        text "Frieght Total"
                                    ]
                            ]
                        ,column[ width <| fill ]
                            [
                                paragraph[Font.size 18, Font.alignRight]
                                    [ 
                                        text "$1243.00"
                                    ]
                            ]
                    ]
                    ,row[width fill , paddingXY 0 5
                    ,Font.alignLeft, spaceEvenly
                    --, Border.color <| rgb255 237 45 45
                    ,Border.widthEach {edges | top = 1}
                    ,Background.color <| rgb255 225 225 225 ]
                    [
                        column[  width <| fill ]
                            [
                                paragraph[Font.size 18, Font.alignLeft]
                                    [ 
                                        text "Sublet Total"
                                    ]
                            ]
                        ,column[ width <| fill ]
                            [
                                paragraph[Font.size 18, Font.alignRight]
                                    [ 
                                        text "$364.00"
                                    ]
                            ]
                    ]
                    ,row[width fill , paddingXY 0 5
                        ,Font.alignLeft, spaceEvenly
                        --, Border.color <| rgb255 225 225 225 
                        ,Border.widthEach {edges | top = 1}
                        ,Background.color <| rgb255 225 225 225 ]
                    [
                        column[ width <| fill ]
                            [
                                paragraph[Font.size 18,  Font.alignLeft]
                                    [ 
                                        text "Shop Supplies Total"
                                    ]
                            ]
                        ,column[  width <| fill ]
                            [
                                paragraph[Font.size 18, Font.alignRight]
                                    [ 
                                        text "$74.00"
                                    ]
                            ]
                    ]
                    ,row[width fill, paddingEach {edges | left = 5}
                        ,alignBottom
                        ,height <| px 25
                        ,Border.width 1
                          ]
                    [
                        column[ width <| fillPortion 5]
                            [
                                paragraph[Font.size 18, Font.alignRight]
                                    [ 
                                        text "Estimate Total "
                                    ]
                            ]
                        ,column[  width <| fillPortion 2 ]
                            [
                                paragraph[Font.size 18, Font.alignRight]
                                    [ 
                                        text "$11874.00"
                                    ]
                            ]
                    ]
                ]
            ]
         ]

-- this is just to send a message back in to update function when there are no side-effects needed and just a way to put the message back in to update function
sendMessage : msg -> Cmd msg
sendMessage msg =
    Task.succeed msg
        |> Task.perform identity -- dont know what is identity, find out. 




        -- column[width <| fill]
                --     [
                --         column[spacingXY 0 8]
                --         [
                --             paragraph [] 
                --                 [ 
                --                     text ("Unit #")
                --                 ]
                --             ,                        
                --             paragraph []
                --                 [ 
                --                     text (String.fromInt model.repairOrderNumber)
                --                 ]
                --         ]
                --         ,column[spacingXY 0 8, paddingEach  {edges | top = 25}]
                --         [
                --             paragraph [] 
                --                 [ 
                --                     text ("Year")
                --                 ]
                --             ,         
                --             paragraph []
                --                 [ 
                --                     text (String.fromInt model.repairOrderNumber)
                --                 ]
                --         ]
                --         ,column[spacingXY 0 8, paddingEach  {edges | top = 25}]
                --         [
                --             paragraph [] 
                --                 [ 
                --                     text ("Engine Make")
                --                 ]
                --             ,                        
                --             paragraph []
                --                 [ 
                --                     text (String.fromInt model.repairOrderNumber)
                --                 ]
                --         ]
                --     ]
                --  ,column[width <| fill]
                --     [
                --         column[spacingXY 0 8]
                --         [
                --             paragraph [] 
                --                 [ 
                --                     text ("VIN #")
                --                 ]
                --             ,                        
                --             paragraph []
                --                 [ 
                --                     text (String.fromInt model.repairOrderNumber)
                --                 ]
                --         ]
                --         ,column[spacingXY 0 8, paddingEach  {edges | top = 25}]
                --         [
                --             paragraph [] 
                --                 [ 
                --                     text ("Make")
                --                 ]
                --             ,         
                --             paragraph []
                --                 [ 
                --                     text (String.fromInt model.repairOrderNumber)
                --                 ]
                --         ]
                --         ,column[spacingXY 0 8, paddingEach  {edges | top = 25}]
                --         [
                --             paragraph [] 
                --                 [ 
                --                     text ("Engine Model")
                --                 ]
                --             ,                        
                --             paragraph []
                --                 [ 
                --                     text (String.fromInt model.repairOrderNumber)
                --                 ]
                --         ]
                --     ]
                --     ,column[width <| fill]
                --     [
                --         column[spacingXY 0 8, paddingEach  {edges | top = 60}]
                --         [
                --             paragraph [] 
                --                 [ 
                --                     text ("Model")
                --                 ]
                --             ,         
                --             paragraph []
                --                 [ 
                --                     text (String.fromInt model.repairOrderNumber)
                --                 ]
                --         ]
                --         ,column[spacingXY 0 8, paddingEach  {edges | top = 25}]
                --         [
                --             paragraph [] 
                --                 [ 
                --                     text ("Engine Serial")
                --                 ]
                --             ,                        
                --             paragraph []
                --                 [ 
                --                     text (String.fromInt model.repairOrderNumber)
                --                 ]
                --         ]
                --     ]
                --     ,column[width <| fill]
                --     [
                --         column[spacingXY 0 8, paddingEach  {edges | top = 60}]
                --         [
                --             paragraph [] 
                --                 [ 
                --                     text ("Mileage")
                --                 ]
                --             ,         
                --             paragraph []
                --                 [ 
                --                     text (String.fromInt model.repairOrderNumber)
                --                 ]
                --         ]
                --         ,column[spacingXY 0 8, paddingEach  {edges | top = 60}]
                --         [
                --             paragraph [] 
                --                 [ 
                --                     text (" ")
                --                 ]
                --             ,                        
                --             paragraph []
                --                 [ 
                --                     text ("")
                --                 ]
                --         ]
                --     ]