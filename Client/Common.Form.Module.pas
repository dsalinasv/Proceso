unit Common.Form.Module;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Core.Form.Master, Data.DB,
  System.ImageList, Vcl.ImgList, cxImageList, cxGraphics, dxSkinsCore,
  dxSkinOffice2013White, dxBar, cxClasses, System.Actions, Vcl.ActnList,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxBarBuiltInMenu, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator,
  cxDBData,
  cxGridLevel, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, dxLayoutContainer, dxLayoutControl, cxPC,
  cxDataControllerConditionalFormattingRulesManagerDialog, dxBarExtItems,
  Vcl.DBActns, cxLabel;

type
  TfrmModule = class(TfrmMaster)
    pcList: TcxPageControl;
    tabData: TcxTabSheet;
    lcData: TdxLayoutControl;
    lcDataGroup_Root: TdxLayoutGroup;
    tabList: TcxTabSheet;
    grdList: TcxGrid;
    grdListView: TcxGridDBTableView;
    grdListLevel: TcxGridLevel;
	  dtpFechaInicial: TdxBarDateCombo;
    dtpFechaFinal: TdxBarDateCombo;
    actInsert: TDataSetInsert;
    actPost: TDataSetPost;
    actCancel: TDataSetCancel;
    btnInsert: TdxBarLargeButton;
    btnPost: TdxBarLargeButton;
    btnCancel: TdxBarLargeButton;
    btnConsult: TdxBarLargeButton;
    actConsult: TAction;
	  actPrint: TAction;
    btnPrint: TdxBarLargeButton;
    btnDelete: TdxBarLargeButton;
    actDelete: TDataSetDelete;
    dsConsult: TDataSource;
    ROW: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure grdListViewCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure actCancelExecute(Sender: TObject);
    procedure actInsertExecute(Sender: TObject);
    procedure ROWGetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: string);
    procedure actConsultExecute(Sender: TObject);
    procedure actPrintExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses Common.Data.Module, Main.Data.Global;

procedure TfrmModule.actCancelExecute(Sender: TObject);
begin
  dmMaster.cdsMaster.Cancel;
  CleanControl(Self);
end;

procedure TfrmModule.actConsultExecute(Sender: TObject);
begin
  (dmMaster as TdmModule).Consult(dtpFechaInicial.Date, dtpFechaFinal.Date);
end;

procedure TfrmModule.actInsertExecute(Sender: TObject);
begin
  dmMaster.cdsMaster.Append;
  CleanControl(Self);
end;

procedure TfrmModule.actPrintExecute(Sender: TObject);
begin
  (dmMaster as TdmModule).Print(grdListView.DataController.Filter.FilterText);
end;

procedure TfrmModule.FormCreate(Sender: TObject);
begin
  inherited;
  pcList.ActivePage:= tabList;
  dtpFechaInicial.Date:= dmGlobal.FirstDayOfMonth(Date);
  dtpFechaFinal.Date:= dmGlobal.LastDayOfMonth(Date);
end;

procedure TfrmModule.grdListViewCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  pcList.ActivePage:= tabData;
  (dmMaster as TdmModule).ConsultById;
end;

procedure TfrmModule.ROWGetDisplayText(Sender: TcxCustomGridTableItem;
  ARecord: TcxCustomGridRecord; var AText: string);
begin
  AText := IntToStr(Sender.GridView.DataController.GetRowIndexByRecordIndex(
    ARecord.RecordIndex, False) + 1);
end;

end.
