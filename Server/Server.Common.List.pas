unit Server.Common.List;

interface

uses
  System.SysUtils, System.Classes, Server.Common.Master, DBClient, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Datasnap.Provider, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TsmList = class(TsmMaster)
    procedure dspMasterAfterUpdateRecord(Sender: TObject; SourceDS: TDataSet;
      DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

procedure TsmList.dspMasterAfterUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind);
begin
  if UpdateKind = ukInsert then
  begin
    DeltaDS.Edit;
    DeltaDS.FieldByName('CODE').NewValue:= SourceDS.FieldByName('CODE').AsInteger;
  end;
end;

end.
