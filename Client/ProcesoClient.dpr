program ProcesoClient;

uses
  MidasLib,
  Vcl.Forms,
  Main.Form.Menu in 'Main.Form.Menu.pas' {frmMain},
  Main.Data.Global in 'Main.Data.Global.pas' {dmGlobal: TDataModule},
  Core.Form.Base in 'Core.Form.Base.pas' {frmBase},
  Common.Form.List in 'Common.Form.List.pas' {frmList},
  Common.Data.Master in 'Common.Data.Master.pas' {dmMaster: TDataModule},
  Core.Form.Master in 'Core.Form.Master.pas' {frmMaster},
  Core.Data.Base in 'Core.Data.Base.pas' {dmBase: TDataModule},
  Common.Form.Module in 'Common.Form.Module.pas' {frmModule},
  Common.Data.Search in 'Common.Data.Search.pas' {dmSearch: TDataModule},
  Common.Form.Search in 'Common.Form.Search.pas' {frmSearch},
  Common.Control.CodeLookup in 'Common.Control.CodeLookup.pas' {ctlCodeLookup: TFrame},
  ApplicationVersionHelper in 'ApplicationVersionHelper.pas',
  VersionInfo in 'VersionInfo.pas',
  Main.Form.Splash in 'Main.Form.Splash.pas' {frmSplash},
  Common.Data.Module in 'Common.Data.Module.pas' {dmModule: TDataModule},
  Module.Form.Captura in 'Module.Form.Captura.pas' {frmCaptura},
  Module.Data.Captura in 'Module.Data.Captura.pas' {dmCaptura: TDataModule},
  Catalog.Data.Almacen in 'Catalog.Data.Almacen.pas' {dmAlmacen: TDataModule},
  Catalog.Form.Almacen in 'Catalog.Form.Almacen.pas' {frmAlmacen},
  Catalog.Data.Etapa in 'Catalog.Data.Etapa.pas' {dmEtapa: TDataModule},
  Catalog.Form.Etapa in 'Catalog.Form.Etapa.pas' {frmEtapa},
  Consult.Data.Captura in 'Consult.Data.Captura.pas' {dmCapturaConsult: TDataModule},
  Consult.Form.Captura in 'Consult.Form.Captura.pas' {frmCapturaConsult};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdmGlobal, dmGlobal);
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
