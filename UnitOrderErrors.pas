unit UnitOrderErrors;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxStyles, dxSkinOffice2013LightGray, dxSkinscxPCPainter, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, DB, cxDBData,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxGridCustomView, cxGrid, ADODB, dxSkinsCore;

type
  TForm_OrderErrors = class(TForm)
    cxGrid_OrdersErrors: TcxGrid;
    cxGrid_OrdersErrorsLevel: TcxGridLevel;
    cxGrid_OrdersErrorsDBTableView: TcxGridDBTableView;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    cxGrid_OrdersErrorsDBTableViewidOT: TcxGridDBColumn;
    cxGrid_OrdersErrorsDBTableViewMessage: TcxGridDBColumn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_OrderErrors: TForm_OrderErrors;

implementation

uses UnitMain;

{$R *.dfm}

end.
