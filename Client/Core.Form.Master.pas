unit Core.Form.Master;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Core.Form.Base, Common.Data.Master, Data.DB,
  System.ImageList, Vcl.ImgList, cxImageList, cxGraphics, dxSkinsCore,
  dxSkinOffice2013White, dxBar, cxClasses, Vcl.DBActns, System.Actions,
  Vcl.ActnList;

type
  TDataModuleClass = class of TDataModule;
  TfrmMaster = class(TfrmBase)
    dsMaster: TDataSource;
    imgList: TcxImageList;
    actList: TActionList;
    barList: TdxBarManager;
    ToolBar: TdxBar;
    actClose: TAction;
    btnClose: TdxBarLargeButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure actCloseExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  protected
    dmMaster: TdmMaster;
  end;

implementation

{$R *.dfm}

procedure TfrmMaster.actCloseExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmMaster.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:= CaFree;
end;

procedure TfrmMaster.FormCreate(Sender: TObject);
var
  sName: string;
  t: TPersistentClass;
  o: TObject;
begin
  sName:= StringReplace(Name, 'frm' , 'dm', []);
  t:= FindClass('T' + sName);
  o:= TDataModuleClass(t).Create(Self);
  dmMaster:= o as TdmMaster;
  dsMaster.DataSet:= dmMaster.cdsMaster;
  dmMaster.cdsMaster.Open;
end;

procedure TfrmMaster.FormDestroy(Sender: TObject);
begin
  FreeAndNil(dmMaster);
end;

end.
