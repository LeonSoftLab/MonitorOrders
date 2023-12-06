object Form_OrderErrors: TForm_OrderErrors
  Left = 0
  Top = 0
  Caption = #1054#1096#1080#1073#1082#1080' '#1087#1086' '#1079#1072#1082#1072#1079#1091
  ClientHeight = 417
  ClientWidth = 638
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object cxGrid_OrdersErrors: TcxGrid
    Left = 0
    Top = 0
    Width = 638
    Height = 417
    Align = alClient
    TabOrder = 0
    object cxGrid_OrdersErrorsDBTableView: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = DataSource1
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.Deleting = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsView.NoDataToDisplayInfoText = #1053#1077#1090' '#1076#1072#1085#1085#1099#1093' '#1076#1083#1103' '#1086#1090#1086#1073#1088#1072#1078#1077#1085#1080#1103
      OptionsView.CellAutoHeight = True
      OptionsView.CellTextMaxLineCount = 20
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      Styles.Selection = Form_Main.cxStyle_Select
      object cxGrid_OrdersErrorsDBTableViewidOT: TcxGridDBColumn
        Caption = #1050#1086#1076' '#1074' '#1054#1058
        DataBinding.FieldName = 'idOT'
        Width = 93
      end
      object cxGrid_OrdersErrorsDBTableViewMessage: TcxGridDBColumn
        Caption = #1058#1077#1082#1089#1090' '#1086#1096#1080#1073#1082#1080
        DataBinding.FieldName = 'Message'
        Width = 500
      end
    end
    object cxGrid_OrdersErrorsLevel: TcxGridLevel
      GridView = cxGrid_OrdersErrorsDBTableView
    end
  end
  object ADOQuery1: TADOQuery
    Connection = Form_Main.ADOConnection
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'idChicago'
        Attributes = [paSigned]
        DataType = ftLargeint
        Precision = 19
        Size = 8
        Value = Null
      end>
    SQL.Strings = (
      'SELECT [idOT]'
      '      ,[Message]'
      '  FROM [workdb4_7].[dbo].[DocJournalMessages] with(nolock)'
      'where [idChicago] = :idChicago')
    Left = 280
    Top = 140
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 335
    Top = 140
  end
end
