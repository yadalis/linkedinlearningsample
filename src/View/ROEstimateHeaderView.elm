module View.ROEstimateHeaderView exposing (roEstimateHeaderView, roInfoView, customerInfoView, unitInfoView, jobStepInfoView, estimateNotesAndGrandTotalsView)

import Element exposing (..)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font
import Utils exposing (..)

dataValueFont =
    Font.size 15

dataValuePragraph = 
    paragraph [Font.size 16]

dataHeaderPragraph = 
    paragraph [Font.size 18]

roEstimateHeaderView roNumber =
    row[width fill,  spaceEvenly, paddingEach { edges | bottom = 5}
                , Border.widthEach { edges | bottom = 2} -- { bottom = 2, top = 0, left = 0, right = 0 }
                , Border.color <| rgb255 237 45 45]
            [
                image [centerY, height <| px 45] {src = "logo.png", description ="Logo" }
                
                ,column[spacingXY 0 15, Font.semiBold, Font.alignRight, width <| fill ]
                    [
                        paragraph [] 
                            [ 
                                 text ("RO# " ++ String.fromInt roNumber)
                            ]
                        ,
                        paragraph []
                            [ 
                                 text "DRAFT 2018-10-30 10:45 AM "
                            ]
                    ]
            ]

roInfoView repairOrderNumber branchNumber  branchDepartmentNumber branchPhoneNumber =
            row[width fill, paddingEach  {edges | top = 25, bottom = 25}
                ,Font.alignLeft
                , Border.color <| rgb255 237 45 45
                ,spaceEvenly ]
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
                                 text (String.fromInt repairOrderNumber)
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
                                 text (String.fromInt branchNumber)
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
                                 text (String.fromInt branchDepartmentNumber)
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
                                 text branchPhoneNumber
                            ]
                    ]
            ]

customerInfoView  customerName customerAddressLine1  customerAddressLine2 customerPhoneNumber =
        column[width fill]
        [
            row[width fill, Font.semiBold, Border.widthEach {edges | bottom = 1}]
            [
                text "Customer Information"
            ] 
            ,
            row[width fill, paddingEach  {edges | top = 15, bottom = 15}
                ,Font.alignLeft, spaceEvenly
                , Border.color <| rgb255 237 45 45
                ,Background.color <| rgb255 225 225 225 ]
            [
                column[ width <| fill, alignTop ,Border.width 0 , paddingEach  {edges | left = 50}]
                    [
                        paragraph []
                            [ 
                                 text customerName
                            ]
                    ]
                ,column[spacingXY 0 15, width <| fill,Border.width 0]
                [
                    paragraph [] 
                        [ 
                                text customerAddressLine1
                        ]
                    ,
                    
                    paragraph []
                        [ 
                                text customerAddressLine2
                        ]
                ]
                ,column[width <| fill, alignTop ,Border.width 0 ]
                    [
                        paragraph []
                            [ 
                                 text customerPhoneNumber
                            ]
                    ]
            ]
        ]

unitInfoView model =
        column[width fill]
        [
            row[width fill,paddingEach  {edges | top = 25}, Font.semiBold, Border.widthEach {edges | bottom = 1}]
                [
                    text "Unit Information"
                ]
            ,
            row[width fill, paddingXY 50 15
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
        ]
                        --,row[][
                
                    -- Element.table [paddingXY 0 15]
                    --     { data = [model.jobSteps]
                    --     , columns =
                    --         [ 
                    --             { header =  
                    --                 paragraph [Background.color <| rgb255 214 214 214, Border.widthEach {edges | bottom = 2}, paddingXY 5 5 ] [ Element.text "Correction" ]
                    --                 , width = fillPortion 1
                    --                 , view =
                    --                         \person ->
                    --                              paragraph [Font.alignLeft, paddingXY 0 15,Border.widthEach {edges | bottom = 1, right = 1}  ] [Element.text person.correction]
                    --             }
                    --             , { header = 
                    --                     paragraph [Background.color <| rgb255 214 214 214, Border.widthEach {edges | bottom = 2}, paddingXY 5 5 ][ Element.text "Complaint" ]
                    --                 , width = fill
                    --                 , view =
                    --                         \person ->
                    --                             paragraph [Font.alignLeft, paddingXY 5 15,Border.widthEach {edges | bottom = 1}  ] [Element.text person.customerComplaint ]
                    --             }
                    --         ]
                    --     }   
            --]

jobStepInfoView : JobStep -> Bool -> Element Msg
jobStepInfoView jobStep canShowVMRSCodes =
        column[width fill]
        [
            row[width fill,paddingEach  {edges | top = 25}, Font.semiBold, Border.widthEach {edges | bottom = 1}]
            [
                text  ("Job Step #" ++ (String.fromInt jobStep.number))
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
                                 text jobStep.customerComplaint
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
                                 text jobStep.correction
                            ]
                    ]
            ]
            ,
                if List.length jobStep.vmrsCodes > 0 && canShowVMRSCodes then
                    vmrsInfoView jobStep.vmrsCodes
                else
                    row[][]
            , 
                if List.length jobStep.parts > 0 then
                    partsInfoView jobStep.parts
                else
                    row[][]

            -- ,row[width fill, paddingEach {edges | right = 75, top = 25, left = 5}
            --     ,Font.alignLeft, spaceEvenly
            --     , Border.color <| rgb255 237 45 45
            --     ,Background.color <| rgb255 225 225 225 ]
            -- [
            --      column[spacingXY 0 10, width <| fill ]
            --         [
            --             paragraph[Font.size 14, Font.alignLeft, Font.semiBold]
            --                 [ 
            --                      text "CHARGE TYPE"
            --                 ]
            --         ]
            --     ,
            --     column[spacingXY 0 10, width <| fill ]
            --         [
            --             paragraph[Font.size 14, Font.alignRight, Font.semiBold]
            --                 [ 
            --                      text "AMOUNT"
            --                 ]
            --         ]
            -- ]
            -- ,row[width fill, paddingEach {edges | right = 75, top = 15, left = 5}
            --     ,Font.alignLeft, spaceEvenly
            --     , Border.color <| rgb255 237 45 45
            --     ,Background.color <| rgb255 225 225 225 ]
            -- [
            --     column[spacingXY 0 10, width <| fill ]
            --         [
            --             paragraph[Font.size 14, Font.alignLeft]
            --                 [ 
            --                      text "LABOR"
            --                 ]
            --         ]
            --     ,column[spacingXY 0 10, width <| fill ]
            --         [
            --             paragraph[Font.size 14, Font.alignRight]
            --                 [ 
            --                      text "$173.00"
            --                 ]
            --         ]
            -- ]
            -- ,row[width fill, paddingEach {edges | right = 75, top = 8, left = 5}
            --     ,Font.alignLeft, spaceEvenly
            --     , Border.color <| rgb255 237 45 45
            --     ,Background.color <| rgb255 225 225 225 ]
            -- [
            --     column[spacingXY 0 10, width <| fill ]
            --         [
            --             paragraph[Font.size 14, Font.alignLeft]
            --                 [ 
            --                      text "PARTS"
            --                 ]
            --         ]
            --     ,column[spacingXY 0 10, width <| fill ]
            --         [
            --             paragraph[Font.size 14, Font.alignRight]
            --                 [ 
            --                      text "$13.00"
            --                 ]
            --         ]
            -- ]
            -- ,row[width fill, paddingEach {edges | right = 75, top = 8, left = 5}
            --     ,Font.alignLeft, spaceEvenly
            --     , Border.color <| rgb255 237 45 45
            --     ,Background.color <| rgb255 225 225 225 ]
            -- [
            --     column[spacingXY 0 10, width <| fill ]
            --         [
            --             paragraph[Font.size 14, Font.alignLeft]
            --                 [ 
            --                      text "FRIEGHT"
            --                 ]
            --         ]
            --     ,column[spacingXY 0 10, width <| fill ]
            --         [
            --             paragraph[Font.size 14, Font.alignRight]
            --                 [ 
            --                      text "$243.00"
            --                 ]
            --         ]
            -- ]
            -- ,row[width fill, paddingEach {edges | right = 75, top = 8, left = 5}
            --     ,Font.alignLeft, spaceEvenly
            --     , Border.color <| rgb255 237 45 45
            --     ,Background.color <| rgb255 225 225 225 ]
            -- [
            --     column[spacingXY 0 10, width <| fill ]
            --         [
            --             paragraph[Font.size 14, Font.alignLeft]
            --                 [ 
            --                      text "SUBLET"
            --                 ]
            --         ]
            --     ,column[spacingXY 0 10, width <| fill ]
            --         [
            --             paragraph[Font.size 14, Font.alignRight]
            --                 [ 
            --                      text "$64.00"
            --                 ]
            --         ]
            -- ]
            -- ,row[width fill, paddingEach {edges | right = 75, top = 8, left = 5, bottom = 10}
            --     ,Font.alignLeft, spaceEvenly
            --     , Border.color <| rgb255 237 45 45
            --     ,Background.color <| rgb255 225 225 225 ]
            -- [
            --     column[spacingXY 0 10, width <| fill ]
            --         [
            --             paragraph[Font.size 14, Font.alignLeft]
            --                 [ 
            --                      text "SHOP SUPPLIES"
            --                 ]
            --         ]
            --     ,column[spacingXY 0 10, width <| fill ]
            --         [
            --             paragraph[Font.size 14, Font.alignRight]
            --                 [ 
            --                      text "$13.00"
            --                 ]
            --         ]
            -- ]

        ]

vmrsInfoView vmrsCodes =
        row[width fill, paddingXY 5 25
            ,Font.alignLeft, spaceEvenly
            , Border.color <| rgb255 237 45 45
            ,Background.color <| rgb255 225 225 225 ]
        [
            column[width <| fill, alignTop]
                [
                    dataHeaderPragraph
                        [ 
                                text ("VMRS Codes")
                        ]
                ]
            ,column[width <| fillPortion 4 ]
                [
                    row[][
                        Element.table [paddingXY 0 0]
                        { data = vmrsCodes
                        , columns =
                            [ 
                                { header =  
                                    paragraph [Font.center, Background.color <| rgb255 214 214 214, Border.widthEach {edges | bottom = 1}, paddingXY 0 5 ] [ Element.text "Code" ]
                                    , width = fill
                                    , view =
                                            \person ->
                                                paragraph [width fill, paddingXY 5 15,Border.widthEach {edges | bottom = 0, right = 0}, Font.alignLeft  ] [Element.text person.code]
                                }
                                , { header = 
                                    paragraph [Font.center, Background.color <| rgb255 214 214 214, Border.widthEach {edges | bottom = 1}, paddingXY 0 5 ][ Element.text "Complaint" ]
                                    , width = fillPortion 3
                                    , view =
                                            \person ->
                                                paragraph [Font.alignLeft, paddingXY 5 15,Border.widthEach {edges | bottom = 0, left = 1}  ] [Element.text person.description ]
                                }
                            ]
                        }   
                    ]
                ]
        ]

partsInfoView parts =
        row[width fill, paddingXY 5 15
                ,Font.alignLeft, spaceEvenly
                , Border.color <| rgb255 237 45 45
                
                ,Background.color <| rgb255 225 225 225 ]
            [
                column[width <| fill, alignTop]
                    [
                        dataHeaderPragraph
                            [ 
                                 text ("Parts")
                            ]
                    ]
                ,column[width <| fillPortion 4 ]
                    [
                        row[][
                            Element.table [Border.width 0, spacing 0, padding 5--, Background.color (rgba 0 0 0 1)
                                --, Font.color (rgba 1 1 1 1)
                                --, Font.italic
                                --, Font.size 32
                                -- , Font.family
                                --     [ Font.external
                                --         { url = "https://fonts.googleapis.com/css?family=Montserrat:100"
                                --         , name = "Montserrat"
                                --         }
                                --     , Font.sansSerif
                                --     ]
                        ]
                            { data = parts 
                            , columns =
                                [ 
                                    { header =  
                                        paragraph [Font.center, Background.color <| rgb255 214 214 214, Border.widthEach {edges | bottom = 1}, paddingXY 0 5 ] [ Element.text "Count" ]
                                        , width = fill
                                        , view =
                                                \person ->
                                                    paragraph [paddingXY 0 15,Border.widthEach {edges | bottom = 0, right = 1}, height fill  ] [Element.text (String.fromInt person.count)]
                                    }
                                    , { header = 
                                        paragraph [Font.center, Background.color <| rgb255 214 214 214, Border.widthEach {edges | bottom = 1}, paddingXY 0 5, clipX  ][ Element.text "Code" ]
                                        , width = fill
                                        , view =
                                                \person ->
                                                    paragraph [paddingXY 5 15,Border.widthEach {edges | bottom = 0, right = 1},  height fill   ] [Element.text person.code ]
                                    }
                                    , { header = 
                                        paragraph [Font.center, Background.color <| rgb255 214 214 214, Border.widthEach {edges | bottom = 1}, paddingXY 0 5 ][ Element.text "Description" ]
                                        , width = fillPortion 10 
                                        , view =
                                                \person ->
                                                    paragraph [Font.alignLeft, paddingXY 5 15,Border.widthEach {edges | bottom = 0},  height fill  ] [Element.text person.description ]
                                    }
                                ]
                            }   
                        ]
                    ]
            ]

estimateNotesAndGrandTotalsView model =
            row[
                    width fill 
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