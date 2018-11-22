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
import Array exposing (Array)

import View.ROEstimateHeaderView exposing (..)

-- type alias Model
--     = {
--         repairOrder : RepairOrder
--     }


type alias RepairOrder =
    { 
          repairOrderNumber : Int
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
        , jobSteps : Array JobStep
        , showVMRSCodes : Bool
        , showParts : Bool
        , selectedChoise : String
    }

-- type alias JobStep =
--     { 
--           number : Int
--           ,customerComplaint : String
--           ,correction : String
--           ,vmrsCodes : List VMRS
--           ,parts : List Part
--     }

--init : () -> (RepairOrder, Cmd Msg)
init _=
     ( 
        {
             repairOrderNumber = 30189
            , branchNumber = 20
            , branchDepartmentNumber = 370
            , branchPhoneNumber = "234-234-6345"
            , customerName =" FedEx"
            , customerAddressLine1 = "4860 College Blvd"
            , customerAddressLine2 = "Leadwood KS 66211"
            , customerPhoneNumber = "81-423-5255"
            , unitNumber = "UN-153345"
            , unitVehicleIdNumber = "1NXZASRTQWE$TERG"
            , year = 2018
            , make = "Kenworth"
            , model = "T-880"
            , mileage = 23452345
            , engineMake = "Paccar"
            , engineModel = "PC-X345344"
            , engineSerial = "WE$TERG"
            , jobSteps =  (Array.fromList[
                    -- correction : String
                    -- ,customerComplaint : String
                    -- ,isPresentable : Bool
                    -- ,number : Int
                    -- ,parts : List Part
                    -- ,vmrsCodes : List VMRS
                    
                    JobStep 
                            1 
                            "OIL COOLER HOUSING GASKET AND AIR COMPRESSOR COOLANT LINES"
                            " OIL COOLER HOUSING GASKET AND AIR COMPRESSOR COOLANT LINES LEAKING."                            
                            [VMRS "119-03-01-05-132" "Brakes and Cluth combo Brakes and Cluth combo Brakes and Cluth combo Brakes and Cluth combo Brakes and Cluth combo Brakes and Cluth combo Brakes and Cluth combo" 12.5
                                , VMRS "119-031-011-015-132" "Brakes and Cluth combo " 14.0
                                , VMRS "219-031-011-015-132" "Brakes and Cluth combo " 16.5]
                            [Part 1 "P1asdfasdfasdfasdf34343434343asdgsadgsdgf asdfasdfasdf asdfasdfasdfasdfasfasdf asdfasfasfasdfasdf asdfas" "OIL COOLER HOUSING GASKET AND AIR COMPRESSOR COOLANT LINES OIL COOLER HOUSING GASKET AND AIR"
                                , Part 2 "Brakes and Cluth combo" "OIL COOLER HOUSING GASKET AND AIR COMPRESSOR COOLANT LINES OIL COOLER HOUSING GASKET AND AIR COMPRESSOR COOLANT LINES" 
                                , Part 5 "P3asd" "Part 3"]
                            True
                    ,JobStep 2 "POWER STEERING PUMP AND STEERING GEAR BOX LEAKING." "POWER STEERING PUMP AND STEERING GEAR BOX LEAKING."
                             [VMRS "119-03-01-05-132" "Brakes and Cluth combo Brakes and Cluth combo Brakes and Cluth combo Brakes and Cluth combo Brakes and Cluth combo Brakes and Cluth combo Brakes and Cluth combo" 12.5
                            , VMRS "119-031-011-015-132" "Brakes and Cluth combo " 14.0
                            , VMRS "219-031-011-015-132" "Brakes and Cluth combo " 16.5]
                             [Part 1 "P1asdfasdfasdfasdf34343434343asdgsadgsdgf asdfasdfasdf asdfasdfasdfasdfasfasdf asdfasfasfasdfasdf asdfas" "OIL COOLER HOUSING GASKET AND AIR COMPRESSOR COOLANT LINES OIL COOLER HOUSING GASKET AND AIR", Part 2 "Brakes and Cluth combo" "OIL COOLER HOUSING GASKET AND AIR COMPRESSOR COOLANT LINES OIL COOLER HOUSING GASKET AND AIR COMPRESSOR COOLANT LINES" , Part 5 "P3asd" "Part 3"]
                            True
                    ,JobStep 3 "PICK UP AND DELIVER" "PICK UP AND DELIVER"
                             [VMRS "119-03-01-05-132" "Brakes and Cluth combo Brakes and Cluth combo Brakes and Cluth combo Brakes and Cluth combo Brakes and Cluth combo Brakes and Cluth combo Brakes and Cluth combo" 12.5
                            , VMRS "119-031-011-015-132" "Brakes and Cluth combo " 14.0
                            , VMRS "219-031-011-015-132" "Brakes and Cluth combo " 16.5]
                             [Part 1 "P1asdfasdfasdfasdf34343434343asdgsadgsdgf asdfasdfasdf asdfasdfasdfasdfasfasdf asdfasfasfasdfasdf asdfas" "OIL COOLER HOUSING GASKET AND AIR COMPRESSOR COOLANT LINES OIL COOLER HOUSING GASKET AND AIR", Part 2 "Brakes and Cluth combo" "OIL COOLER HOUSING GASKET AND AIR COMPRESSOR COOLANT LINES OIL COOLER HOUSING GASKET AND AIR COMPRESSOR COOLANT LINES" , Part 5 "P3asd" "Part 3"]
                            False
                ]
            )
            , showVMRSCodes = False
            , showParts = False
            , selectedChoise = "Tryo"
         },Cmd.none)


update: Msg -> RepairOrder -> (RepairOrder, Cmd Msg)
update msg model =
    case msg of
        ShowVMRSCodes canShowVMRSCode ->
            ( {model | showVMRSCodes = canShowVMRSCode}, Cmd.none)
        
        ShowParts canShowParts ->
            ( {model | showParts = canShowParts}, Cmd.none)
        
        RB str ->
            ( {model | selectedChoise = str}, Cmd.none)

        ShowJobStep canShowJobStep jsNumber ->
            ( -- First style
             model.jobSteps
                |> Array.get jsNumber
                |> Maybe.map (\q -> {q | isPresentable = canShowJobStep})
                |> Maybe.map (\q -> Array.set jsNumber q model.jobSteps)
                |> Maybe.map (\arr -> {model | jobSteps = arr})
                |> Maybe.withDefault model
            , Cmd.none)

        VMRSContentIsRequired  ->
           ( model, Cmd.none)
            
main: Program () RepairOrder Msg
main = 
     Browser.element { init = init, update = update, view = view, subscriptions = always Sub.none }

view : RepairOrder -> Html Msg
view  model =
    layout [height fill] <|
            row [ height fill, width fill, Border.glow (rgb255 244 65 65) 0]
                [ 
                    optionsPanel model
                    , estimatePanel model
                ]
        
optionsPanel : RepairOrder -> Element Msg
optionsPanel model =
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
        
        --ele = if (Array.length model.jobSteps) == Array.length (Array.filter (\js -> js.isPresentable == True) model.jobSteps ) then
        vmrspartsOPtions = if Array.length (Array.filter (\js -> js.isPresentable == True) model.jobSteps ) > 0 then
                    column[spacingXY 0 5, alignRight]
                    [
                        Input.checkbox [Border.width 0 ] {
                            onChange = ShowVMRSCodes
                            ,icon = (\b ->
                                            if b == True then image [centerY] {src = "uncheck.png", description ="Logo" } else image [centerY] {src = "check.png", description ="Logo" })
                            , label = Input.labelLeft [alignRight] (el [paddingXY 0 0, alignLeft] <| text (if model.showVMRSCodes then "Hide VMRS Codes" else "Show VMRS Codes"))
                            --, label = Input.labelLeft [alignRight] (el [] <| none)
                            , checked = model.showVMRSCodes
                        }
                        ,Input.checkbox [Border.width 0 ]{
                            onChange = ShowParts
                            ,icon = (\b ->
                                            if b == True then image [centerY] {src = "uncheck.png", description ="Logo" } else image [centerY] {src = "check.png", description ="Logo" })
                            , label = Input.labelLeft [alignRight] (el [paddingEach {edges | right = 5}, alignLeft] <| text (if model.showParts then "Hide Parts" else "Show Parts"))
                            , checked = model.showParts
                        }
                    ]
                else
                    none
    in
    column
        [  height fill
        , width fill
        , paddingXY 10 10
        , Background.color <| rgb255 225 225 225
        --, Font.color <| rgb255 25 25 25
        ,spacingXY 0 15
  
        ]
        [
            row[Border.widthEach {edges | bottom = 2}, width fill, paddingEach {edges | top = 25}]
            [paragraph [Font.center, paddingXY 0 5] [text "Estimate generation options"] ]
           
           
            ,row[Border.widthEach {edges | bottom = 1}, width fill, paddingEach {edges | top = 5}]
            [paragraph [Font.alignLeft, paddingXY 0 5] [text "Jobsteps"] ]
           
            ,column[spacingXY 0 5, alignRight]
                 (List.indexedMap jobStepOption (Array.toList model.jobSteps) )

            -- ,row[Border.widthEach {edges | bottom = 2}, width fill, paddingEach {edges | top = 25}]
            -- [paragraph [Font.center, paddingXY 0 5] [none] ]

            ,row[Border.widthEach {edges | bottom = 1}, width fill, paddingEach {edges | top = 5}]
            [paragraph [Font.alignLeft, paddingXY 0 5] [text "Extra info"] ]

            ,vmrspartsOPtions


            -- ,Input.radio
            --     [ padding 10
            --     , spacing 20
            --     ]
            --         { onChange = RB
            --         , selected = Just model.selectedChoise
            --         , label = Input.labelAbove [] (el [] <| text "Lunch ")
            --         , options =
            --             [  
            --             Input.option "Taco" (text "Taco!")
            --             , Input.option "Gyro" (text "Gyro")
            --             ]
            --         }           
        ]

jobStepOption : Int -> JobStep -> Element Msg
jobStepOption index jobStep =
            Input.checkbox [Border.width 0 ] {
                onChange = (\b -> ShowJobStep b index)
                ,icon = (\b ->
                                if b == True then image [centerY] {src = "uncheck.png", description ="Logo" } else image [centerY] {src = "check.png", description ="Logo" })
                , label = Input.labelLeft [alignRight] (el [paddingEach {edges | right = 5}, alignLeft] <| text (if jobStep.isPresentable then "Hide JobStep# " ++ String.fromInt jobStep.number else "Show JobStep# " ++ String.fromInt jobStep.number))
                , checked = jobStep.isPresentable
            }

estimatePanel : RepairOrder -> Element Msg
estimatePanel model =
        let
            lst =    List.filter (\js -> js.isPresentable)  (Array.toList model.jobSteps)
        in
        
            column [height fill,  width <| fillPortion 4,  paddingXY 10 10, Border.widthEach {edges | left = 1}]
            [
                row[width fill]
                    [roEstimateHeaderView model.repairOrderNumber]
                ,column[scrollbarY]
                [
                    roInfoView model.repairOrderNumber model.branchNumber model.branchDepartmentNumber model.branchPhoneNumber
                    ,customerInfoView model.customerName model.customerAddressLine1 model.customerAddressLine2 model.customerPhoneNumber
                    ,unitInfoView model
                    ,column[width fill]
                                    (List.map3 jobStepInfoView lst (List.repeat (Array.length model.jobSteps) model.showVMRSCodes ) (List.repeat (Array.length model.jobSteps) model.showParts ) )

                    ,estimateNotesAndGrandTotalsView model
                ]
            ]

                    
-- this is just to send a message back in to update function when there are no side-effects needed and just a way to put the message back in to update function
sendMessage : msg -> Cmd msg
sendMessage msg =
    Task.succeed msg
        |> Task.perform identity -- dont know what is identity, find out.