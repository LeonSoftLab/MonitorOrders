object FormOrderRows: TFormOrderRows
  Left = 0
  Top = 0
  Caption = #1055#1088#1086#1089#1084#1086#1090#1088' '#1090#1086#1074#1072#1088#1086#1074
  ClientHeight = 434
  ClientWidth = 795
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
  object cxGrid_OrderRows: TcxGrid
    Left = 0
    Top = 0
    Width = 795
    Height = 434
    Align = alClient
    TabOrder = 0
    object cxGrid_OrderRowsDBTableView: TcxGridDBTableView
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
      Styles.OnGetContentStyle = cxGrid_OrderRowsDBTableViewStylesGetContentStyle
      object cxGrid_OrderRowsColumn_ProdID: TcxGridDBColumn
        DataBinding.FieldName = #1050#1086#1076' '#1090#1086#1074#1072#1088#1072
      end
      object cxGrid_OrderRowsColumn_Name: TcxGridDBColumn
        DataBinding.FieldName = #1053#1072#1079#1074#1072#1085#1080#1077' '#1090#1086#1074#1072#1088#1072
        Width = 336
      end
      object cxGrid_OrderRowsColumn_QtyOrder: TcxGridDBColumn
        DataBinding.FieldName = #1041#1091#1090' '#1079#1072#1082#1072#1079
        Width = 54
      end
      object cxGrid_OrderRowsColumn_PriceOrder: TcxGridDBColumn
        DataBinding.FieldName = #1062#1077#1085#1072' '#1079#1072#1082#1072#1079
        Width = 62
      end
      object cxGrid_OrderRowsColumn_AmountOrder: TcxGridDBColumn
        DataBinding.FieldName = #1057#1091#1084#1084#1072' '#1079#1072#1082#1072#1079
        Width = 67
      end
      object cxGrid_OrderRowsColumn_QtyDoc: TcxGridDBColumn
        DataBinding.FieldName = #1041#1091#1090' '#1076#1086#1082
        Width = 45
      end
      object cxGrid_OrderRowsColumn_PriceDoc: TcxGridDBColumn
        DataBinding.FieldName = #1062#1077#1085#1072' '#1076#1086#1082
        Width = 53
      end
      object cxGrid_OrderRowsColumn_AmountDoc: TcxGridDBColumn
        DataBinding.FieldName = #1057#1091#1084#1072' '#1076#1086#1082
        Width = 52
      end
    end
    object cxGrid_OrderRowsLevel: TcxGridLevel
      GridView = cxGrid_OrderRowsDBTableView
    end
  end
  object ADOQuery1: TADOQuery
    Connection = Form_Main.ADOConnection
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    Parameters = <
      item
        Name = 'idChicago'
        DataType = ftLargeint
        Size = -1
        Value = '0'
      end
      item
        Name = 'OTChID'
        DataType = ftInteger
        Size = -1
        Value = 0
      end
      item
        Name = 'OpType'
        DataType = ftInteger
        Size = -1
        Value = 0
      end>
    SQL.Strings = (
      'declare @idChicago bigint'
      'declare @OTChID int'
      'declare @OpType int'
      'set @idChicago = :idChicago'
      'set @OTChID = :OTChID'
      'set @OpType = :OpType'
      ''
      'create table #drPreorder'
      '('
      ' Article int,'
      ' [Name] nvarchar(255),'
      ' [Quantity] float,'
      ' [Price] float,'
      ' [Amount] float'
      ')'
      ''
      'create table #drDocument'
      '('
      '  ProdID int,'
      '  [Name] nvarchar(255),'
      '  Qty float,'
      '  SumCC_wt float,'
      '  PriceCC_wt float'
      ')'
      ''
      'insert into #drPreorder'
      'SELECT '
      ' rG.Article as ['#1050#1086#1076' '#1090#1086#1074#1072#1088#1072']'
      ' ,rG.[FullName] as ['#1058#1086#1074#1072#1088']'
      ' ,dr.[Quantity] as ['#1041#1091#1090']'
      ' ,dr.[Price] as ['#1062#1077#1085#1072']'
      ' ,dr.[Amount] as ['#1057#1091#1084#1084#1072']'
      '  FROM [chicago].[dbo].[drPreOrder] dr with(nolock)'
      
        '   inner join [chicago].[dbo].[refGoods] rG with(nolock) on rG.i' +
        'd = dr.idGoods'
      ' where dr.[idDoc] = @idChicago'
      ''
      'if @OpType = 0'
      ' begin'
      '  insert into #drDocument'
      '  select'
      '   PS1.ID,'
      '   cast(PS1.ProdName as nvarchar(255)),'
      '   sum(InvD.Qty) as Qty,'
      '   sum(InvD.SumCC_wt) as SumCC_wt,'
      '   sum(InvD.SumCC_wt/InvD.Qty) as PriceCC_wt'
      '  from [s-sql-d3].[atlantis].[dbo].[t_InvD] InvD with(nolock)'
      
        '   left join [workdb].[dbo].[ProdsSync] PS with(nolock) on PS.[P' +
        'rodID] = InvD.[ProdID]'
      
        '   left join [workdb].[dbo].[ProdsSync] PS1 with(nolock) on PS1.' +
        '[ProdID] = PS.[ID]'
      '  where InvD.chid = @OTChID'
      '  group by'
      '   PS1.ID,'
      '   cast(PS1.ProdName as nvarchar(255))'
      ' end'
      ''
      'if @OpType = 1'
      ' begin'
      '  insert into #drDocument'
      '  select'
      '   PS1.ID,'
      '   cast(PS1.ProdName as nvarchar(255)),'
      '   sum(InvD.Qty) as Qty,'
      '   sum(InvD.SumCC_wt) as SumCC_wt,'
      '   sum(InvD.SumCC_wt/InvD.Qty) as PriceCC_wt'
      '  from [s-sql-d3].[atlantis].[dbo].[t_IORecD] InvD with(nolock)'
      
        '   left join [workdb].[dbo].[ProdsSync] PS with(nolock) on PS.[P' +
        'rodID] = InvD.[ProdID]'
      
        '   left join [workdb].[dbo].[ProdsSync] PS1 with(nolock) on PS1.' +
        '[ProdID] = PS.[ID]'
      '  where InvD.chid = @OTChID'
      '  group by'
      '   PS1.ID,'
      '   cast(PS1.ProdName as nvarchar(255))'
      ' end'
      ''
      'if @OpType = 2'
      ' begin'
      '  insert into #drDocument'
      '  select'
      '   PS1.ID,'
      '   cast(PS1.ProdName as nvarchar(255)),'
      '   sum(InvD.Qty) as Qty,'
      '   sum(InvD.SumCC_wt) as SumCC_wt,'
      '   sum(InvD.SumCC_wt/InvD.Qty) as PriceCC_wt'
      '  from [s-sql-d3].[atlantis].[dbo].[t_ExpD] InvD with(nolock)'
      
        '   left join [workdb].[dbo].[ProdsSync] PS with(nolock) on PS.[P' +
        'rodID] = InvD.[ProdID]'
      
        '   left join [workdb].[dbo].[ProdsSync] PS1 with(nolock) on PS1.' +
        '[ProdID] = PS.[ID]'
      '  where InvD.chid = @OTChID'
      '  group by'
      '   PS1.ID,'
      '   cast(PS1.ProdName as nvarchar(255))'
      ' end'
      ''
      'select'
      ' isnull(drP.Article,drD.ProdID) as ['#1050#1086#1076' '#1090#1086#1074#1072#1088#1072'],'
      ' isnull(drP.[Name],drD.[Name]) as ['#1053#1072#1079#1074#1072#1085#1080#1077' '#1090#1086#1074#1072#1088#1072'],'
      ' drP.[Quantity] as ['#1041#1091#1090' '#1079#1072#1082#1072#1079'],'
      ' drP.[Price] as ['#1062#1077#1085#1072' '#1079#1072#1082#1072#1079'],'
      ' drP.[Amount] as ['#1057#1091#1084#1084#1072' '#1079#1072#1082#1072#1079'],'
      ' drD.Qty as ['#1041#1091#1090' '#1076#1086#1082'],'
      ' drD.PriceCC_wt as ['#1062#1077#1085#1072' '#1076#1086#1082'],'
      ' drD.SumCC_wt as ['#1057#1091#1084#1072' '#1076#1086#1082']'
      'from #drPreorder drP'
      ' full join #drDocument drD on drD.ProdID = drP.Article'
      ''
      ''
      'drop table #drPreorder'
      'drop table #drDocument')
    Left = 280
    Top = 140
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 335
    Top = 140
  end
  object PopupMenu1: TPopupMenu
    Left = 385
    Top = 140
    object N1: TMenuItem
      Caption = #1058#1077#1089#1090' '#1085#1072' '#1072#1082#1094#1080#1102
    end
  end
end
