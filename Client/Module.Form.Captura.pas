unit Module.Form.Captura;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Core.Form.Master, dxBar, cxClasses, System.Actions, Vcl.ActnList,
  System.ImageList, Vcl.ImgList, Vcl.Controls, cxImageList, cxGraphics, Data.DB,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator,
  cxDataControllerConditionalFormattingRulesManagerDialog, cxDBData,
  cxGridLevel, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxBlobEdit, Vcl.Dialogs;

type
  TfrmCaptura = class(TfrmMaster)
    btnSiguiente: TdxBarLargeButton;
    actSiguiente: TAction;
    grdAdjuntosDBTableView1: TcxGridDBTableView;
    grdAdjuntosLevel1: TcxGridLevel;
    grdAdjuntos: TcxGrid;
    dsDocs: TDataSource;
    grdAdjuntosDBTableView1DOC: TcxGridDBColumn;
    dlgOpen: TOpenDialog;
    grdAdjuntosDBTableView1NAME: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure actSiguienteExecute(Sender: TObject);
    procedure cxGrid1DBTableView1DOCPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses Main.Data.Global, DXC.UC.Types, Module.Data.Captura;

procedure TfrmCaptura.actSiguienteExecute(Sender: TObject);
begin
  (dmMaster as TdmCaptura).Siguiente;
  dmGlobal.Broadcast;
  Close;
end;

procedure TfrmCaptura.cxGrid1DBTableView1DOCPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  if dlgOpen.Execute then
  begin
    with (dmMaster as TdmCaptura) do
    begin
      Cargar(dlgOpen.FileName);
    end;
  end;
end;

procedure TfrmCaptura.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  inherited;
  if (dmMaster as TdmCaptura).Cambios then  
    CanClose:= MessageDlg('¿Quiere salir sin guardar los cambios?', 
      mtConfirmation, [mbYes, mbNO], 0) = mrYes;
end;

procedure TfrmCaptura.FormCreate(Sender: TObject);
var
  val: TValidationDetails;
  sName, sDescripcion, sContenedor: String;
begin
  inherited;
  grdAdjuntos.Visible:= dmGlobal.Etapa(sName, sDescripcion, sContenedor);
  Caption:= Caption + ' ' + sDescripcion;
  actSiguiente.Enabled:= dmGlobal.UserControl.HasPermissionFor(
    sContenedor + '.' + sName, val);
end;

initialization
  RegisterClass(TfrmCaptura);

end.
