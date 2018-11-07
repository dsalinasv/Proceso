unit Common.Control.CodeLookup;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Common.Data.Search,
  cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, cxTextEdit,
  cxDBEdit, dxSkinsCore, cxMaskEdit, cxButtonEdit,
  dxSkinOffice2013White;

type
  TctlCodeLookup = class(TFrame)
    txtId: TcxDBTextEdit;
    txtName: TcxTextEdit;
    txtCode: TcxButtonEdit;
    procedure txtCodeKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure txtCodePropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure txtCodePropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure txtCodeExit(Sender: TObject);
  private
    { Private declarations }
    dmSearch: TdmSearch;
    function GetTable(sId: string): string;
    function GetDataByCode: boolean;
    procedure OpenSearch;
  public
    { Public declarations }
    procedure GetData;
  end;

implementation

{$R *.dfm}

uses
  StrUtils, Datasnap.DBClient, Main.Data.Global,
  Core.Form.Base, Common.Form.Search;

procedure TctlCodeLookup.GetData;
var
  sId: string;
  sTable: string;
begin
  if txtId.Text = EmptyStr then
  begin
    Exit;
  end;
  sId:= txtId.DataBinding.DataField;
  sTable:= GetTable(sId);
  dmSearch:= TdmSearch.Create(Self);
  with dmSearch.cdsGetById do
  begin
    Close;
    ParamByName('sId').AsString:= txtId.Text;
    ParamByName('sTable').AsString:= sTable;
    Open;
    txtCode.Text:= FieldByName('CODE').AsString;
    txtName.Text:= FieldByName('NAME').AsString;
  end;
  dmSearch.Free;
end;

procedure TctlCodeLookup.txtCodeExit(Sender: TObject);
begin
  txtCode.ValidateEdit;
end;

procedure TctlCodeLookup.txtCodeKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F9 then
    OpenSearch;
end;

function TctlCodeLookup.GetDataByCode: boolean;
var
  sId: string;
  sTable: string;
  DataSet: TClientDataSet;
  ListOfStrings: TStringList;
  Control: TComponent;
  i: integer;
begin
  sId:= txtId.DataBinding.DataField;
  sTable:= GetTable(sId);
  if dmGlobal.CheckCode(txtCode.Text, sTable) then
  begin
    ListOfStrings:= TStringList.Create;
    ListOfStrings.Clear;
    ListOfStrings.Delimiter       := '_';
    ListOfStrings.StrictDelimiter := True;
    ListOfStrings.DelimitedText   := Name;
    DataSet:= txtId.DataBinding.DataSource.DataSet as TClientDataSet;
    dmSearch:= TdmSearch.Create(Self);
    with dmSearch.cdsGetByCode do
    begin
      Close;
      ParamByName('sCode').AsString:= txtCode.Text;
      ParamByName('sTable').AsString:= sTable;
      Open;
      DataSet.Edit;
      DataSet.FieldByName(sId).AsString:= FieldByName(sId).AsString;
      txtName.Text:= FieldByName('NAME').AsString;
      if ListOfStrings.Count > 1 then
      begin
        for i := 1 to Pred(ListOfStrings.Count) do
        begin
          if FieldByName(ListOfStrings[i]).AsString <> EmptyStr then
          begin
            DataSet.FieldByName(ListOfStrings[i]).AsString:=
              FieldByName(ListOfStrings[i]).AsString;
            if ListOfStrings[i].Contains('Id') then
            begin
              Control:= Self.Owner.FindComponent(ListOfStrings[i]);
              if Control is TctlCodeLookup then
                (Control as TctlCodeLookup).GetData;
            end;
          end;
        end;
      end;
    end;
    dmSearch.Free;
    ListOfStrings.Free;
    Exit(false);
  end
  else
  begin
    ShowMessage('El código no existe');
    Exit(true);
  end;
end;

procedure TctlCodeLookup.OpenSearch;
var
  sId: string;
  sTable: string;
  FormClass: TFormClass;
  frmSearch: TForm;
begin
  sId:= txtId.DataBinding.DataField;
  sTable:= GetTable(sId);
  FormClass:= TFormClass(GetClass('Tfrm' + sTable + 'Search'));
  if Assigned(FormClass) then
    frmSearch:= FormClass.Create(Self)
  else
    frmSearch:= TfrmSearch.Create(Self);
  with frmSearch as TfrmSearch do
  begin
    Table:= sTable;
    if ShowModal = mrOk then
    begin
      with dmSearch.cdsGetByField do
      begin
        txtCode.Text:= FieldByName('CODE').AsString;
      end;
    end;
  end;
  frmSearch.Free;
end;

function TctlCodeLookup.GetTable(sId: string): string;
begin
  Result:= RightStr(sId, Length(sId) - 2);
end;

procedure TctlCodeLookup.txtCodePropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  OpenSearch;
end;

procedure TctlCodeLookup.txtCodePropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  Error:= VarToStr(DisplayValue) = EmptyStr;
  if Error then
    OpenSearch
  else
    Error:= GetDataByCode;
end;

end.