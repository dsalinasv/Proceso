unit Main.Data.Global;

interface

uses
  System.SysUtils, System.Classes, JSON, DXC.UC.Classes, Data.DBXDataSnap, Data.DBXCommon,
  Data.DbxHTTPLayer, Data.DB, Data.SqlExpr, Datasnap.DBClient, DBXJSON,
  Datasnap.DSConnect, Data.FMTBcd, cxClasses, cxLookAndFeels, dxSkinsCore,
  dxSkinOffice2013White, dxSkinsForm, DXC.UC.DataConnector, UUCMidasConn,
  DXC.UC.UserControl, System.Actions, Vcl.ActnList,
  Vcl.PlatformDefaultStyleActnCtrls, Vcl.ActnMan, Datasnap.DSCommon,
  IPPeerClient;

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
    actCaptura: TAction;
    cdsCaptura: TClientDataSet;
    cccManager: TDSClientCallbackChannelManager;
    actAlmacen: TAction;
    dspAlmacen: TDSProviderConnection;
    cdsAlmacen: TClientDataSet;
    procedure actExecute(Sender: TObject);
    procedure DataModuleCreate(Sender: TObject);
    procedure UserControlLoginSuccess(ASender: TObject;
      ACurrentUser: TCurrentUser);
  private
    FCallbackName: String;
  public
    IdUser: Integer;
    IdAccount: String;
    UserName: String;
    procedure Broadcast;
    procedure CloseSplash;
    procedure ShowSplash;
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

uses DSSession, DSProxy, System.DateUtils, System.UiTypes, dxCore, Main.Form.Splash, Main.Form.Menu;

const
  CONFIG = 'config.ini';

procedure TdmGlobal.actExecute(Sender: TObject);
begin
  frmMain.OpenForm(StringReplace((Sender as TComponent).Name, 'act' , 'frm',[]));
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
  idUser:= ACurrentUser.Id;
  UserName:= ACurrentUser.UserName;
end;

procedure TdmGlobal.DataModuleCreate(Sender: TObject);
begin
  ShowSplash;
  cntData.Close;
  cntData.ConnectionName:= 'DataSnapCONNECTION';
  cntData.DriverName:= 'DataSnap';
  if FileExists(CONFIG) then
    cntData.LoadParamsFromIniFile(CONFIG);
  cntData.Params.Values['DSAuthenticationUser']:= 'promaharin';
  cntData.Params.Values['DSAuthenticationPassword']:= 'auofdsbcs';
  cntData.Open;
  cdsAlmacen.Open;
  cdsCaptura.Open;
  cccManager.ManagerId :=
    TDSTunnelSession.GenerateSessionId;
 cccManager.DSHostname:= cntData.Params.Values['HostName'];
  FCallbackName :=
    TDSTunnelSession.GenerateSessionId;
  cccManager.RegisterCallback(
    FCallbackName,
    TCallback.Create
  );
  CloseSplash;
  UserControl.Execute;
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


function TdmGlobal.GetGuid: string;
begin
  Exit(dxGenerateGUID);
end;

procedure TdmGlobal.Broadcast;
var AClient: TDSAdminClient;
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
end;

end.
