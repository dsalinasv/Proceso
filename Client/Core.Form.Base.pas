unit Core.Form.Base;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, cxCurrencyEdit, cxTextEdit,
  cxMaskEdit, cxButtonEdit;

type
  TfrmBase = class(TForm)
  private
    { Private declarations }
  public
    { Public declarations }
  protected
    procedure CleanControl(cntControl: TControl);
  end;

implementation

{$R *.dfm}

{ TfrmBase }

procedure TfrmBase.CleanControl(cntControl: TControl);
var
  i : integer;
begin
  if(csAcceptsControls in TWinControl(cntControl).ControlStyle) then
  begin
    for i:= 0 to TWinControl(cntControl).ControlCount - 1 do
      CleanControl(TWinControl(cntControl).Controls[i]);
  end
  else
  begin
    if(cntControl is TcxTextEdit) then
      TcxTextEdit(cntControl).Clear
    else if(cntControl is TcxButtonEdit) then
      TcxButtonEdit(cntControl).Clear
//    else if (cntControl is TcxMemo) then
//      TcxMemo(cntControl).Clear
//    else if (cntControl is TcxComboBox) then
//      TcxComboBox(cntControl).ItemIndex:= -1
    else if(cntControl is TcxCurrencyEdit) then
      TcxCurrencyEdit(cntControl).Value:= 0;
  end;
end;

end.
