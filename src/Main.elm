module Main exposing (..)

import Browser
import Element exposing (..)
import Element.Background as Background
import Element.Border as Border
import Element.Events exposing (..)
import Element.Font as Font
import Element.Input as Input
import Html  as HTM
import Html.Attributes as HTMLAttr
import Task
import Utils exposing (..)
import Array exposing (Array)

import View.ROEstimateHeaderView exposing (..)
import View.ElmUIShotcuts exposing (..)

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
        , showLaborRate : Bool
        , selectedChoise : String
        , userComment : String
    }

init : () -> (RepairOrder, Cmd Msg)
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
                    JobStep 
                            1 
                            "OIL COOLER HOUSING GASKET AND AIR COMPRESSOR COOLANT LINES"
                            " OIL COOLER HOUSING GASKET AND AIR COMPRESSOR COOLANT LINES LEAKING."                            
                            [VMRS "119-03-01-05-132" "Brakes and Cluth combo Brakes and Cluth combo Brakes and Cluth combo Brakes and Cluth combo Brakes and Cluth combo Brakes and Cluth combo Brakes and Cluth combo" 12.5
                                , VMRS "119-031-011-015-132" "Brakes and Cluth combo " 14.0
                                , VMRS "219-031-011-015-132" "Brakes and Cluth combo " 16.5]
                            [Part 1 "P1asdfasdfasdfasdf34343434343asdgsadgsdgf asdfasdfasdf asdfasdfasdfasdfasfasdf asdfasfasfasdfasdf asdfas" "OIL COOLER HOUSING GASKET AND AIR COMPRESSOR COOLANT LINES OIL COOLER HOUSING GASKET AND AIR"
                                , Part 42 "Brakes and Cluth combo" "OIL COOLER HOUSING GASKET AND AIR COMPRESSOR COOLANT LINES OIL COOLER HOUSING GASKET AND AIR COMPRESSOR COOLANT LINES" 
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
                    --                     ,JobStep 4 "PICK UP AND DELIVER" "PICK UP AND DELIVER"
                    --          [VMRS "119-03-01-05-132" "Brakes and Cluth combo Brakes and Cluth combo Brakes and Cluth combo Brakes and Cluth combo Brakes and Cluth combo Brakes and Cluth combo Brakes and Cluth combo" 12.5
                    --         , VMRS "119-031-011-015-132" "Brakes and Cluth combo " 14.0
                    --         , VMRS "219-031-011-015-132" "Brakes and Cluth combo " 16.5]
                    --          [Part 1 "P1asdfasdfasdfasdf34343434343asdgsadgsdgf asdfasdfasdf asdfasdfasdfasdfasfasdf asdfasfasfasdfasdf asdfas" "OIL COOLER HOUSING GASKET AND AIR COMPRESSOR COOLANT LINES OIL COOLER HOUSING GASKET AND AIR", Part 2 "Brakes and Cluth combo" "OIL COOLER HOUSING GASKET AND AIR COMPRESSOR COOLANT LINES OIL COOLER HOUSING GASKET AND AIR COMPRESSOR COOLANT LINES" , Part 5 "P3asd" "Part 3"]
                    --         False
                    --                             ,JobStep 2 "POWER STEERING PUMP AND STEERING GEAR BOX LEAKING." "POWER STEERING PUMP AND STEERING GEAR BOX LEAKING."
                    --          [VMRS "119-03-01-05-132" "Brakes and Cluth combo Brakes and Cluth combo Brakes and Cluth combo Brakes and Cluth combo Brakes and Cluth combo Brakes and Cluth combo Brakes and Cluth combo" 12.5
                    --         , VMRS "119-031-011-015-132" "Brakes and Cluth combo " 14.0
                    --         , VMRS "219-031-011-015-132" "Brakes and Cluth combo " 16.5]
                    --          [Part 1 "P1asdfasdfasdfasdf34343434343asdgsadgsdgf asdfasdfasdf asdfasdfasdfasdfasfasdf asdfasfasfasdfasdf asdfas" "OIL COOLER HOUSING GASKET AND AIR COMPRESSOR COOLANT LINES OIL COOLER HOUSING GASKET AND AIR", Part 2 "Brakes and Cluth combo" "OIL COOLER HOUSING GASKET AND AIR COMPRESSOR COOLANT LINES OIL COOLER HOUSING GASKET AND AIR COMPRESSOR COOLANT LINES" , Part 5 "P3asd" "Part 3"]
                    --         True
                    -- ,JobStep 3 "PICK UP AND DELIVER" "PICK UP AND DELIVER"
                    --          [VMRS "119-03-01-05-132" "Brakes and Cluth combo Brakes and Cluth combo Brakes and Cluth combo Brakes and Cluth combo Brakes and Cluth combo Brakes and Cluth combo Brakes and Cluth combo" 12.5
                    --         , VMRS "119-031-011-015-132" "Brakes and Cluth combo " 14.0
                    --         , VMRS "219-031-011-015-132" "Brakes and Cluth combo " 16.5]
                    --          [Part 1 "P1asdfasdfasdfasdf34343434343asdgsadgsdgf asdfasdfasdf asdfasdfasdfasdfasfasdf asdfasfasfasdfasdf asdfas" "OIL COOLER HOUSING GASKET AND AIR COMPRESSOR COOLANT LINES OIL COOLER HOUSING GASKET AND AIR", Part 2 "Brakes and Cluth combo" "OIL COOLER HOUSING GASKET AND AIR COMPRESSOR COOLANT LINES OIL COOLER HOUSING GASKET AND AIR COMPRESSOR COOLANT LINES" , Part 5 "P3asd" "Part 3"]
                    --         False
                    --                     ,JobStep 4 "PICK UP AND DELIVER" "PICK UP AND DELIVER"
                    --          [VMRS "119-03-01-05-132" "Brakes and Cluth combo Brakes and Cluth combo Brakes and Cluth combo Brakes and Cluth combo Brakes and Cluth combo Brakes and Cluth combo Brakes and Cluth combo" 12.5
                    --         , VMRS "119-031-011-015-132" "Brakes and Cluth combo " 14.0
                    --         , VMRS "219-031-011-015-132" "Brakes and Cluth combo " 16.5]
                    --          [Part 1 "P1asdfasdfasdfasdf34343434343asdgsadgsdgf asdfasdfasdf asdfasdfasdfasdfasfasdf asdfasfasfasdfasdf asdfas" "OIL COOLER HOUSING GASKET AND AIR COMPRESSOR COOLANT LINES OIL COOLER HOUSING GASKET AND AIR", Part 2 "Brakes and Cluth combo" "OIL COOLER HOUSING GASKET AND AIR COMPRESSOR COOLANT LINES OIL COOLER HOUSING GASKET AND AIR COMPRESSOR COOLANT LINES" , Part 5 "P3asd" "Part 3"]
                    --         False
                    --                             ,JobStep 2 "POWER STEERING PUMP AND STEERING GEAR BOX LEAKING." "POWER STEERING PUMP AND STEERING GEAR BOX LEAKING."
                    --          [VMRS "119-03-01-05-132" "Brakes and Cluth combo Brakes and Cluth combo Brakes and Cluth combo Brakes and Cluth combo Brakes and Cluth combo Brakes and Cluth combo Brakes and Cluth combo" 12.5
                    --         , VMRS "119-031-011-015-132" "Brakes and Cluth combo " 14.0
                    --         , VMRS "219-031-011-015-132" "Brakes and Cluth combo " 16.5]
                    --          [Part 1 "P1asdfasdfasdfasdf34343434343asdgsadgsdgf asdfasdfasdf asdfasdfasdfasdfasfasdf asdfasfasfasdfasdf asdfas" "OIL COOLER HOUSING GASKET AND AIR COMPRESSOR COOLANT LINES OIL COOLER HOUSING GASKET AND AIR", Part 2 "Brakes and Cluth combo" "OIL COOLER HOUSING GASKET AND AIR COMPRESSOR COOLANT LINES OIL COOLER HOUSING GASKET AND AIR COMPRESSOR COOLANT LINES" , Part 5 "P3asd" "Part 3"]
                    --         True
                    -- ,JobStep 3 "PICK UP AND DELIVER" "PICK UP AND DELIVER"
                    --          [VMRS "119-03-01-05-132" "Brakes and Cluth combo Brakes and Cluth combo Brakes and Cluth combo Brakes and Cluth combo Brakes and Cluth combo Brakes and Cluth combo Brakes and Cluth combo" 12.5
                    --         , VMRS "119-031-011-015-132" "Brakes and Cluth combo " 14.0
                    --         , VMRS "219-031-011-015-132" "Brakes and Cluth combo " 16.5]
                    --          [Part 1 "P1asdfasdfasdfasdf34343434343asdgsadgsdgf asdfasdfasdf asdfasdfasdfasdfasfasdf asdfasfasfasdfasdf asdfas" "OIL COOLER HOUSING GASKET AND AIR COMPRESSOR COOLANT LINES OIL COOLER HOUSING GASKET AND AIR", Part 2 "Brakes and Cluth combo" "OIL COOLER HOUSING GASKET AND AIR COMPRESSOR COOLANT LINES OIL COOLER HOUSING GASKET AND AIR COMPRESSOR COOLANT LINES" , Part 5 "P3asd" "Part 3"]
                    --         False
                    --                     ,JobStep 4 "PICK UP AND DELIVER" "PICK UP AND DELIVER"
                    --          [VMRS "119-03-01-05-132" "Brakes and Cluth combo Brakes and Cluth combo Brakes and Cluth combo Brakes and Cluth combo Brakes and Cluth combo Brakes and Cluth combo Brakes and Cluth combo" 12.5
                    --         , VMRS "119-031-011-015-132" "Brakes and Cluth combo " 14.0
                    --         , VMRS "219-031-011-015-132" "Brakes and Cluth combo " 16.5]
                    --          [Part 1 "P1asdfasdfasdfasdf34343434343asdgsadgsdgf asdfasdfasdf asdfasdfasdfasdfasfasdf asdfasfasfasdfasdf asdfas" "OIL COOLER HOUSING GASKET AND AIR COMPRESSOR COOLANT LINES OIL COOLER HOUSING GASKET AND AIR", Part 2 "Brakes and Cluth combo" "OIL COOLER HOUSING GASKET AND AIR COMPRESSOR COOLANT LINES OIL COOLER HOUSING GASKET AND AIR COMPRESSOR COOLANT LINES" , Part 5 "P3asd" "Part 3"]
                    --         False
                    --                             ,JobStep 2 "POWER STEERING PUMP AND STEERING GEAR BOX LEAKING." "POWER STEERING PUMP AND STEERING GEAR BOX LEAKING."
                    --          [VMRS "119-03-01-05-132" "Brakes and Cluth combo Brakes and Cluth combo Brakes and Cluth combo Brakes and Cluth combo Brakes and Cluth combo Brakes and Cluth combo Brakes and Cluth combo" 12.5
                    --         , VMRS "119-031-011-015-132" "Brakes and Cluth combo " 14.0
                    --         , VMRS "219-031-011-015-132" "Brakes and Cluth combo " 16.5]
                    --          [Part 1 "P1asdfasdfasdfasdf34343434343asdgsadgsdgf asdfasdfasdf asdfasdfasdfasdfasfasdf asdfasfasfasdfasdf asdfas" "OIL COOLER HOUSING GASKET AND AIR COMPRESSOR COOLANT LINES OIL COOLER HOUSING GASKET AND AIR", Part 2 "Brakes and Cluth combo" "OIL COOLER HOUSING GASKET AND AIR COMPRESSOR COOLANT LINES OIL COOLER HOUSING GASKET AND AIR COMPRESSOR COOLANT LINES" , Part 5 "P3asd" "Part 3"]
                    --         True
                    -- ,JobStep 3 "PICK UP AND DELIVER" "PICK UP AND DELIVER"
                    --          [VMRS "119-03-01-05-132" "Brakes and Cluth combo Brakes and Cluth combo Brakes and Cluth combo Brakes and Cluth combo Brakes and Cluth combo Brakes and Cluth combo Brakes and Cluth combo" 12.5
                    --         , VMRS "119-031-011-015-132" "Brakes and Cluth combo " 14.0
                    --         , VMRS "219-031-011-015-132" "Brakes and Cluth combo " 16.5]
                    --          [Part 1 "P1asdfasdfasdfasdf34343434343asdgsadgsdgf asdfasdfasdf asdfasdfasdfasdfasfasdf asdfasfasfasdfasdf asdfas" "OIL COOLER HOUSING GASKET AND AIR COMPRESSOR COOLANT LINES OIL COOLER HOUSING GASKET AND AIR", Part 2 "Brakes and Cluth combo" "OIL COOLER HOUSING GASKET AND AIR COMPRESSOR COOLANT LINES OIL COOLER HOUSING GASKET AND AIR COMPRESSOR COOLANT LINES" , Part 5 "P3asd" "Part 3"]
                    --         False
                    --                     ,JobStep 14 "PICK UP AND DELIVER" "PICK UP AND DELIVER"
                    --          [VMRS "119-03-01-05-132" "Brakes and Cluth combo Brakes and Cluth combo Brakes and Cluth combo Brakes and Cluth combo Brakes and Cluth combo Brakes and Cluth combo Brakes and Cluth combo" 12.5
                    --         , VMRS "119-031-011-015-132" "Brakes and Cluth combo " 14.0
                    --         , VMRS "219-031-011-015-132" "Brakes and Cluth combo " 16.5]
                    --          [Part 1 "P1asdfasdfasdfasdf34343434343asdgsadgsdgf asdfasdfasdf asdfasdfasdfasdfasfasdf asdfasfasfasdfasdf asdfas" "OIL COOLER HOUSING GASKET AND AIR COMPRESSOR COOLANT LINES OIL COOLER HOUSING GASKET AND AIR", Part 2 "Brakes and Cluth combo" "OIL COOLER HOUSING GASKET AND AIR COMPRESSOR COOLANT LINES OIL COOLER HOUSING GASKET AND AIR COMPRESSOR COOLANT LINES" , Part 5 "P3asd" "Part 3"]
                    --         False
                ]
            )
            , showVMRSCodes = False
            , showParts = False
            , showLaborRate = True
            , selectedChoise = "Tryo"
            , userComment = ""
         },Cmd.none)


update: Msg -> RepairOrder -> (RepairOrder, Cmd Msg)
update msg model =
    case msg of
        ShowVMRSCodes canShowVMRSCode ->
            ( {model | showVMRSCodes = canShowVMRSCode}, Cmd.none)
        
        ShowParts canShowParts ->
            ( {model | showParts = canShowParts}, Cmd.none)
        
        ShowLaborRate canLaborRate ->
            ( {model | showLaborRate = canLaborRate}, Cmd.none)
        
        RB str ->
            ( {model | selectedChoise = str}, Cmd.none)
        
        SetComment str ->
            ( {model | userComment = str}, Cmd.none)

        ShowJobStep canShowJobStep index ->
            ( -- First style
             model.jobSteps
                |> Array.get index
                |> Maybe.map (\js -> {js | isPresentable = canShowJobStep})
                |> Maybe.map (\js -> Array.set index js model.jobSteps)
                |> Maybe.map (\arr -> {model | jobSteps = arr})
                |> Maybe.withDefault model
            , Cmd.none)

        VMRSContentIsRequired  ->
           ( model, Cmd.none)
        
        PrintEstimate  ->
           ( model, Cmd.none)
            
main: Program () RepairOrder Msg
main = 
     Browser.element { init = init, update = update, view = view, subscriptions = always Sub.none }

view : RepairOrder -> HTM.Html Msg
view  model =
    layout [hf] <|
                   row[hf][
                        optionsPanel model
                        , estimatePanel model ]
    -- HTM.div[][
    --      HTM.div [ 
    --             HTMLAttr.class  "flex bg-pink border-b-2 h-16 px-4 border-grey-lighter fixed  pin-t pin-x z-100 items-center   border-blue" ]
    --         [
    --             HTM.div [ HTMLAttr.class "px-4" ]
    --                 [ HTM.text "asdfasdfasdfadsf" ]
    --             , HTM.div [ HTMLAttr.class "px-4" ]
    --                 [ HTM.text "asdfasdfasdfadsf" ]
    --             , HTM.div [ HTMLAttr.class "px-4" ]
    --                 [ HTM.text "asdfasdfasdfadsf" ]
    --             , HTM.div [ HTMLAttr.class "px-4" ]
    --                 [ HTM.text "asdfasdfasdfadsf" ]
    --             , HTM.div [ HTMLAttr.class "px-4" ]
    --                 [ HTM.text "asdfasdfasdfadsf" ]
    --         ]
    --     ,HTM.div[HTMLAttr.class "mt-16" ]
    --     [
    --          layout [hf] <|
    --                row[hf][
    --                     optionsPanel model
    --                     , estimatePanel model ]
    --     ]
           
    -- ]  
        

optionsPanel : RepairOrder -> Element Msg
optionsPanel model =
    let
        --ele = if (Array.length model.jobSteps) == Array.length (Array.filter (\js -> js.isPresentable == True) model.jobSteps ) then
        canShowExtraOptions = Array.length (Array.filter (\js -> js.isPresentable == True) model.jobSteps )
        extraOPtions = 
                if canShowExtraOptions > 0 then
                    column[wf][
                                row[bwb 1, wf, pdt 15]
                                            [paragraph [fal, pdb 3 ] [text "Extra info"] ]
                                ,column[spy 5, alignRight, pdt 5]
                                [
                                    Input.checkbox [bw 0 ] {
                                        onChange = ShowVMRSCodes
                                        ,icon = 
                                                --buildChkBoxImage -- True/False gets passed to the flag parameter in buildChkBoxImage function automatically, if u need to pass
                                                                    -- more than 1 parameter, then you need to do the below code
                                                (\b ->
                                                    buildChkBoxImage b)
                                        , label = Input.labelLeft [alignRight] (el [] <| text (if model.showVMRSCodes then "Hide VMRS Codes" else "Show VMRS Codes"))
                                        --, label = Input.labelLeft [alignRight] (el [] <| none)
                                        , checked = model.showVMRSCodes
                                    }
                                    ,Input.checkbox [bw 0 ]{
                                        onChange = ShowParts
                                        ,icon = buildChkBoxImage
                                        , label = Input.labelLeft [alignRight] (el [] <| text (if model.showParts then "Hide Parts" else "Show Parts"))
                                        , checked = model.showParts
                                    }
                                      ,Input.checkbox [bw 0 ]{
                                        onChange = ShowLaborRate
                                        ,icon = buildChkBoxImage
                                        , label = Input.labelLeft [alignRight] (el [] <| text (if model.showLaborRate then "Hide Labor Rate" else "Show Labor Rate"))
                                        , checked = model.showLaborRate
                                    }
                                    --                 ,text "asdf"
                                    -- ,text "asdf"
                                    -- ,text "asdf"
                                    -- ,text "asdf"
                                    -- ,text "asdf"
                                    -- ,text "asdf"
                                    -- ,text "asdf"
                                    -- ,text "asdf"
                                ]
                    ]
                else
                    none
    in
    column
        [  hf
        , wf
        , pd 10
        , bc 225 225 225
        , spy 5

        ]
        [
            row[bwe 0 0 2 0, wf, pde 25 0 0 0]
            [paragraph [fac, pde 5 0 5 0] [text "Estimate generation options"] ]
            
            
                ,column[wf][
                    row[bwe 0 0 1 0, wf, pde 15 0 0 0]
                        [paragraph [fal, pde 0 0 3 0] [text "Jobsteps"] ]
                
                    ,column[spy 5, alignRight, scrollbarY, pdt 5,   height
                                                                            (fill
                                                                                --|> minimum 0
                                                                                |> maximum 175
                                                                            )
                            ]
                        (List.indexedMap jobStepOptions (Array.toList model.jobSteps) )
                ]
                    -- ,if canShowExtraOptions > 0 then
                    --          row[bwe 0 0 1 0, wf, pde 15 0 0 0]
                    --             [paragraph [fal, pde 0 0 3 0 ] [text "Extra info"] ]
                    -- else
                    --     none
                       
                    ,extraOPtions 

                    ,row[bwe 0 0 1 0, wf, pde 15 0 0 0]
                    [paragraph [fal, pde 0 0 3 0 ] [text "Comment"] ]
                    ,row[wf, hf, pdt 5][
                        Input.multiline [bw 5, hf]{
                            onChange = SetComment
                            ,text = model.userComment
                            , label = Input.labelLeft [alignRight] (none)
                             , placeholder = Just (Input.placeholder [] (el [] <| text "Please enter comments..."))
                            , spellcheck = True
                        }
                    ]

                    ,row[ wf, pdt 15]
                        [
                            Input.button [wf, pdy 5, bw 2, bc 226 63 63, Font.color <| rgb255 250 250 250]
                                { onPress = Just PrintEstimate
                                , label = text "Print Estimate"
                                }
                        ]
                    
                   
                    -- ,row[bwe 0 0 1 0, wf, pde 15 0 0 0]
                    -- [paragraph [fal, pde 0 0 3 0 ] [text "Scrollable Data"] ]

                    -- ,column[wf,hf,  scrollbarY][
                    --     text "11111111111111"
                            
                    --         ,text "asdf"
                    --         ,text "asdf"
                    --         ,text "asdf"
                    --         ,text "asdf"
                    --         ,text "asdf"
                    --         ,text "asdf"
                    --         ,text "asdf"
                    --         ,text "asdf"
                            
                    --         ,text "asdf"
                    --         ,text "asdf"
                    --         ,text "asdf"
                    --         ,text "asdf"
                    --         ,text "asdf"
                    --         ,text "asdf"
                    --         ,text "asdf"
                    --         ,text "asdf"
                    --         ,text "asdf"
                    --         ,text "asdf"
                    --         ,text "asdf"
                    --         ,text "asdf"
                    --         ,text "asdf"
                            
                    --         ,text "asdf"
                    --         ,text "asdf"
                    --         ,text "asdf"
                            
                    --         -- ,text "asdf"
                    --         ,text "222222222222222222"
                    -- ]
            
 
        
            
        ]

estimatePanel : RepairOrder -> Element Msg
estimatePanel model =
        let
            jobStepsToShow =    List.filter (\js -> js.isPresentable)  (Array.toList model.jobSteps)
        in
            column [hf,  wfp 4,  pd 10, bwe 0 0 0 1]
            [
                row[wf]
                    [roEstimateHeaderView model.repairOrderNumber]
                ,column[scrollbarY ]
                [
                    roInfoView model.repairOrderNumber model.branchNumber model.branchDepartmentNumber model.branchPhoneNumber
                    ,customerInfoView model.customerName model.customerAddressLine1 model.customerAddressLine2 model.customerPhoneNumber
                    ,unitInfoView model
                    ,column[wf]
                                    (List.map3 jobStepInfoView jobStepsToShow (List.repeat (Array.length model.jobSteps) model.showVMRSCodes ) (List.repeat (Array.length model.jobSteps) model.showParts ) )

                    ,estimateNotesAndGrandTotalsView model
                ]
            ]

jobStepOptions : Int -> JobStep -> Element Msg
jobStepOptions index jobStep =
            Input.checkbox [bw 0 ] {
                onChange = (\bool -> ShowJobStep bool index)
                ,icon = buildChkBoxImage
                , label = Input.labelLeft [alignRight] (el [] <| text (if jobStep.isPresentable then "Hide JobStep# " ++ String.fromInt jobStep.number else "Show JobStep# " ++ String.fromInt jobStep.number))
                , checked = jobStep.isPresentable
            }

buildChkBoxImage falg =
        -- if falg == True then 
        --     image [centerY, hpx 24] {src = "uncheck.png", description ="Logo" } 
        -- else 
        --     image [centerY, hpx 24] {src = "check.png", description ="Logo" }

        if falg == True then 
            image [hpx 24] {src = "checked.png", description ="Logo" }
        else 
            el [hpx 24, wpx 24, bw 2, br 5] <| none
           
-- this is just to send a message back in to update function when there are no side-effects needed and just a way to put the message back in to update function
sendMessage : msg -> Cmd msg
sendMessage msg =
    Task.succeed msg
        |> Task.perform identity -- dont know what is identity, find out.