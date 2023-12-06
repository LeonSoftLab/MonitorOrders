program ProjectMonitorOrders;

uses
  Forms,
  UnitMain in 'UnitMain.pas' {Form_Main},
  UnitOrderErrors in 'UnitOrderErrors.pas' {Form_OrderErrors},
  UnitAbout in 'UnitAbout.pas' {Form_About},
  UnitOrderRows in 'UnitOrderRows.pas' {FormOrderRows},
  UnitCheckGPS in 'UnitCheckGPS.pas' {Form_CheckGPS},
  Unit_GPSInfo in 'Unit_GPSInfo.pas' {Form_GPSInfo};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm_Main, Form_Main);
  Application.Run;
end.
