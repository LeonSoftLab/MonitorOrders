unit UnitMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, dxSkinsCore, dxSkinscxPCPainter, dxBarBuiltInMenu,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxPC,
  cxClasses, dxSkinsForm, cxContainer, cxEdit, cxGroupBox, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator, cxDBData,
  cxGridLevel, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxGridCustomPopupMenu, cxGridPopupMenu, cxTextEdit,
  cxLabel, ComCtrls, dxCore, cxDateUtils, cxMaskEdit, cxDropDownEdit, cxCalendar,
  Menus, StdCtrls, cxButtons, cxGridExportLink, dxSkinOffice2013LightGray, ShellAPI,
  cxSplitter, cxSpinEdit, ActiveX, ShlObj, Math;

type
  TForm_Main = class(TdxSkinForm)
    ADOConnection: TADOConnection;
    dxSkinController1: TdxSkinController;
    ADOQuery_Orders: TADOQuery;
    DataSource_Orders: TDataSource;
    cxGridPopupMenu_Orders: TcxGridPopupMenu;
    ADOQuery_GetRight: TADOQuery;
    PopupMenu1: TPopupMenu;
    N2: TMenuItem;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle_VF: TcxStyle;
    cxStyle_Act: TcxStyle;
    cxStyle_Tov: TcxStyle;
    N3: TMenuItem;
    cxPageControl1: TcxPageControl;
    cxTabSheet_Orders: TcxTabSheet;
    cxGrid_Orders: TcxGrid;
    cxGrid_OrdersDBTableView: TcxGridDBTableView;
    cxGrid_OrdersColumn_idChicago: TcxGridDBColumn;
    cxGrid_OrdersColumn_OTChID: TcxGridDBColumn;
    cxGrid_OrdersColumn_CodeRoute: TcxGridDBColumn;
    cxGrid_OrdersColumn_NameRoute: TcxGridDBColumn;
    cxGrid_OrdersColumn_CodeBP: TcxGridDBColumn;
    cxGrid_OrdersColumn_DateProcessing: TcxGridDBColumn;
    cxGrid_OrdersColumn_OpDate: TcxGridDBColumn;
    cxGrid_OrdersColumn_OpTypeName: TcxGridDBColumn;
    cxGrid_OrdersColumn_Outercode: TcxGridDBColumn;
    cxGrid_OrdersColumn_OTDocNum: TcxGridDBColumn;
    cxGrid_OrdersColumn_PrintDocNum: TcxGridDBColumn;
    cxGrid_OrdersColumn_OpType: TcxGridDBColumn;
    cxGrid_OrdersColumn_QtyOrder: TcxGridDBColumn;
    cxGrid_OrdersColumn_QtyDoc: TcxGridDBColumn;
    cxGrid_OrdersColumn_SummOrder: TcxGridDBColumn;
    cxGrid_OrdersColumn_SummDoc: TcxGridDBColumn;
    cxGrid_OrdersColumn_NameEmployee: TcxGridDBColumn;
    cxGrid_OrdersColumn_TypeTRT: TcxGridDBColumn;
    cxGrid_OrdersColumn_NameBP: TcxGridDBColumn;
    cxGrid_OrdersColumn_StreetBP: TcxGridDBColumn;
    cxGrid_OrdersLevel: TcxGridLevel;
    cxTabSheet_Actions: TcxTabSheet;
    cxGroupBox_OrdersButtons: TcxGroupBox;
    cxTextEdit_User: TcxTextEdit;
    cxLabel_User: TcxLabel;
    cxLabel_StartDate: TcxLabel;
    cxLabel_EndDate: TcxLabel;
    cxDateEdit_StartDate: TcxDateEdit;
    cxDateEdit_EndDate: TcxDateEdit;
    cxButton_Refresh: TcxButton;
    cxButton_Excel: TcxButton;
    cxButton_About: TcxButton;
    cxGrid_ActionsDBTableView: TcxGridDBTableView;
    cxGrid_ActionsLevel: TcxGridLevel;
    cxGrid_Actions: TcxGrid;
    ADOQuery_Actions: TADOQuery;
    DataSource_Actions: TDataSource;
    cxSplitter1: TcxSplitter;
    cxGroupBox_det: TcxGroupBox;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxSplitter2: TcxSplitter;
    cxGrid2: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    cxGrid_ActionsDBTableViewDBColumn: TcxGridDBColumn;
    cxGrid_ActionsDBTableViewDBColumn1: TcxGridDBColumn;
    cxGrid_ActionsDBTableViewDBColumn2: TcxGridDBColumn;
    cxGrid_ActionsDBTableViewDBColumn3: TcxGridDBColumn;
    cxGrid_ActionsDBTableViewDBColumn4: TcxGridDBColumn;
    cxGrid_ActionsDBTableViewDBColumn5: TcxGridDBColumn;
    cxGrid_ActionsDBTableViewDBColumn6: TcxGridDBColumn;
    cxGrid_ActionsDBTableViewDBColumn11: TcxGridDBColumn;
    cxGrid_ActionsDBTableViewDBColumn12: TcxGridDBColumn;
    cxGrid_ActionsDBTableViewDBColumn21: TcxGridDBColumn;
    cxGrid_ActionsDBTableViewDBColumn22: TcxGridDBColumn;
    cxGrid_ActionsDBTableViewDBColumn31: TcxGridDBColumn;
    cxGrid_ActionsDBTableViewDBColumn32: TcxGridDBColumn;
    cxGrid_ActionsDBTableViewDBColumn41: TcxGridDBColumn;
    cxGrid_ActionsDBTableViewDBColumn42: TcxGridDBColumn;
    cxGrid_ActionsDBTableViewDBColumn51: TcxGridDBColumn;
    cxGrid_ActionsDBTableViewDBColumn52: TcxGridDBColumn;
    cxGrid_ActionsDBTableViewDBColumn7: TcxGridDBColumn;
    cxGrid_ActionsDBTableViewDBColumn8: TcxGridDBColumn;
    cxGrid_ActionsDBTableViewDBColumn9: TcxGridDBColumn;
    cxGrid_ActionsDBTableViewDBColumn10: TcxGridDBColumn;
    cxGrid_ActionsDBTableViewDBColumn13: TcxGridDBColumn;
    cxGroupBox_Actions: TcxGroupBox;
    cxTabSheet_GPS: TcxTabSheet;
    cxGridGPSOrders_Level: TcxGridLevel;
    cxGridGPSOrders: TcxGrid;
    cxGridGPSOrders_DBTableView: TcxGridDBTableView;
    ADOQuery_GPSOrders: TADOQuery;
    DataSource_GPSOrders: TDataSource;
    cxGroupBox_GPS: TcxGroupBox;
    cxDateEdit_GPSStart: TcxDateEdit;
    cxDateEdit_GPSEnd: TcxDateEdit;
    cxGridGPSOrders_DBColumn_id: TcxGridDBColumn;
    cxGridGPSOrders_DBColumn_PrintDocNum: TcxGridDBColumn;
    cxGridGPSOrders_DBColumn_CrDate: TcxGridDBColumn;
    cxGridGPSOrders_DBColumn_idRoute: TcxGridDBColumn;
    cxGridGPSOrders_DBColumn_CodeRoute: TcxGridDBColumn;
    cxGridGPSOrders_DBColumn_NameRoute: TcxGridDBColumn;
    cxGridGPSOrders_DBColumn_idBuyPoint: TcxGridDBColumn;
    cxGridGPSOrders_DBColumn_CodeBP: TcxGridDBColumn;
    cxGridGPSOrders_DBColumn_NameTRT: TcxGridDBColumn;
    cxGridGPSOrders_DBColumn_Street: TcxGridDBColumn;
    cxGridGPSOrders_DBColumn_Latitude: TcxGridDBColumn;
    cxGridGPSOrders_DBColumn_Longitude: TcxGridDBColumn;
    cxButton_GetGPS: TcxButton;
    cxButton_ExcelGPS: TcxButton;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxSpinEdit_Interval: TcxSpinEdit;
    cxStyle_Select: TcxStyle;
    cxGridGPSLog_Level: TcxGridLevel;
    cxGridGPSLog_DBTableView: TcxGridDBTableView;
    DataSource_logGPS: TDataSource;
    ADOQuery_logGPS: TADOQuery;
    cxGridPopupMenu1: TcxGridPopupMenu;
    cxGridGPSLog_DBColumn_idBuyPoint: TcxGridDBColumn;
    cxGridGPSLog_DBColumn_CodeBP: TcxGridDBColumn;
    cxGridGPSLog_DBColumn_Name: TcxGridDBColumn;
    cxGridGPSLog_DBColumn_Street: TcxGridDBColumn;
    cxGridGPSLog_DBColumn_Latitude: TcxGridDBColumn;
    cxGridGPSLog_DBColumn_Longitude: TcxGridDBColumn;
    cxTabSheet_BaseTRT: TcxTabSheet;
    cxGroupBox_TRT: TcxGroupBox;
    cxGrid_RoutesDBTableView1: TcxGridDBTableView;
    cxGrid_RoutesLevel1: TcxGridLevel;
    cxGrid_Routes: TcxGrid;
    cxSplitter3: TcxSplitter;
    cxGrid_TRTDBTableView1: TcxGridDBTableView;
    cxGrid_TRTLevel1: TcxGridLevel;
    cxGrid_TRT: TcxGrid;
    cxGridGPSOrders_DBColumn_FIOEmployee: TcxGridDBColumn;
    cxGridGPSOrders_DBColumn_TypeTRT: TcxGridDBColumn;
    cxButton_InfoGPS: TcxButton;
    procedure FormCreate(Sender: TObject);
    procedure cxButton_RefreshClick(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure cxGrid_OrdersDBTableViewStylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
    procedure cxButton_ExcelClick(Sender: TObject);
    procedure cxDateEdit_EndDatePropertiesChange(Sender: TObject);
    procedure cxDateEdit_StartDatePropertiesChange(Sender: TObject);
    procedure cxButton_AboutClick(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure cxGrid_OrdersDBTableViewCellDblClick(
      Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure cxDateEdit_GPSStartPropertiesChange(Sender: TObject);
    procedure cxDateEdit_GPSEndPropertiesChange(Sender: TObject);
    procedure cxButton_GetGPSClick(Sender: TObject);
    procedure cxButton_ExcelGPSClick(Sender: TObject);
    procedure cxGridGPSOrders_DBTableViewCellDblClick(Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
      AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
    procedure FormDestroy(Sender: TObject);
    function GetSpecialFolderLocation(const Folder: Integer; const FolderNew: TGUID): String;
    function KillDir (Dir: AnsiString; IsRoot, AClearPhoto:boolean): boolean;
    procedure cxGridGPSLog_DBTableViewCellDblClick(Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
      AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
    procedure cxButton_InfoGPSClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
   cDomainName : string;
   _IdEmployee : integer;
   _FIOEmployee : string;
   _DomainName : string;
   _FirstName : string;
   _PositionName : string;
   _IdCurrentPosition : integer;
   _useOrders : boolean;
   _useGPS : boolean;
   _CurrZoom : integer;
  end;

const
 FOLDERID_RoamingAppData: TGUID = '{3EB685DB-65F9-4CF6-A03A-E3EF65729F3D}';
 FOLDERID_Desktop: TGUID = '{B4BFCC3A-DB2C-424C-B029-7FE99A87C641}';
 FOLDERID_Documents: TGUID = '{FDD39AD0-238F-46AF-ADB4-6C85480369C7}';
 FOLDERID_LocalAppData: TGUID = '{F1B32785-6FBA-4FCF-9D55-7B8E7F157091}';

type
 PTOKEN_USER = ^TOKEN_USER;
 _TOKEN_USER = record
   User : TSidAndAttributes;
 end;
 TOKEN_USER = _TOKEN_USER;

var
  Form_Main: TForm_Main;
  _var_WorkDir: string;

implementation

uses UnitOrderErrors, UnitAbout, UnitOrderRows, UnitCheckGPS, Unit_GPSInfo;

{$R *.dfm}

function TForm_Main.GetSpecialFolderLocation(const Folder: Integer; const FolderNew: TGUID): String;
const
  KF_FLAG_DONT_VERIFY         = $00004000;
var
  FolderPath: PWideChar;
  SHGetFolderPath: function(hwnd: HWND; csidl: Integer; hToken: THandle; dwFlags: DWORD; pszPath: PWideChar): HResult; stdcall;
  SHGetKnownFolderPath: function(const rfid: TIID; dwFlags: DWORD; hToken: THandle; var ppszPath: PWideChar): HRESULT; stdcall;
begin
  Result := '';

  if not CompareMem(@FolderNew, @GUID_NULL, SizeOf(TGUID)) then
  begin
    SHGetKnownFolderPath := GetProcAddress(GetModuleHandle('Shell32.dll'), 'SHGetKnownFolderPath');
    if Assigned(SHGetKnownFolderPath) then
    begin
      FolderPath := nil;
      SetLastError(Cardinal(SHGetKnownFolderPath(FolderNew, KF_FLAG_DONT_VERIFY, 0, FolderPath)));
      if Succeeded(HRESULT(GetLastError)) then
      begin
        Result := FolderPath;
        CoTaskMemFree(FolderPath);
      end;
    end;
  end;

  if (Result = '') and (Folder >= 0) then
  begin
    SHGetFolderPath := GetProcAddress(GetModuleHandle('Shell32.dll'), 'SHGetFolderPathW');
    if Assigned(SHGetFolderPath) then
    begin
      FolderPath := AllocMem((MAX_PATH + 1) * SizeOf(WideChar));
      SetLastError(Cardinal(SHGetFolderPath(0, Folder, 0, 0, FolderPath)));
      if Succeeded(HRESULT(GetLastError)) then
        Result := FolderPath;
      FreeMem(FolderPath);
    end;
  end;

  if Result <> '' then
    Result := IncludeTrailingPathDelimiter(Result);
end;

function GetCurrentUserAndDomain (szUser : PChar; var chUser: DWORD; szDomain :PChar; var chDomain : DWORD):Boolean;
var
 hToken : THandle;
 cbBuf  : Cardinal;
 ptiUser : PTOKEN_USER;
 snu    : SID_NAME_USE;
begin
 Result:=false;
 // Получаем маркер доступа текущего потока нашего процесса
 if not OpenThreadToken(GetCurrentThread(),TOKEN_QUERY,true,hToken)
  then begin
   if GetLastError()<> ERROR_NO_TOKEN then exit;
   // В случее ошибки - получаем маркер доступа нашего процесса.
   if not OpenProcessToken(GetCurrentProcess(),TOKEN_QUERY,hToken)
    then exit;
  end;

 // Вывываем GetTokenInformation для получения размера буфера
 if not GetTokenInformation(hToken, TokenUser, nil, 0, cbBuf)
  then if GetLastError()<> ERROR_INSUFFICIENT_BUFFER
   then begin
    CloseHandle(hToken);
    exit;
   end;

 if cbBuf = 0 then exit;

 // Выделяем память под буфер
 GetMem(ptiUser,cbBuf);

 // В случае удачного вызова получим указатель на TOKEN_USER
 if GetTokenInformation(hToken,TokenUser,ptiUser,cbBuf,cbBuf)
  then begin
   // Ищем имя пользователя и его домен по его SID
   if LookupAccountSid(nil,ptiUser.User.Sid,szUser,chUser,szDomain,chDomain,snu)
    then Result:=true;
  end;

 // Освобождаем ресурсы
 CloseHandle(hToken);
 FreeMem(ptiUser);
end;

procedure TForm_Main.cxButton_AboutClick(Sender: TObject);
begin
 with TForm_About.Create(nil) do
  begin
   ShowModal;
  end;
end;

procedure TForm_Main.cxButton_ExcelClick(Sender: TObject);
var
 s:string;
begin
  with TSaveDialog.Create(self) do
   begin
    Name:='SaveDialog';
    InitialDir:=ExtractFileDir(ParamStr(0));
    Title:='Сохранить таблицу как...';
    if Execute then
     begin
      s:=FileName;
      if ExtractFileExt(s)<>'xls' then
      s:=s+'.xls';
      ExportGridToExcel(s,cxGrid_Orders,True,True,False,'xls');
      if MessageDlg('Хотите просмотреть экспортированный файл?',mtConfirmation,mbYesNo,0)=IDYES then
       ShellExecute(Application.Handle,'OPEN',pchar(s),nil,pchar(ExtractFilePath(s)),SW_NORMAL);
     end;
    Free;
   end;
end;

procedure TForm_Main.cxButton_ExcelGPSClick(Sender: TObject);
var
 s:string;
begin
  with TSaveDialog.Create(self) do
   begin
    Name:='SaveDialog';
    InitialDir:=ExtractFileDir(ParamStr(0));
    Title:='Сохранить таблицу как...';
    if Execute then
     begin
      s:=FileName;
      if ExtractFileExt(s)<>'xls' then
      s:=s+'.xls';
      ExportGridToExcel(s,cxGrid_Orders,True,True,False,'xls');
      if MessageDlg('Хотите просмотреть экспортированный файл?',mtConfirmation,mbYesNo,0)=IDYES then
       ShellExecute(Application.Handle,'OPEN',pchar(s),nil,pchar(ExtractFilePath(s)),SW_NORMAL);
     end;
    Free;
   end;
end;

procedure TForm_Main.cxButton_GetGPSClick(Sender: TObject);
begin
Screen.Cursor:=crHourGlass;
if cxGridGPSOrders.ActiveLevel.Index = cxGridGPSOrders_Level.Index then
try
 ADOQuery_GPSOrders.Close;
 ADOQuery_GPSOrders.Parameters.ParamValues['StartDate']:=cxDateEdit_GPSStart.Date;
 ADOQuery_GPSOrders.Parameters.ParamValues['EndDate']:=cxDateEdit_GPSEnd.Date;
 ADOQuery_GPSOrders.Parameters.ParamValues['idEmp']:= _IdEmployee;
 ADOQuery_GPSOrders.Open;
except
 on E:Exception do
  begin
    MessageBox(0,PChar('Передайте администратору следующий текст ошибки:'+E.Message),'Программа сказала Кревед!',MB_ICONERROR);
  end;
end;
if cxGridGPSOrders.ActiveLevel.Index = cxGridGPSLog_Level.Index then
try
 ADOQuery_logGPS.Close;
 ADOQuery_logGPS.Parameters.ParamValues['IdUser']:=_IdEmployee;
 ADOQuery_logGPS.Open;
except
 on E:Exception do
  begin
    MessageBox(0,PChar('Передайте администратору следующий текст ошибки:'+E.Message),'Программа сказала Кревед!',MB_ICONERROR);
  end;
end;
Screen.Cursor:=crDefault;
end;

procedure TForm_Main.cxButton_InfoGPSClick(Sender: TObject);
begin
  with TForm_GPSInfo.Create(nil) do
   try
    cxRichEdit_Manual.Lines.LoadFromFile(ExtractFilePath(Application.ExeName)+'Manual.rtf');
   finally
    ShowModal;
    Free;
   end;
end;

procedure TForm_Main.cxButton_RefreshClick(Sender: TObject);
begin
Screen.Cursor:=crHourGlass;
try
 ADOQuery_Orders.Close;
 ADOQuery_Orders.Parameters.ParamValues['StartDate']:=cxDateEdit_StartDate.Date;
 ADOQuery_Orders.Parameters.ParamValues['EndDate']:=cxDateEdit_EndDate.Date;
 ADOQuery_Orders.Parameters.ParamValues['idEmp']:=_IdEmployee;
 ADOQuery_Orders.Open;
except
 on E:Exception do
  begin
    MessageBox(0,PChar('Передайте администратору следующий текст ошибки:'+E.Message),'Программа сказала Кревед!',MB_ICONERROR);
  end;
end;
Screen.Cursor:=crDefault;
end;

procedure TForm_Main.cxDateEdit_EndDatePropertiesChange(Sender: TObject);
begin
 cxDateEdit_StartDate.Properties.OnChange:=nil;
if cxDateEdit_EndDate.Date<cxDateEdit_StartDate.Date then
 cxDateEdit_StartDate.Date:=cxDateEdit_EndDate.Date;
 cxDateEdit_StartDate.Properties.OnChange:=cxDateEdit_StartDatePropertiesChange;
end;

procedure TForm_Main.cxDateEdit_GPSEndPropertiesChange(Sender: TObject);
begin
 cxDateEdit_GPSStart.Properties.OnChange:=nil;
if cxDateEdit_GPSEnd.Date<cxDateEdit_GPSStart.Date then
 cxDateEdit_GPSStart.Date:=cxDateEdit_GPSEnd.Date;
 cxDateEdit_GPSStart.Properties.OnChange:=cxDateEdit_GPSStartPropertiesChange;
end;

procedure TForm_Main.cxDateEdit_GPSStartPropertiesChange(Sender: TObject);
begin
 cxDateEdit_GPSEnd.Properties.OnChange:=nil;
if cxDateEdit_GPSEnd.Date<cxDateEdit_GPSStart.Date then
 cxDateEdit_GPSEnd.Date:=cxDateEdit_GPSStart.Date;
 cxDateEdit_GPSEnd.Properties.OnChange:=cxDateEdit_GPSEndPropertiesChange;
end;

procedure TForm_Main.cxDateEdit_StartDatePropertiesChange(Sender: TObject);
begin
 cxDateEdit_EndDate.Properties.OnChange:=nil;
if cxDateEdit_EndDate.Date<cxDateEdit_StartDate.Date then
 cxDateEdit_EndDate.Date:=cxDateEdit_StartDate.Date;
 cxDateEdit_EndDate.Properties.OnChange:=cxDateEdit_EndDatePropertiesChange;
end;

procedure TForm_Main.cxGridGPSLog_DBTableViewCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
var
 Gr,M:real;
 G:integer;
begin
 if cxGridGPSLog_DBTableView.DataController.FocusedRecordIndex>-1 then
 with TForm_CheckGPS.Create(nil) do
  begin
   cxButton_Cancel.Enabled:=False;
   ADOQuery_GPSRows.Close;
   ADOQuery_GPSRows.SQL.Text:=cLogFromLog;
   ADOQuery_GPSRows.Parameters.ParseSQL(ADOQuery_GPSRows.SQL.Text,true);  // ищем параметры с скрипте
   _IdBuyPoint:=cxGridGPSLog_DBTableView.DataController.GetValue(cxGridGPSLog_DBTableView.DataController.FocusedRecordIndex,cxGridGPSLog_DBColumn_idBuyPoint.Index);
   Gr:=cxGridGPSLog_DBTableView.DataController.GetValue(cxGridGPSLog_DBTableView.DataController.FocusedRecordIndex,cxGridGPSLog_DBColumn_Latitude.Index);
   G:=trunc(Gr/100); M:=(Gr-(G*100))/60;
   _Lan:=RoundTo(G+M,-6);
   Gr:=cxGridGPSLog_DBTableView.DataController.GetValue(cxGridGPSLog_DBTableView.DataController.FocusedRecordIndex,cxGridGPSLog_DBColumn_Longitude.Index);
   G:=trunc(Gr/100); M:=(Gr-(G*100))/60;
   _Lon:=RoundTo(G+M,-6);
   _idUser:=_IdEmployee;
   _idDoc:=0;
   if ADOQuery_GPSRows.Parameters.Count>0 then   // если есть параметры, заполняем их
    begin
     ADOQuery_GPSRows.Parameters.ParamByName('IdUser').DataType:=ftInteger;
     ADOQuery_GPSRows.Parameters.ParamValues['IdUser']:=_IdEmployee;
     ADOQuery_GPSRows.Parameters.ParamByName('idBuyPoint').DataType:=ftLargeint;
     ADOQuery_GPSRows.Parameters.ParamValues['idBuyPoint']:=cxGridGPSLog_DBTableView.DataController.GetValue(cxGridGPSLog_DBTableView.DataController.FocusedRecordIndex,cxGridGPSLog_DBColumn_idBuyPoint.Index);
    end;
   ADOQuery_GPSRows.Open;
   ShowModal;
   Free;
  end;
end;

procedure TForm_Main.cxGridGPSOrders_DBTableViewCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
var
 Gr,M:real;
 G:integer;
begin
 if cxGridGPSOrders_DBTableView.DataController.FocusedRecordIndex>-1 then
 with TForm_CheckGPS.Create(nil) do
  begin
   ADOQuery_GPSRows.Close;
   ADOQuery_GPSRows.SQL.Text:=cLogFromDoc;
   ADOQuery_GPSRows.Parameters.ParseSQL(ADOQuery_GPSRows.SQL.Text,true);  // ищем параметры с скрипте
   _IdBuyPoint:=cxGridGPSOrders_DBTableView.DataController.GetValue(cxGridGPSOrders_DBTableView.DataController.FocusedRecordIndex,cxGridGPSOrders_DBColumn_idBuyPoint.Index);
   Gr:=cxGridGPSOrders_DBTableView.DataController.GetValue(cxGridGPSOrders_DBTableView.DataController.FocusedRecordIndex,cxGridGPSOrders_DBColumn_Latitude.Index);
   G:=trunc(Gr/100); M:=(Gr-(G*100))/60;
   _Lan:=RoundTo(G+M,-6);
   Gr:=cxGridGPSOrders_DBTableView.DataController.GetValue(cxGridGPSOrders_DBTableView.DataController.FocusedRecordIndex,cxGridGPSOrders_DBColumn_Longitude.Index);
   G:=trunc(Gr/100); M:=(Gr-(G*100))/60;
   _Lon:=RoundTo(G+M,-6);
   _idUser:=_IdEmployee;
   _idDoc:=cxGridGPSOrders_DBTableView.DataController.GetValue(cxGridGPSOrders_DBTableView.DataController.FocusedRecordIndex,cxGridGPSOrders_DBColumn_id.Index);
   if ADOQuery_GPSRows.Parameters.Count>0 then   // если есть параметры, заполняем их
    begin
     ADOQuery_GPSRows.Parameters.ParamByName('IdDoc').DataType:=ftLargeint;
     ADOQuery_GPSRows.Parameters.ParamValues['IdDoc']:=cxGridGPSOrders_DBTableView.DataController.GetValue(cxGridGPSOrders_DBTableView.DataController.FocusedRecordIndex,cxGridGPSOrders_DBColumn_id.Index);
     ADOQuery_GPSRows.Parameters.ParamByName('Interval').DataType:=ftInteger;
     ADOQuery_GPSRows.Parameters.ParamValues['Interval']:=cxSpinEdit_Interval.Value;
    end;
   ADOQuery_GPSRows.Open;
   cxSpinEdit_Zoom.Value := _CurrZoom;
   ShowModal;
   _CurrZoom := cxSpinEdit_Zoom.Value;
   Free;
  end;
end;

procedure TForm_Main.cxGrid_OrdersDBTableViewCellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
 N3Click(nil);
end;

procedure TForm_Main.cxGrid_OrdersDBTableViewStylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
begin
 if ARecord.Values[cxGrid_OrdersColumn_OpTypeName.Index] = 'Внутренний' then
  AStyle := cxStyle_VF;
 if ARecord.Values[cxGrid_OrdersColumn_OpTypeName.Index] = 'Заказ-ошибка' then
  AStyle := cxStyle_VF;
 if ARecord.Values[cxGrid_OrdersColumn_OpTypeName.Index] = 'Акция' then
  AStyle := cxStyle_Act;
 if (ARecord.Values[cxGrid_OrdersColumn_OpTypeName.Index] = 'Внутренний')and
    (Pos('P*1',VarToStr(ARecord.Values[cxGrid_OrdersColumn_Outercode.Index]))>0) then
  AStyle := cxStyle_Tov;
end;

procedure TForm_Main.FormCreate(Sender: TObject);
var
  Domain, User : array [0..50] of Char;
  chDomain,chUser : Cardinal;
begin
 cDomainName := '';
 cxDateEdit_StartDate.Date:=now;
 cxDateEdit_EndDate.Date:=now;
 cxDateEdit_GPSStart.Date:=now;
 cxDateEdit_GPSEnd.Date:=now;
 ADOQuery_GetRight.Close;
 _CurrZoom:=14;
 chDomain:=50;
 chUser :=50;
 GetCurrentUserAndDomain(User,chuser,Domain,chDomain);
 if ParamStr(1) <> '' then
   cDomainName := ParamStr(1);
 if cDomainName<>'' then
  ADOQuery_GetRight.Parameters.ParamValues['DomainName']:=cDomainName
 else
  ADOQuery_GetRight.Parameters.ParamValues['DomainName']:=string(Domain)+'\'+string(User);
//  ADOQuery_GetRight.Parameters.ParamValues['DomainName']:='CONST\kaluga';
 ADOQuery_GetRight.Open;
 if ADOQuery_GetRight.Recordset.RecordCount>0 then
  begin
   _var_WorkDir := GetSpecialFolderLocation(CSIDL_APPDATA, FOLDERID_RoamingAppData) + 'HelperAnalitik\';
   if not DirectoryExists(_var_WorkDir) then
    CreateDir(_var_WorkDir);
   ADOQuery_GetRight.Recordset.MoveFirst;
//Id	FIO	DomainName	FirstName	PositionName	IdCurrentPosition	useOrders	useGPS
   _IdEmployee := ADOQuery_GetRight.Recordset.Fields.Item[0].Value;
   _FIOEmployee := ADOQuery_GetRight.Recordset.Fields.Item[1].Value;
   _DomainName := ADOQuery_GetRight.Recordset.Fields.Item[2].Value;
   _FirstName := ADOQuery_GetRight.Recordset.Fields.Item[3].Value;
   _PositionName := ADOQuery_GetRight.Recordset.Fields.Item[4].Value;
   _IdCurrentPosition := ADOQuery_GetRight.Recordset.Fields.Item[5].Value;
   _useOrders := ADOQuery_GetRight.Recordset.Fields.Item[6].Value;
   _useGPS := ADOQuery_GetRight.Recordset.Fields.Item[7].Value;
   cxTextEdit_User.Text:=_DomainName+' ('+_FIOEmployee+' - '+_PositionName+')';
   cxTabSheet_GPS.Enabled:=_useGPS;
   cxTabSheet_BaseTRT.Enabled:=_useOrders;
   cxTabSheet_Orders.Enabled:=_useOrders;
   MessageBox(0,Pchar('Привет '+_FirstName+'! Добро пожаловать :)'),'Приветствие',MB_ICONINFORMATION);
  end
 else
  begin
   cxTextEdit_User.Text:=ADOQuery_GetRight.Parameters.ParamValues['DomainName'];
   _IdEmployee:=-1;
   _FIOEmployee:='';
   _IdCurrentPosition:=-1;
   ADOConnection.Close;
   ADOConnection.ConnectionString:='';
   MessageBox(0,Pchar('Привет '+VarToStr(ADOQuery_GetRight.Parameters.ParamValues['DomainName'])+'! Тебе нельзя использовать данную программу :)'),'Приветствие',MB_ICONINFORMATION);
  end;
 cxPageControl1.ActivePageIndex:=0;
end;

procedure TForm_Main.FormDestroy(Sender: TObject);
begin
  if DirectoryExists(_var_WorkDir) then
    KillDir(_var_WorkDir, True, True);
end;

function TForm_Main.KillDir(Dir: AnsiString; IsRoot, AClearPhoto:boolean): boolean;
var
  Sr: SysUtils.TSearchRec;
begin
try
  if (Dir <> '') and (Dir[length(Dir)] = '\') then
    Delete(Dir, length(dir), 1);
  if FindFirst(Dir + '\*.*', SysUtils.faDirectory + SysUtils.faHidden + SysUtils.faSysFile +
    SysUtils.faReadonly + SysUtils.faArchive, Sr) = 0 then
    repeat
      if (Sr.Name = '.') or (Sr.Name = '..') or ((not AClearPhoto)and(Sr.Name='PhotoEmployees')) then
        continue;
      if (Sr.Attr and faDirectory) <> faDirectory then
   begin
        FileSetReadOnly(Dir + '\' + sr.Name, False);
        DeleteFile(Dir + '\' + sr.Name);
   end
      else
       begin
        KillDir(Dir + '\' + sr.Name, false, AClearPhoto);
       end;
    until FindNext(sr) <> 0;
  FindClose(sr);
  if not IsRoot then
   begin
    SetFileAttributes(pchar(Dir),faNormal+faDirectory);
    RemoveDir(Dir);
   end;
  Result := (FileGetAttr(Dir) = -1);
except

end;
end;

procedure TForm_Main.N2Click(Sender: TObject);
begin
 with TForm_OrderErrors.Create(nil) do
  begin
   ADOQuery1.Close;
   if cxGrid_OrdersDBTableView.DataController.FocusedRecordIndex>-1 then
    ADOQuery1.Parameters.ParamValues['idChicago']:=cxGrid_OrdersDBTableView.DataController.GetValue(cxGrid_OrdersDBTableView.DataController.FocusedRecordIndex,cxGrid_OrdersColumn_idChicago.Index);
   ADOQuery1.Open;
   ShowModal;
   Free;
  end;
end;

procedure TForm_Main.N3Click(Sender: TObject);
begin
 with TFormOrderRows.Create(nil) do
  begin
   ADOQuery1.Close;
   if cxGrid_OrdersDBTableView.DataController.FocusedRecordIndex>-1 then
    begin
     ADOQuery1.Parameters.ParamValues['idChicago']:=cxGrid_OrdersDBTableView.DataController.GetValue(cxGrid_OrdersDBTableView.DataController.FocusedRecordIndex,cxGrid_OrdersColumn_idChicago.Index);
     ADOQuery1.Parameters.ParamValues['OTChID']:=cxGrid_OrdersDBTableView.DataController.GetValue(cxGrid_OrdersDBTableView.DataController.FocusedRecordIndex,cxGrid_OrdersColumn_OTChID.Index);
     ADOQuery1.Parameters.ParamValues['OpType']:=cxGrid_OrdersDBTableView.DataController.GetValue(cxGrid_OrdersDBTableView.DataController.FocusedRecordIndex,cxGrid_OrdersColumn_OpType.Index);
     OpType:=cxGrid_OrdersDBTableView.DataController.GetValue(cxGrid_OrdersDBTableView.DataController.FocusedRecordIndex,cxGrid_OrdersColumn_OpType.Index);
    end;
   ADOQuery1.Open;
   Caption:='Просмотр товаров по заказу - '+cxGrid_OrdersDBTableView.DataController.GetValue(cxGrid_OrdersDBTableView.DataController.FocusedRecordIndex,cxGrid_OrdersColumn_PrintDocNum.Index) + '   -   Тип документа: '+cxGrid_OrdersDBTableView.DataController.GetValue(cxGrid_OrdersDBTableView.DataController.FocusedRecordIndex,cxGrid_OrdersColumn_OpTypeName.Index);
   ShowModal;
   Free;
  end;
end;

end.
