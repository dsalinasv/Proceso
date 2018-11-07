unit Module.Form.Captura;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Common.Form.Module, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, dxBarBuiltInMenu, cxPC, cxContainer,
  cxEdit, cxCheckBox, cxDBEdit, Core.Form.Base, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxNavigator,
  cxDataControllerConditionalFormattingRulesManagerDialog, Data.DB, cxDBData,
  cxLabel, dxBar, dxBarExtItems, cxClasses, Vcl.DBActns, System.Actions,
  Vcl.ActnList, System.ImageList, Vcl.ImgList, cxImageList, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridCustomView,
  cxGrid, dxLayoutContainer, dxLayoutControl, dxLayoutcxEditAdapters,
  Vcl.ComCtrls, dxCore, cxDateUtils, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxCalendar, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox;

type
  TfrmCaptura = class(TfrmModule)
    dxLayoutGroup1: TdxLayoutGroup;
    dxLayoutGroup2: TdxLayoutGroup;
    dxLayoutGroup3: TdxLayoutGroup;
    dxLayoutGroup4: TdxLayoutGroup;
    dxLayoutGroup5: TdxLayoutGroup;
    dxLayoutGroup6: TdxLayoutGroup;
    dxLayoutGroup7: TdxLayoutGroup;
    dxLayoutGroup8: TdxLayoutGroup;
    dxLayoutGroup9: TdxLayoutGroup;
    dxLayoutGroup10: TdxLayoutGroup;
    grdListViewFOLIO: TcxGridDBColumn;
    grdListViewFECHA: TcxGridDBColumn;
    cxDBCheckBox1: TcxDBCheckBox;
    dxLayoutItem1: TdxLayoutItem;
    cxDBCheckBox2: TcxDBCheckBox;
    dxLayoutItem2: TdxLayoutItem;
    cxDBCheckBox3: TcxDBCheckBox;
    dxLayoutItem3: TdxLayoutItem;
    cxDBCheckBox4: TcxDBCheckBox;
    dxLayoutItem4: TdxLayoutItem;
    cxDBCheckBox5: TcxDBCheckBox;
    dxLayoutItem5: TdxLayoutItem;
    cxDBCheckBox6: TcxDBCheckBox;
    dxLayoutItem6: TdxLayoutItem;
    cxDBCheckBox7: TcxDBCheckBox;
    dxLayoutItem7: TdxLayoutItem;
    cxDBCheckBox8: TcxDBCheckBox;
    dxLayoutItem8: TdxLayoutItem;
    cxDBCheckBox9: TcxDBCheckBox;
    dxLayoutItem9: TdxLayoutItem;
    cxDBCheckBox10: TcxDBCheckBox;
    dxLayoutItem10: TdxLayoutItem;
    dtpFecha: TcxDBDateEdit;
    lblFecha: TdxLayoutItem;
    lgGlobal: TdxLayoutGroup;
    cxDBLookupComboBox1: TcxDBLookupComboBox;
    lblAlmacen: TdxLayoutItem;
    dsAlmacen: TDataSource;
    dxLayoutAutoCreatedGroup1: TdxLayoutAutoCreatedGroup;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses Main.Data.Global, DXC.UC.Types, Module.Data.Captura;

procedure TfrmCaptura.FormCreate(Sender: TObject);
var
  I: Integer;
  id: String;
  val: TValidationDetails;
  tab: TdxLayoutGroup;
begin
  inherited;
  for I := 0 to 10 do
  begin
    id:= IntToStr(i);
    tab:= FindComponent('dxLayoutGroup' + id) as TdxLayoutGroup;
    if Assigned(tab) then
    begin
      tab.Enabled:= dmGlobal.UserControl.
        HasPermissionFor('Proceso.Paso' + id, val);
      tab.Visible:= dmGlobal.UserControl.
        HasPermissionFor('Proceso.Paso' + id, val);
    end;
  end;
end;

initialization
  RegisterClass(TfrmCaptura);

end.
