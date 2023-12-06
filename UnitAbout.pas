unit UnitAbout;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, dxSkinsCore, dxSkinOffice2013LightGray, cxImage,
  dxGDIPlusClasses, cxLabel, ShellAPI;

type
  TForm_About = class(TForm)
    cxImage1: TcxImage;
    cxImage2: TcxImage;
    cxImage3: TcxImage;
    cxImage4: TcxImage;
    cxImage5: TcxImage;
    cxLabel1: TcxLabel;
    cxLabel3: TcxLabel;
    procedure cxLabel1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_About: TForm_About;

implementation

{$R *.dfm}

procedure TForm_About.cxLabel1Click(Sender: TObject);
begin
  ShellAbout(Application.Handle,'Ппомощник аналитика','Программа предназначена помогать аналитику филиала :)',Application.Icon.Handle);
end;

end.
