module Main exposing (..)

import Browser
import Element exposing (..)
import Element.Input as Input
import Html exposing (..)
import Html.Attributes exposing (..)
import Task
import Model exposing (..)
import Array exposing (Array)

import View.ROEstimateHeaderView exposing (..)
import View.ElmStyleShotcuts as ElmStyleShotcuts exposing (..)
import View.ElmUIHelpers exposing (..)

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
        , userComment : String
    }

init : () -> ( (RepairOrder, UIModel) , Cmd Msg)
init _=
     ( 
        ({
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
            , userComment = ""
         },
         {
              showVMRSCodes = False
            , showParts = False
            , showLaborRate = True
            , selectedChoice = "Gryo"
            , jobSteps = Array.empty -- this is to capture selected jobsteps and send it to an API for saving the selections.
            , jobStepNumbers = Array.empty -- this is to capture selected jobsteps numbers and send it to an API for saving the selections.
         })
         ,
         sendMessage Start ) -- is this ok ? not sure... :)
         --Cmd.none)

update: Msg -> (RepairOrder, UIModel) -> ((RepairOrder, UIModel) , Cmd Msg)
update msg (model,uiModel) =
    case msg of
        Start ->
            ( (model, {uiModel | jobSteps =  selectedJobSteps model.jobSteps, jobStepNumbers = getSelectedJobStepsNumbers model.jobSteps}), Cmd.none) 

        ShowVMRSCodes canShowVMRSCode ->
            ( (model, {uiModel | showVMRSCodes = canShowVMRSCode}), Cmd.none)
        
        ShowParts canShowParts ->
            ( (model, {uiModel | showParts = canShowParts}), Cmd.none)
        
        ShowLaborRate canShowLaborRate ->
            ( (model, {uiModel | showLaborRate = canShowLaborRate}), Cmd.none)
        
        RB str ->
            ( (model, {uiModel  | selectedChoice = str}), Cmd.none)

        SetComment str ->
            ( ({model | userComment = str}, uiModel), Cmd.none)

        SelectJobStep userAction index ->
            let
                newModel = model.jobSteps
                                |> Array.get index
                                |> Maybe.map (\js -> {js | isPresentable = userAction})
                                |> Maybe.map (\js -> Array.set index js model.jobSteps)
                                |> Maybe.map (\updatedJobSteps -> {model | jobSteps = updatedJobSteps})
                                |> Maybe.withDefault model
            in
                (
                    (newModel , { uiModel | jobSteps =  selectedJobSteps newModel.jobSteps, jobStepNumbers = getSelectedJobStepsNumbers newModel.jobSteps} ), Cmd.none
                )

        VMRSContentIsRequired  ->
           ( (model, uiModel), Cmd.none)
        
        PrintEstimate  ->
           ( (model, uiModel), Cmd.none)
            
main: Program () (RepairOrder, UIModel) Msg
main = 
     Browser.element { init = init, update = update, view = view, subscriptions = always Sub.none }

view : (RepairOrder, UIModel) -> Html Msg
view  (model,uiModel) =
    layout [hf] <|
                   row[hf][
                        optionsPanel (model, uiModel)
                        , estimatePanel (model, uiModel) ]
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

--= Array.length (Array.filter (\js -> js.isPresentable == True) model.jobSteps )

selectedJobSteps : Array JobStep -> Array JobStep
selectedJobSteps jsList
                = jsList
                    |> Array.filter (\jobStep -> jobStep.isPresentable)

selectedJobStepsCount : Array JobStep -> Int
selectedJobStepsCount jsList
                = jsList
                    |> selectedJobSteps
                    |> Array.length

isAllJobStepsSelected : Array JobStep -> Bool
isAllJobStepsSelected jsList
                = jsList
                    |> selectedJobStepsCount
                    |> \count -> if count == Array.length jsList then
                                                         True
                                                      else 
                                                        False

isAtleastOneJobStepsChecked : Array JobStep -> Bool
isAtleastOneJobStepsChecked jsList
                = jsList
                    |> selectedJobStepsCount
                    |> \count -> count > 0

getSelectedJobStepsNumbers : Array JobStep -> Array Int
getSelectedJobStepsNumbers jsList
                = Array.map  (\jobStep -> jobStep.number) (selectedJobSteps jsList)

optionsPanel : (RepairOrder, UIModel) -> Element Msg
optionsPanel (model, uiModel) =
    let
        --ele = if (Array.length model.jobSteps) == Array.length (Array.filter (\js -> js.isPresentable == True) model.jobSteps ) then
        --canShowExtraOptions = Array.length (Array.filter (\jobStep -> jobStep.isPresentable) model.jobSteps )

        canEnablePrintEstimateBtn = isAllJobStepsSelected model.jobSteps

        -- enabledPrintEstimateBtnStyle = [ bc 226 63 63, Font.color <| rgb255 250 250 250]

        -- disabledPrintEstimateBtnStyle = [ bc 198 201 206, Font.color <| rgb255 245 245 245]

        printEstimateBtnStyle = if canEnablePrintEstimateBtn then 
                                    [ bc 226 63 63, fc 250 250 250] 
                                else
                                    [ bc 198 201 206, fc 245 245 245]

        canShowExtraOptions =
                model.jobSteps
                    |> isAtleastOneJobStepsChecked

        extraOPtions = 
                if canShowExtraOptions then
                    column[wf][
                                row[bwb 1, wf, pdt 15]
                                            [paragraph [fal, pdb 3 ] [textValue "Extra info"] ]
                                ,column[spy 5, alignRight, pdt 5]
                                [
                                    Input.checkbox [bw 0 ] {
                                        onChange = ShowVMRSCodes
                                        ,icon = 
                                                buildChkBoxImage -- True/False gets passed to the flag parameter in buildChkBoxImage function automatically, if u need to pass
                                                                    -- more than 1 parameter, then you need to do the below code
                                                -- (\b ->
                                                --     buildChkBoxImage b)
                                        , label = Input.labelLeft [alignRight] (el [] <| textValue (if uiModel.showVMRSCodes then "Hide VMRS Codes" else "Show VMRS Codes"))
                                        --, label = Input.labelLeft [alignRight] (el [] <| none)
                                        , checked = uiModel.showVMRSCodes
                                    }
                                    ,Input.checkbox [bw 0 ]{
                                        onChange = ShowParts
                                        ,icon = buildChkBoxImage
                                        , label = Input.labelLeft [alignRight] (el [] <| textValue (if uiModel.showParts then "Hide Parts" else "Show Parts"))
                                        , checked = uiModel.showParts
                                    }
                                      ,Input.checkbox [bw 0 ]{
                                        onChange = ShowLaborRate
                                        ,icon = buildChkBoxImage
                                        , label = Input.labelLeft [alignRight] (el [] <| textValue (if uiModel.showLaborRate then "Hide Labor Rate" else "Show Labor Rate"))
                                        , checked = uiModel.showLaborRate
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
            [paragraph [fac, pde 5 0 5 0] [textValue "Estimate generation options"] ]
            
            
                ,column[wf][
                    row[bwe 0 0 1 0, wf, pde 15 0 0 0]
                        [paragraph [fal, pde 0 0 3 0] [textValue "Jobsteps"] ]
                
                    ,column[spy 5, alignRight, scrollbarY, pdt 5,  hfmax 175
                                                                        --  Elm.height
                                                                        --     (fill
                                                                        --         --|> minimum 0
                                                                        --         |> maximum 175
                                                                        --     )
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
                    [paragraph [fal, pde 0 0 3 0 ] [textValue "Comment"] ]
                    ,row[wf, hf, pdt 5][
                        Input.multiline [bw 5, hf]{
                            onChange = SetComment
                            ,text = model.userComment
                            , label = Input.labelLeft [alignRight] (none)
                             , placeholder = Just (Input.placeholder [] (el [] <| textValue "Please enter comments..."))
                            , spellcheck = True
                        }
                    ]

                    ,row[ wf, pdt 15]
                        [
                            Input.button ( [wf, pdy 5, bw 2] ++ printEstimateBtnStyle)
                                { onPress = if canEnablePrintEstimateBtn then Just PrintEstimate else Nothing
                                , label =  textValue <| String.toUpper "Print Estimate"
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

estimatePanel : (RepairOrder, UIModel) -> Element Msg
estimatePanel (model, uiModel) =
        let
            jobStepsToShow =  Array.toList (selectedJobSteps model.jobSteps ) -- List.filter (\js -> js.isPresentable)  (Array.toList model.jobSteps)
        in
            column [hf,  wfp 4,  pd 10, bwe 0 0 0 1]
            [
                row[wf]
                    [roEstimateHeaderView model.repairOrderNumber]
                ,column[scrollbarY, eId "myRowX" ]
                [
                    roInfoView model.repairOrderNumber model.branchNumber model.branchDepartmentNumber model.branchPhoneNumber
                    ,customerInfoView model.customerName model.customerAddressLine1 model.customerAddressLine2 model.customerPhoneNumber
                    ,unitInfoView model
                    ,column[wf]
                                    (List.map3 jobStepInfoView jobStepsToShow (List.repeat (Array.length model.jobSteps) uiModel.showVMRSCodes ) (List.repeat (Array.length model.jobSteps) uiModel.showParts ) )

                    ,estimateNotesAndGrandTotalsView model
                ]
            ]

jobStepOptions : Int -> JobStep -> Element Msg
jobStepOptions index jobStep =
            Input.checkbox [bw 0 ] {
                onChange = (\userAction -> SelectJobStep userAction index)
                ,icon = buildChkBoxImage
                , label = Input.labelLeft [alignRight] (el [] <| textValue (if jobStep.isPresentable then "Hide JobStep# " ++ String.fromInt jobStep.number else "Show JobStep# " ++ String.fromInt jobStep.number))
                , checked = jobStep.isPresentable
            }

buildChkBoxImage userAction =
        -- if falg == True then 
        --     image [centerY, hpx 24] {src = "uncheck.png", description ="Logo" } 
        -- else 
        --     image [centerY, hpx 24] {src = "check.png", description ="Logo" }

        if userAction == True then 
            image [hpx 24] {src = "checked.png", description ="Logo" }
        else 
            el [hpx 24, wpx 24, bw 2, ElmStyleShotcuts.br 5] <| none
           
-- this is just to send a message back in to update function when there are no side-effects needed and just a way to put the message back in to update function
-- is this a good practice ?
sendMessage : msg -> Cmd msg
sendMessage msg =
    Task.succeed msg
        |> Task.perform identity -- dont know what is identity, find out.