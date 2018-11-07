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
  Vcl.ImgList, cxImageList, cxDBLookupComboBox, Vcl.Grids, Vcl.DBGrids;

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
    navCaptura: TdxNavBarGroup;
    mnuCaptura: TdxNavBarItem;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    dsPasos: TDataSource;
    cxGrid1DBTableView1FECHA: TcxGridDBColumn;
    cxGrid1DBTableView1PASO1: TcxGridDBColumn;
    cxGrid1DBTableView1PASO2: TcxGridDBColumn;
    cxGrid1DBTableView1PASO3: TcxGridDBColumn;
    cxGrid1DBTableView1PASO4: TcxGridDBColumn;
    cxGrid1DBTableView1PASO5: TcxGridDBColumn;
    cxGrid1DBTableView1PASO6: TcxGridDBColumn;
    cxGrid1DBTableView1PASO7: TcxGridDBColumn;
    cxGrid1DBTableView1PASO8: TcxGridDBColumn;
    cxGrid1DBTableView1PASO9: TcxGridDBColumn;
    cxGrid1DBTableView1PASO10: TcxGridDBColumn;
    cxGrid1DBTableView1STATUS: TcxGridDBColumn;
    imgList: TcxImageList;
    mnuAlmacen: TdxNavBarItem;
    cxGrid1DBTableView1IDCAPTURA: TcxGridDBColumn;
    cxGrid1DBTableView1IDALMACEN: TcxGridDBColumn;
    dsAlmacen: TDataSource;
    procedure tabMainCanCloseEx(Sender: TObject; ATabIndex: Integer;
      var ACanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
  public
    function OpenForm(FormName: string): TForm;
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
  StatusBar.Panels.Items[0].Text:= 'Usuario: ' + dmGlobal.UserName;
end;

procedure TfrmMain.tabMainCanCloseEx(Sender: TObject; ATabIndex: Integer;
  var ACanClose: Boolean);
begin
  ACanClose:= ATabIndex > 0;
end;

end.
