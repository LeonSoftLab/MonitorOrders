unit UnitCheckGPS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles, dxSkinsCore,
  dxSkinOffice2013LightGray, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, cxDBData,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, cxContainer,
  cxGroupBox, Menus, StdCtrls, cxButtons, OleCtrls, SHDocVw, ShellAPI, StrUtils, cxTextEdit, cxMaskEdit, cxSpinEdit, cxLabel,
  Math, cxDropDownEdit, cxCheckBox, Clipbrd, cxMemo;

type
  TForm_CheckGPS = class(TForm)
    ADOQuery_GPSRows: TADOQuery;
    DataSource_GPSRows: TDataSource;
    cxGridGPSRowsDBTableView: TcxGridDBTableView;
    cxGridGPSRowsLevel: TcxGridLevel;
    cxGridGPSRows: TcxGrid;
    cxGridGPSRowsDBColumn_PointTime: TcxGridDBColumn;
    cxGridGPSRowsDBColumn_Latitude: TcxGridDBColumn;
    cxGridGPSRowsDBColumn_Longitude: TcxGridDBColumn;
    cxGridGPSRowsDBColumn_Azimuth: TcxGridDBColumn;
    cxGridGPSRowsDBColumn_Speed: TcxGridDBColumn;
    cxGridGPSRowsDBColumn_IsValid: TcxGridDBColumn;
    cxGroupBox1: TcxGroupBox;
    cxButton_Apply: TcxButton;
    cxButton_Cancel: TcxButton;
    ADOCommand_UpdateGPS: TADOCommand;
    WebBrowser1: TWebBrowser;
    cxButton_OpenGoogle: TcxButton;
    cxLabel_Zoom: TcxLabel;
    cxSpinEdit_Zoom: TcxSpinEdit;
    cxLabel_TypeMap: TcxLabel;
    cxComboBox_TypeMap: TcxComboBox;
    cxCheckBox_OpenIE: TcxCheckBox;
    procedure cxButton_ApplyClick(Sender: TObject);
    procedure cxButton_CancelClick(Sender: TObject);
    procedure cxButton_OpenGoogleClick(Sender: TObject);
    procedure cxGridGPSRowsDBTableViewCellClick(Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
      AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    _IdBuyPoint:Int64;
    _idUser:Int64;
    _idDoc:Int64;
    _Lan,_Lon:Real;
    _Operation:Integer;
  end;


var
  Form_CheckGPS: TForm_CheckGPS;
cGoogleMap: string = '<!DOCTYPE html> '
+sLineBreak+'<html> '
+sLineBreak+'  <head> '
+sLineBreak+'    <meta name="viewport" content="initial-scale=1.0, user-scalable=no"> '
+sLineBreak+'    <title>Маркеры координат</title> '
+sLineBreak+'    <style> '
+sLineBreak+'      html, body, #map { '
+sLineBreak+'        height: 100%; '
+sLineBreak+'        margin: 0px; '
+sLineBreak+'        padding: 0px '
+sLineBreak+'      } '
+sLineBreak+'    </style> '
+sLineBreak+'  </head> '
+sLineBreak+'  <body> '
+sLineBreak+'    <div id="map"></div> '
+sLineBreak+'    <script> '
+sLineBreak+' '
+sLineBreak+'function initMap() { '
+sLineBreak+'  MyTestParam1 '
+sLineBreak+'  MyTestParam2 '
+sLineBreak+' '
+sLineBreak+'  var map = new google.maps.Map(document.getElementById(''map''), { '
+sLineBreak+'    zoom: MyTestParam4, '
+sLineBreak+'    center: MyTestParam3, '
+sLineBreak+'    mapTypeId: google.maps.MapTypeId.MyTestParam5 '
+sLineBreak+'  }); '
+sLineBreak+' '
+sLineBreak+'  var marker1 = new google.maps.Marker({ '
+sLineBreak+'    position: myLatLng1, '
+sLineBreak+'    map: map, '
+sLineBreak+'    title: ''Зафиксированные координаты'' '
+sLineBreak+'  }); '
+sLineBreak+' '
+sLineBreak+'  var marker2 = new google.maps.Marker({ '
+sLineBreak+'    position: myLatLng2, '
+sLineBreak+'    map: map, '
+sLineBreak+'    title: ''Координаты ТТ'' '
+sLineBreak+'  }); '
+sLineBreak+'} '
+sLineBreak+' '
+sLineBreak+'    </script> '
+sLineBreak+'    <script async defer '
+sLineBreak+'        src="https://maps.googleapis.com/maps/api/js?v=3.exp&signed_in=true&callback=initMap"></script> '
+sLineBreak+'  </body> '
+sLineBreak+'</html> ';

cLogFromDoc: string = 'declare @IdDoc bigint '
+sLineBreak+'declare @Interval int '
+sLineBreak+'set @IdDoc = :IdDoc '
+sLineBreak+'set @Interval = :Interval '
+sLineBreak+'select '
+sLineBreak+' dj.[Id], '
+sLineBreak+' dj.[OpDate], '
+sLineBreak+' dateadd(ss,-@Interval,dj.OpDate) as [StartTime], '
+sLineBreak+' dateadd(ss,@Interval,dj.OpDate) as [EndTime], '
+sLineBreak+' dj.[idPhysicalPerson], '
+sLineBreak+' rR.Id as [idRoute] '
+sLineBreak+'into #Filtr '
+sLineBreak+'from [chicago].[dbo].[DocJournal] dj with(nolock) '
+sLineBreak+'   inner join [chicago].[dbo].[refEmployeesPositions] rEP with(nolock) on rEP.idEmployee = dj.[idPhysicalPerson] and rEP.deleted = 0 '
+sLineBreak+'   inner join [chicago].[dbo].[refPositions] rP with(nolock) on rP.idChief = rEP.id and rP.deleted = 0 '
+sLineBreak+'   inner join [chicago].[dbo].[refRoutes] rR with(nolock) on rR.idPosition = rP.id and rR.deleted = 0 '
+sLineBreak+'where dj.id = @IdDoc '
+sLineBreak+'SELECT distinct '
+sLineBreak+'  jGpsD.[PointTime] as [Время] '
+sLineBreak+' ,jGpsD.[Latitude] '
+sLineBreak+' ,jGpsD.[Longitude] '
+sLineBreak+' ,jGpsD.[Azimuth] '
+sLineBreak+' ,jGpsD.[Speed] as [Скорость] '
+sLineBreak+' ,jGpsD.[IsValid] as [Корректные коорд.] '
+sLineBreak+'  FROM #Filtr F '
+sLineBreak+'   inner join [chicago].[dbo].[JrnAgentGPS] jGps with(nolock) on jGps.idRoute = F.[idRoute] and convert(datetime,convert(nvarchar(10),jGps.OpDate,103),103)=convert(datetime,convert(nvarchar(10),F.OpDate,103),103) '
+sLineBreak+'   inner join [chicago].[dbo].[JrnAgentGPSDetails] jGpsD with(nolock) on jGpsD.idGPSLog = jGps.id '
+sLineBreak+'  where jGpsD.PointTime between F.[StartTime] and F.[EndTime] '
+sLineBreak+'drop table #Filtr';

cLogFromLog: string = 'declare @IdUser int '
+sLineBreak+'declare @idBuyPoint bigint '
+sLineBreak+'set @IdUser = :IdUser '
+sLineBreak+'set @idBuyPoint = :idBuyPoint '
+sLineBreak+' SELECT '
+sLineBreak+' logGPS.[DateTimeStamp] as [Время] '
+sLineBreak+' ,logGPS.[OldLatitude] as [Latitude] '
+sLineBreak+' ,logGPS.[OldLongitude] as [Longitude] '
+sLineBreak+' ,0 as [Azimuth] '
+sLineBreak+' ,0 as [Скорость] '
+sLineBreak+' ,0 as [Корректные коорд.] '
+sLineBreak+'FROM [DBExchange].[dbo].[LogChangeGPSBuyPoint] logGPS with(nolock) '
+sLineBreak+'   inner join [chicago].[dbo].[refBuyPoints] rBP with(nolock) on rBP.id = logGPS.idBuyPoint '
+sLineBreak+' where logGPS.idUser = @IdUser and logGPS.idBuyPoint = @idBuyPoint ';

implementation

uses UnitMain;

{$R *.dfm}

procedure TForm_CheckGPS.cxButton_OpenGoogleClick(Sender: TObject);
var
 tmpHTML:TStringList;
 tmpFileName:string;
 lan1,lan2,lan3,lon1,lon2,lon3:Real;
 Gr,M:real;
 G:integer;
begin
 tmpHTML := TStringList.Create;
 if cxGridGPSRowsDBTableView.DataController.FocusedRecordIndex>-1 then
 begin
  Gr:=cxGridGPSRowsDBTableView.DataController.GetValue(cxGridGPSRowsDBTableView.DataController.FocusedRecordIndex,cxGridGPSRowsDBColumn_Latitude.Index);
  G:=trunc(Gr/100); M:=(Gr-(G*100))/60;
  lan1:=RoundTo(G+M,-6);
  Gr:=cxGridGPSRowsDBTableView.DataController.GetValue(cxGridGPSRowsDBTableView.DataController.FocusedRecordIndex,cxGridGPSRowsDBColumn_Longitude.Index);
  G:=trunc(Gr/100); M:=(Gr-(G*100))/60;
  lon1:=RoundTo(G+M,-6);
 end;
 lan2:=_Lan; lon2:=_Lon;
 if (_Lan<>0) and (_Lon<>0) then
   cGoogleMap:=StringReplace(cGoogleMap,'MyTestParam3','myLatLng2',[rfReplaceAll, rfIgnoreCase])
  else
   cGoogleMap:=StringReplace(cGoogleMap,'MyTestParam3','myLatLng1',[rfReplaceAll, rfIgnoreCase]);
 cGoogleMap:=StringReplace(cGoogleMap,'MyTestParam4',IntToStr(cxSpinEdit_Zoom.Value),[rfReplaceAll, rfIgnoreCase]);
 cGoogleMap:=StringReplace(cGoogleMap,'MyTestParam5',UpperCase(cxComboBox_TypeMap.Text),[rfReplaceAll, rfIgnoreCase]);
 cGoogleMap:=StringReplace(cGoogleMap,'MyTestParam1','var myLatLng1 = {lat: '+StringReplace(FloatToStr(lan1),',','.',[])+', lng: '+StringReplace(FloatToStr(lon1),',','.',[])+'};',[rfReplaceAll, rfIgnoreCase]);
 cGoogleMap:=StringReplace(cGoogleMap,'MyTestParam2','var myLatLng2 = {lat: '+StringReplace(FloatToStr(lan2),',','.',[])+', lng: '+StringReplace(FloatToStr(lon2),',','.',[])+'};',[rfReplaceAll, rfIgnoreCase]);
 tmpHTML.Text := cGoogleMap;
 tmpFileName := _var_WorkDir + 'Google_' + FormatDateTime('hh_nn_ss_zzz', now) + '.html';
 tmpHTML.SaveToFile(tmpFileName);
 FreeAndNil(tmpHTML);
 if cxCheckBox_OpenIE.Checked then
  ShellExecute(0,'open',PChar(tmpFileName),nil,nil,SW_SHOW)
 else
  WebBrowser1.Navigate(tmpFileName);
end;

procedure TForm_CheckGPS.cxGridGPSRowsDBTableViewCellClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
var
 lan1,lan2,lan3,lon1,lon2,lon3:Real;
 Gr,M:real;
 G:integer;
begin
if cxGridGPSRowsDBTableView.DataController.FocusedRecordIndex>-1 then
 begin
  Gr:=cxGridGPSRowsDBTableView.DataController.GetValue(cxGridGPSRowsDBTableView.DataController.FocusedRecordIndex,cxGridGPSRowsDBColumn_Latitude.Index);
  G:=trunc(Gr/100); M:=(Gr-(G*100))/60;
  lan1:=RoundTo(G+M,-6);
  Gr:=cxGridGPSRowsDBTableView.DataController.GetValue(cxGridGPSRowsDBTableView.DataController.FocusedRecordIndex,cxGridGPSRowsDBColumn_Longitude.Index);
  G:=trunc(Gr/100); M:=(Gr-(G*100))/60;
  lon1:=RoundTo(G+M,-6);
 end;
 lan2:=_Lan; lon2:=_Lon;
 if (_Lan<>0) and (_Lon<>0) then
  begin
   lan3:=_Lan; lon3:=_Lon;
  end
  else
  begin
   lan3:=lan1; lon3:=lon1;
  end;
 WebBrowser1.Navigate('https://maps.googleapis.com/maps/api/staticmap?center='+StringReplace(FloatToStr(lan3),',','.',[])+','+StringReplace(FloatToStr(lon3),',','.',[])+'&zoom='+IntToStr(cxSpinEdit_Zoom.Value)+'&size='+IntToStr(WebBrowser1.Width-10)+'x'+IntToStr(WebBrowser1.Height-10)+'&maptype='+cxComboBox_TypeMap.Text+'&format=png32&markers=color:blue%7Clabel:A%7C'+StringReplace(FloatToStr(lan1),',','.',[])+','+StringReplace(FloatToStr(lon1),',','.',[])+'&markers=color:red%7Clabel:B%7C'+StringReplace(FloatToStr(lan2),',','.',[])+','+StringReplace(FloatToStr(lon2),',','.',[]));
end;

procedure TForm_CheckGPS.cxButton_ApplyClick(Sender: TObject);
begin
if cxGridGPSRowsDBTableView.DataController.FocusedRecordIndex>-1 then
 begin
 if MessageBox(0,'Вы действительно хотите перепривязать GPS координаты?','Внимание!',MB_ICONQUESTION+MB_YESNO)=IDYES then
  begin
   ADOCommand_UpdateGPS.Parameters.ParamValues['ID'] := _IdBuyPoint;
   ADOCommand_UpdateGPS.Parameters.ParamValues['idDoc'] := _idDoc;
   ADOCommand_UpdateGPS.Parameters.ParamValues['Latitude'] := cxGridGPSRowsDBTableView.DataController.GetValue(cxGridGPSRowsDBTableView.DataController.FocusedRecordIndex,cxGridGPSRowsDBColumn_Latitude.Index);
   ADOCommand_UpdateGPS.Parameters.ParamValues['Longitude'] := cxGridGPSRowsDBTableView.DataController.GetValue(cxGridGPSRowsDBTableView.DataController.FocusedRecordIndex,cxGridGPSRowsDBColumn_Longitude.Index);
   ADOCommand_UpdateGPS.Parameters.ParamValues['Operation'] := 1;
   ADOCommand_UpdateGPS.Parameters.ParamValues['idUser'] := _idUser;
   ADOCommand_UpdateGPS.Execute;
  end;
 end
else
 MessageBox(0,'Выберите запись GPS для копирования координат!','Не выбрана запись',MB_ICONERROR);
end;

procedure TForm_CheckGPS.cxButton_CancelClick(Sender: TObject);
begin
 if MessageBox(0,'Вы действительно хотите Отменить GPS координаты?','Внимание!',MB_ICONQUESTION+MB_YESNO)=IDYES then
  begin
   ADOCommand_UpdateGPS.Parameters.ParamValues['ID'] := _IdBuyPoint;
   ADOCommand_UpdateGPS.Parameters.ParamValues['idDoc'] := _idDoc;
   if cxGridGPSRowsDBTableView.DataController.FocusedRecordIndex>-1 then
    begin
     ADOCommand_UpdateGPS.Parameters.ParamValues['Latitude'] := cxGridGPSRowsDBTableView.DataController.GetValue(cxGridGPSRowsDBTableView.DataController.FocusedRecordIndex,cxGridGPSRowsDBColumn_Latitude.Index);
     ADOCommand_UpdateGPS.Parameters.ParamValues['Longitude'] := cxGridGPSRowsDBTableView.DataController.GetValue(cxGridGPSRowsDBTableView.DataController.FocusedRecordIndex,cxGridGPSRowsDBColumn_Longitude.Index);
    end
   else
    begin
     ADOCommand_UpdateGPS.Parameters.ParamValues['Latitude'] := 0;
     ADOCommand_UpdateGPS.Parameters.ParamValues['Longitude'] := 0;
    end;
   ADOCommand_UpdateGPS.Parameters.ParamValues['Operation'] := 3;
   ADOCommand_UpdateGPS.Parameters.ParamValues['idUser'] := _idUser;
   ADOCommand_UpdateGPS.Execute;
  end;
end;

end.
