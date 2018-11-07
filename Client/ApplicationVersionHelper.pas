unit ApplicationVersionHelper;
// -----------------------------------------------------------------------------
// Project:	VersionInfo
// Module:	ApplicationVersionHelper
// Description: GetFileVersionInfo Win32 API wrapper.
// Version:	1.1
// Release:	1
// Date:	2-MAR-2008
// Target:	Delphi 2007, Win32.
// Author(s):	Anders Melander, anders@melander.dk
// Copyright:	(c) 2007-2008 Anders Melander.
//		All rights reserved.
// -----------------------------------------------------------------------------
// This work is licensed under the
//   "Creative Commons Attribution-Share Alike 3.0 Unported" license.
// http://creativecommons.org/licenses/by-sa/3.0/
// -----------------------------------------------------------------------------

interface

uses
  VersionInfo,
  Forms,
  Classes;

type
  TApplicationVersionContainer = class(TComponent)
  strict private
    FVersion: TVersionInfo;
  private
    FSystem: String;
    procedure SetSystem(const Value: String);
  public
    constructor Create(AOwner: TApplication); reintroduce;
    destructor Destroy; override;
    property Version: TVersionInfo read FVersion;
    property System: String read FSystem write SetSystem;
  end;

  TApplicationVersionHelper = class helper for TApplication
  protected
    function GetVersion: TVersionInfo;
  public
    property Version: TVersionInfo read GetVersion;
  end;

implementation

{ TApplicationVersionContainer }

constructor TApplicationVersionContainer.Create(AOwner: TApplication);
begin
  inherited Create(AOwner);
  FVersion := TVersionInfo.Create(AOwner.ExeName);
end;

destructor TApplicationVersionContainer.Destroy;
begin
  FVersion.Free;
  inherited Destroy;
end;

procedure TApplicationVersionContainer.SetSystem(const Value: String);
begin
  FSystem := Value;
end;

{ TApplicationVersionHelper }

function TApplicationVersionHelper.GetVersion: TVersionInfo;
var
  i: integer;
begin
  Result := nil;
  i := 0;
  while (Result = nil) and (i < ComponentCount) do
  begin
    if (Components[i] is TApplicationVersionContainer) then
    begin
      Result := TApplicationVersionContainer(Components[i]).Version;
      break;
    end;
    inc(i);
  end;

  if (Result = nil) then
    Result := TApplicationVersionContainer.Create(Self).Version;
end;

end.
