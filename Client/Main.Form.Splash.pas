unit Main.Form.Splash;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxGDIPlusClasses, Vcl.ExtCtrls,
  cxLabel;

type
  TfrmSplash = class(TForm)
    imgLogo: TImage;
    lblName: TcxLabel;
    lblSpot: TcxLabel;
    lblUrl: TcxLabel;
    lblMail: TcxLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSplash: TfrmSplash;

implementation

{$R *.dfm}

procedure TfrmSplash.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:= CaFree;
end;

end.
