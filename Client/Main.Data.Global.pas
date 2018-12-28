unit Main.Data.Global;

interface

uses
  System.SysUtils, System.Classes, JSON, DXC.UC.Classes, Data.DBXDataSnap, Data.DBXCommon,
  Data.DbxHTTPLayer, Data.DB, Data.SqlExpr, Datasnap.DBClient, DBXJSON,
  Datasnap.DSConnect, Data.FMTBcd, cxClasses, cxLookAndFeels, dxSkinsCore,
  dxSkinOffice2013White, dxSkinsForm, DXC.UC.DataConnector, UUCMidasConn,
  DXC.UC.UserControl, System.Actions, Vcl.ActnList,
  Vcl.PlatformDefaultStyleActnCtrls, Vcl.ActnMan, Datasnap.DSCommon,
  IPPeerClient, cxEdit, cxEditRepositoryItems;

type
  TCallback = class(TDBXCallback)
  public
    function Execute(const Arg: TJSONValue): TJSONValue; override;
  end;
  TdmGlobal = class(TDataModule)
    cntData: TSQLConnection;
    dspGlobal: TDSProviderConnection;
    sknController: TdxSkinController;
    ssmCheckFolio: TSqlServerMethod;
    ssmCheckCode: TSqlServerMethod;
    UCMidasConn: TUCMidasConn;
    ActionManager: TActionManager;
    actSession: TAction;
    actChange: TAction;
    actUsers: TAction;
    UserControl: TUserControl;
    actEtapa: TAction;
    cdsCaptura: TClientDataSet;
    cccManager: TDSClientCallbackChannelManager;
    actAlmacen: TAction;
    dspAlmacen: TDSProviderConnection;
    cdsAlmacen: TClientDataSet;
    dspEtapa: TDSProviderConnection;
    cdsEtapa: TClientDataSet;
    actCaptura: TAction;
    actCapturaConsult: TAction;
    procedure actExecute(Sender: TObject);
    procedure actExecuteModal(Sender: TObject);
    procedure DataModuleCreate(Sender: TObject);
    procedure UserControlLoginSuccess(ASender: TObject;
      ACurrentUser: TCurrentUser);
  private
    FCallbackName: String;
    function FormName(Sender: TObject): String;
    procedure LoadAccess(cds: TClientDataSet);
    procedure CloseSplash;
    procedure ShowSplash;
  public
    IdUser: Integer;
    UserName: String;
    Etapas: Integer;
    procedure Broadcast;
    function Etapa(var sName, sDescripcion, sContenedor: String): boolean;
    function EsFinal: boolean;
    function GetGuid: string;
    function CheckCode(sCode, sTable: string): boolean;
    function CheckFolio(iFolio: integer; sTable: string): boolean;
    function FirstDayOfMonth(Date: TDateTime): TDateTime;
    function LastDayOfMonth(Date: TDateTime): TDateTime;
  end;

var
  dmGlobal: TdmGlobal;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

uses
  DSSession, DSProxy, System.DateUtils, System.UiTypes, dxCore,
  Main.Form.Splash, Main.Form.Menu, Module.Form.Captura;

const
  CONFIG = 'config.ini';

function TdmGlobal.FormName(Sender: TObject): String;
begin
  Result:= StringReplace((Sender as TComponent).Name, 'act' , 'frm',[]);
end;

procedure TdmGlobal.actExecute(Sender: TObject);
begin
  frmMain.OpenForm(FormName(Sender));
end;

procedure TdmGlobal.actExecuteModal(Sender: TObject);
begin
  frmMain.OpenModalForm(FormName(Sender));
end;

procedure TdmGlobal.ShowSplash;
begin
  frmSplash:= TfrmSplash.Create(nil);
  frmSplash.Show;
  frmSplash.Refresh;
end;

procedure TdmGlobal.UserControlLoginSuccess(ASender: TObject;
  ACurrentUser: TCurrentUser);
begin
  UserControl.AllowableAdditionalObjectsCollection.Clear;
  LoadAccess(cdsAlmacen);
  LoadAccess(cdsEtapa);
  idUser:= ACurrentUser.Id;
  UserName:= ACurrentUser.UserName;
  Etapas:= cdsEtapa.RecordCount;
  cdsCaptura.Close;
  cdsCaptura.ParamByName('USERID').AsInteger:= idUser;
  cdsCaptura.Open;
end;

procedure TdmGlobal.DataModuleCreate(Sender: TObject);
begin
  ShowSplash;
  cntData.Close;
  cntData.ConnectionName:= 'DataSnapCONNECTION';
  cntData.DriverName:= 'DataSnap';
  if FileExists(CONFIG) then
    cntData.LoadParamsFromIniFile(CONFIG);
  cntData.Params.Values['DSAuthenticationUser']:= 'proceso';
  cntData.Params.Values['DSAuthenticationPassword']:= 'etapas';
  cntData.Open;
  cccManager.ManagerId :=
    TDSTunnelSession.GenerateSessionId;
  cccManager.DSHostname:= cntData.Params.Values['HostName'];
  cccManager.UserName:= cntData.Params.Values['DSAuthenticationUser'];
  cccManager.Password:= cntData.Params.Values['DSAuthenticationPassword'];
  FCallbackName:= TDSTunnelSession.GenerateSessionId;
  cccManager.RegisterCallback(
    FCallbackName,
    TCallback.Create
  );
  CloseSplash;
  UserControl.Execute;
end;

function TdmGlobal.EsFinal: boolean;
begin
  Exit(cdsCaptura.FieldByName('ETAPA').AsInteger = Etapas);
end;

function TdmGlobal.Etapa(var sName, sDescripcion, sContenedor: String): boolean;
begin
  cdsEtapa.Locate('IDETAPA', cdsCaptura.FieldByName('ETAPA').AsString, []);
  sName:= cdsEtapa.FieldByName('NAME').AsString;
  sDescripcion:= cdsEtapa.FieldByName('DESCRIPCION').AsString;
  sContenedor:= cdsEtapa.FieldByName('CONTENEDOR').AsString;
  Exit(cdsEtapa.FieldByName('ADJUNTAR').AsInteger = 1);
end;

function TdmGlobal.FirstDayOfMonth(Date: TDateTime): TDateTime;
var
  Year, Month, Day: Word;
begin
  DecodeDate(Date, Year, Month, Day);
  Result := EncodeDate(Year, Month, 1);
end;

function TdmGlobal.LastDayOfMonth(Date: TDateTime): TDateTime;
var
  Year, Month, Day: Word;
begin
  DecodeDate(Date, Year, Month, Day);
  Result := EndOfAMonth(Year, Month);
end;


procedure TdmGlobal.LoadAccess(cds: TClientDataSet);
begin
  cds.Close;
  cds.Open;
  while not cds.Eof do
  begin
    with UserControl.AllowableAdditionalObjectsCollection.Add do
    begin
      ObjectName := cds.FieldByName('NAME').AsString;
      Description := cds.FieldByName('DESCRIPCION').AsString;
      ContainerName := cds.FieldByName('CONTENEDOR').AsString;
      GroupName := cds.FieldByName('GRUPO').AsString;
    end;
    cds.Next;
  end;
end;

function TdmGlobal.GetGuid: string;
begin
  Exit(dxGenerateGUID);
end;

procedure TdmGlobal.Broadcast;
var
  AClient: TDSAdminClient;
begin
  AClient := TDSAdminClient.Create(cntData.DBXConnection);
  try
    AClient.BroadcastToChannel(
      cccManager.ChannelName,
      TJSONString.Create(EmptyStr)
    );
  finally
    AClient.Free;
  end;
end;

function TdmGlobal.CheckCode(sCode, sTable: string): boolean;
begin
  with ssmCheckCode do
  begin
    ParamByName('sCode').AsString:= sCode;
    ParamByName('sTable').AsString:= sTable;
    ExecuteMethod;
    Result:= ParamByName('ReturnParameter').AsBoolean;
  end;
end;

function TdmGlobal.CheckFolio(iFolio: integer; sTable: string): boolean;
begin
  with ssmCheckFolio do
  begin
    ParamByName('iFolio').AsInteger:= iFolio;
    ParamByName('sTable').AsString:= sTable;
    ExecuteMethod;
    Result:= ParamByName('ReturnParameter').AsBoolean;
  end;
end;

procedure TdmGlobal.CloseSplash;
begin
  frmSplash.Close;
end;

{ TMyCallback }

function TCallback.Execute(const Arg: TJSONValue): TJSONValue;
begin
  TThread.Queue(nil,
    procedure
    begin
      dmGlobal.cdsCaptura.Refresh;
    end
  );
  Result := TJSONTrue.Create;
end;

end.
