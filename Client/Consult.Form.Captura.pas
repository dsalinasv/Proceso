unit Consult.Form.Captura;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Core.Form.Master, dxBar, cxClasses,
  System.Actions, Vcl.ActnList, System.ImageList, Vcl.ImgList, cxImageList,
  cxGraphics, Data.DB, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator,
  cxDataControllerConditionalFormattingRulesManagerDialog, cxDBData,
  cxDBLookupComboBox, cxProgressBar, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridCustomView, cxGrid, dxBarExtItems;

type
  TfrmCapturaConsult = class(TfrmMaster)
    actConsult: TAction;
    grdCaptura: TcxGrid;
    grdCapturaTableView: TcxGridDBTableView;
    grdCapturaTableViewFOLIO: TcxGridDBColumn;
    grdCapturaTableViewIDALMACEN: TcxGridDBColumn;
    grdCapturaTableViewFECHA: TcxGridDBColumn;
    grdCapturaTableViewETAPA: TcxGridDBColumn;
    grdCapturaTableViewAVANCE: TcxGridDBColumn;
    grdCapturaLevel1: TcxGridLevel;
    dtpFechaInicial: TdxBarDateCombo;
    dtpFechaFinal: TdxBarDateCombo;
    btnConsult: TdxBarLargeButton;
    dsEtapa: TDataSource;
    dsAlmacen: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure actConsultExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses Consult.Data.Captura, Main.Data.Global;

procedure TfrmCapturaConsult.actConsultExecute(Sender: TObject);
begin
  (dmMaster as TdmCapturaConsult).Consult(dtpFechaInicial.Date, dtpFechaFinal.Date);
end;

procedure TfrmCapturaConsult.FormCreate(Sender: TObject);
begin
  inherited;
  dtpFechaInicial.Date:= dmGlobal.FirstDayOfMonth(Date);
  dtpFechaFinal.Date:= dmGlobal.LastDayOfMonth(Date);
end;

initialization
  RegisterClass(TfrmCapturaConsult);

end.
