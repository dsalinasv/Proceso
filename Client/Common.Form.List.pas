unit Common.Form.List;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Core.Form.Master, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxBarBuiltInMenu, cxPC,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator,
  cxDBData,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, Vcl.DBActns, Vcl.DBClientActns,
  System.Actions, Vcl.ActnList, dxBar, System.ImageList, Vcl.ImgList,
  cxImageList, cxContainer, dxLayoutcxEditAdapters, dxLayoutContainer,
  cxTextEdit, cxDBEdit, dxLayoutControl, dxSkinsCore, dxSkinOffice2013White,
  cxDataControllerConditionalFormattingRulesManagerDialog;

type
  TfrmList = class(TfrmMaster)
    actInsert:TDataSetInsert;
    actPost: TDataSetPost;
    actEdit: TDataSetEdit;
    actCancel: TDataSetCancel;
    actDelete: TDataSetDelete;
    actPrior: TDataSetPrior;
    actNext: TDataSetNext;
    btnInsert: TdxBarLargeButton;
    btnPost: TdxBarLargeButton;
    btnEdit: TdxBarLargeButton;
    btnCancel: TdxBarLargeButton;
    btnDelete: TdxBarLargeButton;
    btnCerrar: TdxBarLargeButton;
    btnPrior: TdxBarLargeButton;
    btnNext: TdxBarLargeButton;
    pcList: TcxPageControl;
    tabList: TcxTabSheet;
    tabData: TcxTabSheet;
    grdListView: TcxGridDBTableView;
    grdListLevel: TcxGridLevel;
    grdList: TcxGrid;
    lcData: TdxLayoutControl;
    txtCode: TcxDBTextEdit;
    txtName: TcxDBTextEdit;
    lcDataGroup_Root: TdxLayoutGroup;
    lblCode: TdxLayoutItem;
    lblName: TdxLayoutItem;
    grdListViewNAME: TcxGridDBColumn;
    grdListViewCODE: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure grdListViewCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmList: TfrmList;

implementation

{$R *.dfm}

procedure TfrmList.FormCreate(Sender: TObject);
begin
  inherited;
  pcList.ActivePage:= tabData;
end;

procedure TfrmList.grdListViewCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  pcList.ActivePage:= tabData;
end;

end.
