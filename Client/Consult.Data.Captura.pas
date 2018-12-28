unit Consult.Data.Captura;

interface

uses
  System.SysUtils, System.Classes, Common.Data.Master, Data.DB,
  Datasnap.DBClient, Datasnap.DSConnect;

type
  TdmCapturaConsult = class(TdmMaster)
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Consult(ini, fin: TDate);
  end;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses Main.Data.Global;

{$R *.dfm}

procedure TdmCapturaConsult.Consult(ini, fin: TDate);
begin
  with cdsMaster do
  begin
    Close;
    ParamByName('INI').AsDate:= ini;
    ParamByName('FIN').AsDate:= fin + 1;
    Open;
  end;
end;

initialization
  RegisterClass(TdmCapturaConsult);

end.
