unit Main.Form.Menu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxBarBuiltInMenu, cxContainer, cxEdit, cxImage, cxPC,
  dxNavBarCollns, cxClasses, dxNavBarBase, dxNavBar, dxStatusBar, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator,
  cxDataControllerConditionalFormattingRulesManagerDialog, Data.DB, cxDBData,
  cxGridLevel, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxCheckBox, cxImageComboBox, System.ImageList,
  Vcl.ImgList, cxImageList, cxDBLookupComboBox, Vcl.Grids, Vcl.DBGrids,
  cxProgressBar;

type
  TfrmMain = class(TForm)
    navBar: TdxNavBar;
    tabMain: TcxPageControl;
    tabInicio: TcxTabSheet;
    navSecurity: TdxNavBarGroup;
    mnuSession: TdxNavBarItem;
    mnuChange: TdxNavBarItem;
    mnuUsers: TdxNavBarItem;
    StatusBar: TdxStatusBar;
    navCatalogs: TdxNavBarGroup;
    mnuEtapa: TdxNavBarItem;
    grdCapturaTableView: TcxGridDBTableView;
    grdCapturaLevel1: TcxGridLevel;
    grdCaptura: TcxGrid;
    dsCaptura: TDataSource;
    grdCapturaTableViewFECHA: TcxGridDBColumn;
    imgList: TcxImageList;
    mnuAlmacen: TdxNavBarItem;
    grdCapturaTableViewFOLIO: TcxGridDBColumn;
    grdCapturaTableViewIDALMACEN: TcxGridDBColumn;
    dsAlmacen: TDataSource;
    grdCapturaTableViewETAPA: TcxGridDBColumn;
    dsEtapa: TDataSource;
    grdCapturaTableViewAVANCE: TcxGridDBColumn;
    StyleRepository: TcxStyleRepository;
    GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet;
    stlViejas: TcxStyle;
    navConsults: TdxNavBarGroup;
    mnuCapturaConsult: TdxNavBarItem;
    procedure tabMainCanCloseEx(Sender: TObject; ATabIndex: Integer;
      var ACanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure grdCapturaTableViewCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure grdCapturaTableViewStylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
  public
    function OpenForm(FormName: string): TForm;
    function OpenModalForm(FormName: string): TForm;
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

uses ApplicationVersionHelper, Main.Data.Global;

function TfrmMain.OpenForm(FormName: string): TForm;
var
  FormClass: TFormClass;
begin
  Result:= TForm(Application.FindComponent(FormName));
  if Assigned(Result) then
    tabMain.ActivePage:= Result.Parent as TcxTabSheet
  else
  begin
    FormClass:= TFormClass(GetClass('T' + FormName));
    if Assigned(FormClass) then
    begin
      Result:= FormClass.Create(Application);
      Result.ManualDock(tabMain);
      Result.Show;
      tabMain.ActivePageIndex:= Pred(tabMain.PageCount);
      Result.Parent:= tabMain.ActivePage;
    end;
  end;
  tabMain.ActivePage.Name := FormName;
end;

function TfrmMain.OpenModalForm(FormName: string): TForm;
var
  FormClass: TFormClass;
begin
  Result:= TForm(Application.FindComponent(FormName));
  if Assigned(Result) then
    Result.ShowModal
  else
  begin
    FormClass:= TFormClass(GetClass('T' + FormName));
    if Assigned(FormClass) then
    begin
      Result:= FormClass.Create(Application);
      Result.ShowModal;
    end;
  end;
end;

procedure TfrmMain.grdCapturaTableViewCellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  if not dmGlobal.EsFinal then
    dmGlobal.actCaptura.Execute;
end;

procedure TfrmMain.grdCapturaTableViewStylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
begin
  if ARecord.Values[grdCapturaTableViewFECHA.Index] < (Date - 30) then
    AStyle:= stlViejas;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  Caption:= Application.Version['FileDescription'] + ' ' +
    Application.Version['FileVersion'];
end;

procedure TfrmMain.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Perform(CM_DIALOGKEY, VK_TAB, 0);
    Key := #0;
  end;
end;

procedure TfrmMain.FormShow(Sender: TObject);
begin
  (grdCapturaTableViewAVANCE.Properties as TcxProgressBarProperties).Max:=
    dmGlobal.Etapas;
  StatusBar.Panels.Items[0].Text:= 'Usuario: ' + dmGlobal.UserName;
end;

procedure TfrmMain.tabMainCanCloseEx(Sender: TObject; ATabIndex: Integer;
  var ACanClose: Boolean);
begin
  ACanClose:= ATabIndex > 0;
end;

end.
