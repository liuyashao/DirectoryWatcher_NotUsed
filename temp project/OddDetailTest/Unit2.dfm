object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Form2'
  ClientHeight = 536
  ClientWidth = 1342
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 16
  object cxGrid1: TcxGrid
    Left = 0
    Top = 35
    Width = 1342
    Height = 221
    Align = alTop
    TabOrder = 0
    object cxGrid1spGridDBTableView1: TspGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = DataSource1
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = '0.00'
          Kind = skSum
        end
        item
          Format = '0.00'
          Kind = skSum
        end
        item
          Format = '0.00'
          Kind = skSum
          Column = cxGrid1spGridDBTableView1Amount
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      Styles.Content = cxStyle1
      DisplayTemplate = <>
      StateOptions.Font.Charset = DEFAULT_CHARSET
      StateOptions.Font.Color = clWindowText
      StateOptions.Font.Height = -11
      StateOptions.Font.Name = 'Tahoma'
      StateOptions.Font.Style = []
      OnEditValueChanging = cxGrid1spGridDBTableView1EditValueChanging
      object cxGrid1spGridDBTableView1Unit: TspGridDBColumn
        DataBinding.FieldName = 'Unit'
        PropertiesClassName = 'TcxComboBoxProperties'
        Properties.DropDownListStyle = lsEditFixedList
        Properties.ImmediatePost = True
        Properties.Items.Strings = (
          #30721
          #31859
          #25903)
        HeaderAlignmentHorz = taCenter
      end
      object cxGrid1spGridDBTableView1SpecY: TspGridDBColumn
        DataBinding.FieldName = 'SpecY'
        HeaderAlignmentHorz = taCenter
      end
      object cxGrid1spGridDBTableView1SpecM: TspGridDBColumn
        DataBinding.FieldName = 'SpecM'
        HeaderAlignmentHorz = taCenter
      end
      object cxGrid1spGridDBTableView1SpecSale: TspGridDBColumn
        DataBinding.FieldName = 'SpecSaleY'
        HeaderAlignmentHorz = taCenter
        Width = 112
      end
      object cxGrid1spGridDBTableView1Piece: TspGridDBColumn
        DataBinding.FieldName = 'Piece'
        HeaderAlignmentHorz = taCenter
      end
      object cxGrid1spGridDBTableView1OddY: TspGridDBColumn
        DataBinding.FieldName = 'OddY'
        PropertiesClassName = 'TcxOddTextEditProperties'
        HeaderAlignmentHorz = taCenter
        Width = 120
      end
      object cxGrid1spGridDBTableView1OddM: TspGridDBColumn
        DataBinding.FieldName = 'OddM'
        PropertiesClassName = 'TcxOddTextEditProperties'
        HeaderAlignmentHorz = taCenter
        Width = 120
      end
      object cxGrid1spGridDBTableView1OddTotal: TspGridDBColumn
        DataBinding.FieldName = 'OddTotal'
        PropertiesClassName = 'TcxOddTextEditProperties'
        Properties.ReadOnly = True
        HeaderAlignmentHorz = taCenter
        Width = 120
      end
      object cxGrid1spGridDBTableView1SpecCut: TspGridDBColumn
        DataBinding.FieldName = 'SpecCutY'
        HeaderAlignmentHorz = taCenter
      end
      object cxGrid1spGridDBTableView1QtyCut: TspGridDBColumn
        DataBinding.FieldName = 'QtyCut'
        HeaderAlignmentHorz = taCenter
      end
      object cxGrid1spGridDBTableView1SaleDetail: TspGridDBColumn
        Caption = #26126#32454
        DataBinding.FieldName = 'SaleDetail'
        PropertiesClassName = 'TcxOddTextEditProperties'
        HeaderAlignmentHorz = taCenter
        Width = 132
      end
      object cxGrid1spGridDBTableView1SaleQty: TspGridDBColumn
        DataBinding.FieldName = 'SaleQty'
        HeaderAlignmentHorz = taCenter
      end
      object cxGrid1spGridDBTableView1Price: TspGridDBColumn
        DataBinding.FieldName = 'Price'
        HeaderAlignmentHorz = taCenter
      end
      object cxGrid1spGridDBTableView1Amount: TspGridDBColumn
        DataBinding.FieldName = 'Amount'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        HeaderAlignmentHorz = taCenter
      end
      object cxGrid1spGridDBTableView1TotalDetail: TspGridDBColumn
        DataBinding.FieldName = 'TotalDetail'
        PropertiesClassName = 'TcxOddTextEditProperties'
        Properties.ReadOnly = True
        HeaderAlignmentHorz = taCenter
        Width = 150
      end
      object cxGrid1spGridDBTableView1TotalQtyY: TspGridDBColumn
        DataBinding.FieldName = 'TotalQtyY'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        HeaderAlignmentHorz = taCenter
      end
      object cxGrid1spGridDBTableView1TotalQtyM: TspGridDBColumn
        DataBinding.FieldName = 'TotalQtyM'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        HeaderAlignmentHorz = taCenter
      end
      object cxGrid1spGridDBTableView1TotalPiece: TspGridDBColumn
        DataBinding.FieldName = 'TotalPiece'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        HeaderAlignmentHorz = taCenter
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1spGridDBTableView1
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1342
    Height = 35
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object cxTextEdit1: TcxTextEdit
      Left = 600
      Top = 5
      TabOrder = 0
      Text = 'cxTextEdit1'
      Width = 121
    end
    object cxTextEdit2: TcxTextEdit
      Left = 727
      Top = 5
      TabOrder = 1
      Text = 'cxTextEdit2'
      Width = 121
    end
    object cxTextEdit3: TcxTextEdit
      Left = 896
      Top = 5
      TabOrder = 2
      Text = 'cxTextEdit3'
      Width = 121
    end
    object spTextEditEx1: TspTextEditEx
      Left = 408
      Top = 5
      TabOrder = 3
      Text = 'spTextEditEx1'
      Width = 121
    end
    object cbRoundType: TcxComboBox
      Left = 184
      Top = 5
      Properties.DropDownListStyle = lsEditFixedList
      Properties.OnChange = cbRoundTypePropertiesChange
      TabOrder = 4
      Width = 137
    end
    object cxButton1: TcxButton
      Left = 320
      Top = 6
      Width = 27
      Height = 22
      Caption = #23545#27604
      OptionsImage.Glyph.SourceDPI = 96
      OptionsImage.Glyph.Data = {
        89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
        F4000001E9494441545847ED963F68535114C6BF2F4F8D7F06932771142AB911
        741304976241104470B2056771C8CBA4A8839B93E0A0204DAAAD20888B76511C
        FC33084E826255C422BDA18E16A2EF254D5084E47DF22A0A522834DE920EEFEE
        F79CDFF91DCEB99718F0E180F32305480DA4069619F06B566B399A6160FEC9B9
        7E01243440CC3AB121EC25514862ADC6C07418983117007ED54E8338F15F00F9
        EADC3CC9A16EAC838B5FCD6B7F67BD0D602BC45D623C4CF116882D80BEC4E4B1
        66D9BCFD03EF08C04E92381D13A7BAB15E6E226705CDC3F3F6A3D76B10B48871
        0919DC93F024AA98A34E01FC713B96048F81AB146648DC95741399CC38A50F02
        5E448119C94DD89118DEF7C5F2EE574E0172D73EE798ED86049EC5C0C70C70B6
        278CB61AC507F942FD1D897D021E437A18056612E4DF7176D282A49A7CCDCE50
        2888A80338A49F1BFCE699A126EE2C6CF33BED9380CE01DC23E1515431C79D1A
        F80D307785E079481D809FC28A3980FBF272DFEAC312DBADA0F8C6AFDA05413B
        A24A69A37380ED557BC4239E2681055C8E02731112FD897A47D20F8053002E80
        0AA3A0B434F7C971D6025CB7D9BC8716896C8F3CDC2A179F2F25A8D95148B745
        6E86F01ED45414946EB807E8732BF565603DACE23EEB5DF9DA6ADE82C100AC49
        D61582A65FB2D4406A60E0067E011B812230E6EAC3A60000000049454E44AE42
        6082}
      OptionsImage.Layout = blGlyphTop
      OptionsImage.Spacing = 0
      PaintStyle = bpsGlyph
      TabOrder = 5
    end
  end
  object cxGrid2: TcxGrid
    Left = 0
    Top = 256
    Width = 1342
    Height = 280
    Align = alClient
    TabOrder = 2
    object cxGrid2spGridDBBandedTableView1: TspGridDBBandedTableView
      Navigator.Buttons.CustomButtons = <>
      OnEditKeyPress = cxGrid2spGridDBBandedTableView1EditKeyPress
      DataController.DataSource = DataSource1
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Kind = skSum
          Column = cxGrid2spGridDBBandedTableView1SaleQty
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsView.GroupByBox = False
      OptionsView.ValidateDataSetConstraint = False
      Styles.Content = cxStyle1
      Bands = <
        item
          Caption = #21830#21697
          Width = 116
        end
        item
          Caption = #25972#25903
          Width = 507
        end
        item
          Caption = #38646#22836
          Width = 346
        end
        item
          Caption = #25955#21098
          Width = 213
        end
        item
          Caption = #23454#38469#38144#21806
          Width = 346
        end
        item
          Caption = #23454#38469#20986#24211
          Width = 301
        end
        item
          Caption = #20854#20182
        end>
      DisplayTemplate.Items = <>
      DisplayTemplate.Bands = <>
      StateOptions.Font.Charset = DEFAULT_CHARSET
      StateOptions.Font.Color = clWindowText
      StateOptions.Font.Height = -11
      StateOptions.Font.Name = 'Tahoma'
      StateOptions.Font.Style = []
      OnEditValueChanging = cxGrid2spGridDBBandedTableView1EditValueChanging
      object cxGrid2spGridDBBandedTableView1Unit: TspGridDBBandedColumn
        DataBinding.FieldName = 'Unit'
        PropertiesClassName = 'TcxComboBoxProperties'
        Properties.DropDownListStyle = lsEditFixedList
        Properties.ImmediatePost = True
        Properties.Items.Strings = (
          #30721
          #31859
          #25903)
        HeaderAlignmentHorz = taCenter
        Width = 44
        Position.BandIndex = 0
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object cxGrid2spGridDBBandedTableView1SpecY: TspGridDBBandedColumn
        Caption = #21253#35013'('#30721'/'#25903')'
        DataBinding.FieldName = 'SpecY'
        HeaderAlignmentHorz = taCenter
        Width = 115
        Position.BandIndex = 1
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object cxGrid2spGridDBBandedTableView1SpecM: TspGridDBBandedColumn
        Caption = #21253#35013'('#31859'/'#25903')'
        DataBinding.FieldName = 'SpecM'
        HeaderAlignmentHorz = taCenter
        Width = 103
        Position.BandIndex = 1
        Position.ColIndex = 1
        Position.RowIndex = 0
      end
      object cxGrid2spGridDBBandedTableView1SpecSale: TspGridDBBandedColumn
        Caption = #38144#21806'('#30721'/'#25903')'
        DataBinding.FieldName = 'SpecSaleY'
        HeaderAlignmentHorz = taCenter
        Width = 96
        Position.BandIndex = 1
        Position.ColIndex = 2
        Position.RowIndex = 0
      end
      object cxGrid2spGridDBBandedTableView1Piece: TspGridDBBandedColumn
        DataBinding.FieldName = 'Piece'
        HeaderAlignmentHorz = taCenter
        Width = 96
        Position.BandIndex = 1
        Position.ColIndex = 4
        Position.RowIndex = 0
      end
      object cxGrid2spGridDBBandedTableView1OddY: TspGridDBBandedColumn
        Caption = #30721#26126#32454
        DataBinding.FieldName = 'OddY'
        PropertiesClassName = 'TcxOddTextEditProperties'
        HeaderAlignmentHorz = taCenter
        Width = 125
        Position.BandIndex = 2
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object cxGrid2spGridDBBandedTableView1OddM: TspGridDBBandedColumn
        Caption = #31859#26126#32454
        DataBinding.FieldName = 'OddM'
        PropertiesClassName = 'TcxOddTextEditProperties'
        HeaderAlignmentHorz = taCenter
        Width = 121
        Position.BandIndex = 2
        Position.ColIndex = 1
        Position.RowIndex = 0
      end
      object cxGrid2spGridDBBandedTableView1OddTotal: TspGridDBBandedColumn
        Caption = #21512#35745#26126#32454
        DataBinding.FieldName = 'OddTotal'
        PropertiesClassName = 'TcxOddTextEditProperties'
        Properties.ReadOnly = True
        HeaderAlignmentHorz = taCenter
        Width = 120
        Position.BandIndex = 2
        Position.ColIndex = 2
        Position.RowIndex = 0
      end
      object cxGrid2spGridDBBandedTableView1SpecCut: TspGridDBBandedColumn
        Caption = #30721'/'#25903
        DataBinding.FieldName = 'SpecCutY'
        HeaderAlignmentHorz = taCenter
        Width = 71
        Position.BandIndex = 3
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object cxGrid2spGridDBBandedTableView1QtyCut: TspGridDBBandedColumn
        Caption = #25968#37327
        DataBinding.FieldName = 'QtyCut'
        HeaderAlignmentHorz = taCenter
        Width = 73
        Position.BandIndex = 3
        Position.ColIndex = 2
        Position.RowIndex = 0
      end
      object cxGrid2spGridDBBandedTableView1SaleDetail: TspGridDBBandedColumn
        DataBinding.FieldName = 'SaleDetail'
        PropertiesClassName = 'TcxOddTextEditProperties'
        HeaderAlignmentHorz = taCenter
        Width = 145
        Position.BandIndex = 4
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object cxGrid2spGridDBBandedTableView1SaleQty: TspGridDBBandedColumn
        Caption = #25968#37327
        DataBinding.FieldName = 'SaleQty'
        HeaderAlignmentHorz = taCenter
        Width = 82
        Position.BandIndex = 4
        Position.ColIndex = 1
        Position.RowIndex = 0
      end
      object cxGrid2spGridDBBandedTableView1Price: TspGridDBBandedColumn
        DataBinding.FieldName = 'Price'
        HeaderAlignmentHorz = taCenter
        Width = 50
        Position.BandIndex = 4
        Position.ColIndex = 2
        Position.RowIndex = 0
      end
      object cxGrid2spGridDBBandedTableView1Amount: TspGridDBBandedColumn
        DataBinding.FieldName = 'Amount'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        HeaderAlignmentHorz = taCenter
        Width = 52
        Position.BandIndex = 4
        Position.ColIndex = 3
        Position.RowIndex = 0
      end
      object cxGrid2spGridDBBandedTableView1TotalDetail: TspGridDBBandedColumn
        DataBinding.FieldName = 'TotalDetail'
        PropertiesClassName = 'TcxOddTextEditProperties'
        Properties.ReadOnly = True
        HeaderAlignmentHorz = taCenter
        Width = 87
        Position.BandIndex = 5
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object cxGrid2spGridDBBandedTableView1TotalQtyY: TspGridDBBandedColumn
        DataBinding.FieldName = 'TotalQtyY'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        HeaderAlignmentHorz = taCenter
        Width = 66
        Position.BandIndex = 5
        Position.ColIndex = 1
        Position.RowIndex = 0
      end
      object cxGrid2spGridDBBandedTableView1TotalQtyM: TspGridDBBandedColumn
        DataBinding.FieldName = 'TotalQtyM'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        HeaderAlignmentHorz = taCenter
        Width = 64
        Position.BandIndex = 5
        Position.ColIndex = 2
        Position.RowIndex = 0
      end
      object cxGrid2spGridDBBandedTableView1TotalPiece: TspGridDBBandedColumn
        DataBinding.FieldName = 'TotalPiece'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        HeaderAlignmentHorz = taCenter
        Width = 64
        Position.BandIndex = 5
        Position.ColIndex = 3
        Position.RowIndex = 0
      end
      object cxGrid2spGridDBBandedTableView1SpecSaleM: TspGridDBBandedColumn
        Caption = #38144#21806'('#31859'/'#25903')'
        DataBinding.FieldName = 'SpecSaleM'
        HeaderAlignmentHorz = taCenter
        Width = 105
        Position.BandIndex = 1
        Position.ColIndex = 3
        Position.RowIndex = 0
      end
      object cxGrid2spGridDBBandedTableView1SpecCutM: TspGridDBBandedColumn
        Caption = #31859'/'#25903
        DataBinding.FieldName = 'SpecCutM'
        HeaderAlignmentHorz = taCenter
        Width = 68
        Position.BandIndex = 3
        Position.ColIndex = 1
        Position.RowIndex = 0
      end
    end
    object cxGrid2Level1: TcxGridLevel
      GridView = cxGrid2spGridDBBandedTableView1
    end
  end
  object DataSource1: TDataSource
    DataSet = ClientDataSet1
    Left = 376
  end
  object ClientDataSet1: TspClientDataSet
    PersistDataPacket.Data = {
      A40100009619E0BD010000001800000014000000000003000000A40104556E69
      740100490000000100055749445448020002000A000553706563590800040000
      00000005537065634D0800040000000000095370656353616C65590800040000
      000000095370656353616C654D08000400000000000550696563650400010000
      000000044F646459010049000000010005574944544802000200C800044F6464
      4D010049000000010005574944544802000200C800084F6464546F74616C0100
      49000000010005574944544802000200C8000853706563437574590800040000
      00000008537065634375744D0800040000000000065174794375740800040000
      0000000A53616C6544657461696C010049000000010005574944544802000200
      C8000753616C6551747908000400000000000550726963650800040000000000
      06416D6F756E7408000400000000000B546F74616C44657461696C0100490000
      00010005574944544802000200C80009546F74616C5174795908000400000000
      0009546F74616C5174794D08000400000000000A546F74616C50696563650400
      0100000000000000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'Unit'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'SpecY'
        DataType = ftFloat
      end
      item
        Name = 'SpecM'
        DataType = ftFloat
      end
      item
        Name = 'SpecSaleY'
        DataType = ftFloat
      end
      item
        Name = 'SpecSaleM'
        DataType = ftFloat
      end
      item
        Name = 'Piece'
        DataType = ftInteger
      end
      item
        Name = 'OddY'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'OddM'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'OddTotal'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'SpecCutY'
        DataType = ftFloat
      end
      item
        Name = 'SpecCutM'
        DataType = ftFloat
      end
      item
        Name = 'QtyCut'
        DataType = ftFloat
      end
      item
        Name = 'SaleDetail'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'SaleQty'
        DataType = ftFloat
      end
      item
        Name = 'Price'
        DataType = ftFloat
      end
      item
        Name = 'Amount'
        DataType = ftFloat
      end
      item
        Name = 'TotalDetail'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'TotalQtyY'
        DataType = ftFloat
      end
      item
        Name = 'TotalQtyM'
        DataType = ftFloat
      end
      item
        Name = 'TotalPiece'
        DataType = ftInteger
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    BeforeOpen = ClientDataSet1BeforeOpen
    Dictionary = <
      item
        FieldName = 'Unit'
        FieldType = ftString
        Size = 10
        NumericPrecision = 0
        NumericScale = 0
        DisplayWidth = 10
        DisplayLabel = #21333#20301
        IsAutoGen = False
      end
      item
        FieldName = 'SpecY'
        FieldType = ftFloat
        NumericPrecision = 15
        NumericScale = 0
        Alignment = taRightJustify
        DisplayWidth = 10
        DisplayLabel = #30721'/'#25903
        IsAutoGen = False
      end
      item
        FieldName = 'SpecM'
        FieldType = ftFloat
        NumericPrecision = 15
        NumericScale = 0
        Alignment = taRightJustify
        DisplayWidth = 10
        DisplayLabel = #31859'/'#25903
        IsAutoGen = False
      end
      item
        FieldName = 'SpecSaleY'
        FieldType = ftFloat
        NumericPrecision = 15
        NumericScale = 0
        Alignment = taRightJustify
        DisplayWidth = 10
        DisplayLabel = #38144#21806#35268#26684'('#30721'/'#25903')'
        IsAutoGen = False
      end
      item
        FieldName = 'SpecSaleM'
        FieldType = ftFloat
        NumericPrecision = 0
        NumericScale = 0
        DisplayLabel = #38144#21806#35268#26684'('#31859'/'#25903')'
        IsAutoGen = False
      end
      item
        FieldName = 'Piece'
        FieldType = ftInteger
        NumericPrecision = 0
        NumericScale = 0
        Alignment = taRightJustify
        DisplayWidth = 10
        DisplayLabel = #25972#25903#25968
        IsAutoGen = False
      end
      item
        FieldName = 'OddY'
        FieldType = ftString
        Size = 200
        NumericPrecision = 0
        NumericScale = 0
        DisplayWidth = 100
        DisplayLabel = #38646#22836#30721#26126#32454
        IsAutoGen = False
      end
      item
        FieldName = 'OddM'
        FieldType = ftString
        Size = 200
        NumericPrecision = 0
        NumericScale = 0
        DisplayWidth = 200
        DisplayLabel = #38646#22836#31859#26126#32454
        IsAutoGen = False
      end
      item
        FieldName = 'OddTotal'
        FieldType = ftString
        Size = 200
        NumericPrecision = 0
        NumericScale = 0
        DisplayWidth = 200
        DisplayLabel = #38646#22836#21512#35745#26126#32454
        IsAutoGen = False
      end
      item
        FieldName = 'SpecCutY'
        FieldType = ftFloat
        NumericPrecision = 15
        NumericScale = 0
        Alignment = taRightJustify
        DisplayWidth = 10
        DisplayLabel = #25955#21098#35268#26684'('#30721'/'#25903')'
        IsAutoGen = False
      end
      item
        FieldName = 'SpecCutM'
        FieldType = ftFloat
        NumericPrecision = 0
        NumericScale = 0
        DisplayLabel = #25955#21098#35268#26684'('#31859'/'#25903')'
        IsAutoGen = False
      end
      item
        FieldName = 'QtyCut'
        FieldType = ftFloat
        NumericPrecision = 15
        NumericScale = 0
        Alignment = taRightJustify
        DisplayWidth = 10
        DisplayLabel = #25955#21098#25968#37327
        IsAutoGen = False
      end
      item
        FieldName = 'SaleDetail'
        FieldType = ftString
        Size = 200
        NumericPrecision = 0
        NumericScale = 0
        DisplayWidth = 200
        DisplayLabel = #38144#21806#26126#32454
        IsAutoGen = False
      end
      item
        FieldName = 'SaleQty'
        FieldType = ftFloat
        NumericPrecision = 15
        NumericScale = 0
        Alignment = taRightJustify
        DisplayWidth = 10
        DisplayLabel = #38144#21806#25968#37327
        IsAutoGen = False
      end
      item
        FieldName = 'Price'
        FieldType = ftFloat
        NumericPrecision = 15
        NumericScale = 0
        Alignment = taRightJustify
        DisplayWidth = 10
        DisplayLabel = #21333#20215
        IsAutoGen = False
      end
      item
        FieldName = 'Amount'
        FieldType = ftFloat
        NumericPrecision = 15
        NumericScale = 0
        Alignment = taRightJustify
        DisplayWidth = 10
        DisplayLabel = #37329#39069
        IsAutoGen = False
      end
      item
        FieldName = 'TotalDetail'
        FieldType = ftString
        Size = 200
        NumericPrecision = 0
        NumericScale = 0
        DisplayWidth = 200
        DisplayLabel = #20986#24211#26126#32454
        IsAutoGen = False
      end
      item
        FieldName = 'TotalQtyY'
        FieldType = ftFloat
        NumericPrecision = 15
        NumericScale = 0
        Alignment = taRightJustify
        DisplayWidth = 10
        DisplayLabel = #24635#30721#25968
        IsAutoGen = False
      end
      item
        FieldName = 'TotalQtyM'
        FieldType = ftFloat
        NumericPrecision = 15
        NumericScale = 0
        Alignment = taRightJustify
        DisplayWidth = 10
        DisplayLabel = #24635#31859#25968
        IsAutoGen = False
      end
      item
        FieldName = 'TotalPiece'
        FieldType = ftInteger
        NumericPrecision = 0
        NumericScale = 0
        Alignment = taRightJustify
        DisplayWidth = 10
        DisplayLabel = #24635#20214#25968
        IsAutoGen = False
      end>
    LinkedComponents = <>
    OnFieldChange = ClientDataSet1FieldChange
    OnSumPredicate = ClientDataSet1SumPredicate
    OnSumData = ClientDataSet1SumData
    Left = 440
    Top = 24
    object ClientDataSet1Unit: TspStringField
      DisplayLabel = #21333#20301
      DisplayWidth = 10
      FieldName = 'Unit'
      Size = 10
    end
    object ClientDataSet1SpecY: TspFloatField
      DisplayLabel = #30721'/'#25903
      DisplayWidth = 10
      FieldName = 'SpecY'
    end
    object ClientDataSet1SpecM: TspFloatField
      DisplayLabel = #31859'/'#25903
      DisplayWidth = 10
      FieldName = 'SpecM'
    end
    object ClientDataSet1SpecSaleY: TspFloatField
      DisplayLabel = #38144#21806#35268#26684'('#30721'/'#25903')'
      DisplayWidth = 10
      FieldName = 'SpecSaleY'
    end
    object ClientDataSet1SpecSaleM: TspFloatField
      Alignment = taLeftJustify
      DisplayLabel = #38144#21806#35268#26684'('#31859'/'#25903')'
      DisplayWidth = 20
      FieldName = 'SpecSaleM'
      Precision = 2
    end
    object ClientDataSet1Piece: TspIntegerField
      DisplayLabel = #25972#25903#25968
      DisplayWidth = 10
      FieldName = 'Piece'
    end
    object ClientDataSet1OddY: TspStringField
      DisplayLabel = #38646#22836#30721#26126#32454
      DisplayWidth = 100
      FieldName = 'OddY'
      Size = 200
    end
    object ClientDataSet1OddM: TspStringField
      DisplayLabel = #38646#22836#31859#26126#32454
      DisplayWidth = 200
      FieldName = 'OddM'
      Size = 200
    end
    object ClientDataSet1OddTotal: TspStringField
      DisplayLabel = #38646#22836#21512#35745#26126#32454
      DisplayWidth = 200
      FieldName = 'OddTotal'
      Size = 200
    end
    object ClientDataSet1SpecCutY: TspFloatField
      DisplayLabel = #25955#21098#35268#26684'('#30721'/'#25903')'
      DisplayWidth = 10
      FieldName = 'SpecCutY'
    end
    object ClientDataSet1SpecCutM: TspFloatField
      Alignment = taLeftJustify
      DisplayLabel = #25955#21098#35268#26684'('#31859'/'#25903')'
      DisplayWidth = 20
      FieldName = 'SpecCutM'
      Precision = 2
    end
    object ClientDataSet1QtyCut: TspFloatField
      DisplayLabel = #25955#21098#25968#37327
      DisplayWidth = 10
      FieldName = 'QtyCut'
    end
    object ClientDataSet1SaleDetail: TspStringField
      DisplayLabel = #38144#21806#26126#32454
      DisplayWidth = 200
      FieldName = 'SaleDetail'
      Size = 200
    end
    object ClientDataSet1SaleQty: TspFloatField
      DisplayLabel = #38144#21806#25968#37327
      DisplayWidth = 10
      FieldName = 'SaleQty'
    end
    object ClientDataSet1Price: TspFloatField
      DisplayLabel = #21333#20215
      DisplayWidth = 10
      FieldName = 'Price'
    end
    object ClientDataSet1Amount: TspFloatField
      DisplayLabel = #37329#39069
      DisplayWidth = 10
      FieldName = 'Amount'
    end
    object ClientDataSet1TotalDetail: TspStringField
      DisplayLabel = #20986#24211#26126#32454
      DisplayWidth = 200
      FieldName = 'TotalDetail'
      Size = 200
    end
    object ClientDataSet1TotalQtyY: TspFloatField
      DisplayLabel = #24635#30721#25968
      DisplayWidth = 10
      FieldName = 'TotalQtyY'
    end
    object ClientDataSet1TotalQtyM: TspFloatField
      DisplayLabel = #24635#31859#25968
      DisplayWidth = 10
      FieldName = 'TotalQtyM'
    end
    object ClientDataSet1TotalPiece: TspIntegerField
      DisplayLabel = #24635#20214#25968
      DisplayWidth = 10
      FieldName = 'TotalPiece'
    end
  end
  object cxStyleRepository1: TcxStyleRepository
    PixelsPerInch = 96
    object cxStyle1: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Times New Roman'
      Font.Style = []
    end
  end
  object dxSkinController1: TdxSkinController
    NativeStyle = False
    SkinName = 'MoneyTwins'
    Left = 272
    Top = 24
  end
  object Timer1: TTimer
    Interval = 500
    OnTimer = Timer1Timer
    Left = 752
    Top = 152
  end
end
