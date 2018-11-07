program ProcesoServer;

{$APPTYPE CONSOLE}

uses
  System.SysUtils,
  Server.Resource.Strings in 'Server.Resource.Strings.pas',
  Server.Core.Container in 'Server.Core.Container.pas' {smContainer: TDataModule},
  Server.Common.Global in 'Server.Common.Global.pas' {smGlobal: TDSServerModule},
  Server.Common.Master in 'Server.Common.Master.pas' {smMaster: TDSServerModule},
  Server.Common.Module in 'Server.Common.Module.pas' {smModule: TDSServerModule},
  Server.Common.List in 'Server.Common.List.pas' {smList: TDSServerModule},
  Server.Module.Captura in 'Server.Module.Captura.pas' {smCaptura: TDSServerModule},
  Server.Catalog.Almacen in 'Server.Catalog.Almacen.pas' {smAlmacen: TDSServerModule};

begin
  try
    RunDSServer;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end
end.

