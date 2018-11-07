unit Catalog.Data.Almacen;

interface

uses
  System.SysUtils, System.Classes, Common.Data.Master, Data.DB,
  Datasnap.DBClient, Datasnap.DSConnect;

type
  TdmAlmacen = class(TdmMaster)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses Main.Data.Global;

{$R *.dfm}

initialization
  RegisterClass(TdmAlmacen);

end.
