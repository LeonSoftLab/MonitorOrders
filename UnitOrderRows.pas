unit UnitOrderRows;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxStyles, dxSkinsCore, dxSkinOffice2013LightGray, dxSkinscxPCPainter,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, DB,
  cxDBData, ADODB, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid, Menus;

type
  TFormOrderRows = class(TForm)
    cxGrid_OrderRows: TcxGrid;
    cxGrid_OrderRowsDBTableView: TcxGridDBTableView;
    cxGrid_OrderRowsLevel: TcxGridLevel;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    cxGrid_OrderRowsColumn_ProdID: TcxGridDBColumn;
    cxGrid_OrderRowsColumn_Name: TcxGridDBColumn;
    cxGrid_OrderRowsColumn_QtyOrder: TcxGridDBColumn;
    cxGrid_OrderRowsColumn_PriceOrder: TcxGridDBColumn;
    cxGrid_OrderRowsColumn_AmountOrder: TcxGridDBColumn;
    cxGrid_OrderRowsColumn_QtyDoc: TcxGridDBColumn;
    cxGrid_OrderRowsColumn_PriceDoc: TcxGridDBColumn;
    cxGrid_OrderRowsColumn_AmountDoc: TcxGridDBColumn;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    procedure cxGrid_OrderRowsDBTableViewStylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
  private
    { Private declarations }
  public
    { Public declarations }
    OpType:integer;
  end;

var
  FormOrderRows: TFormOrderRows;

implementation

uses UnitMain;

{$R *.dfm}

procedure TFormOrderRows.cxGrid_OrderRowsDBTableViewStylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
begin
{ if VarIsNull(ARecord.Values[cxGrid_OrderRowsColumn_QtyOrder.Index]) then
  AStyle := Form_Main.cxStyle_Tov;}
 if VarIsNull(ARecord.Values[cxGrid_OrderRowsColumn_QtyDoc.Index]) then
  AStyle := Form_Main.cxStyle_VF;
 if StrToIntDef(ARecord.Values[cxGrid_OrderRowsColumn_ProdID.Index],0) < 2000 then
  AStyle := Form_Main.cxStyle_Act;
end;

end.
