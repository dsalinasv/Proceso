unit Server.Catalog.Almacen;

interface

uses
  System.SysUtils, System.Classes, Server.Common.List, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Datasnap.Provider, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TsmAlmacen = class(TsmList)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  smAlmacen: TsmAlmacen;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

end.
