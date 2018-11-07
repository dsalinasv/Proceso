inherited dmMaster: TdmMaster
  OldCreateOrder = True
  OnCreate = DataModuleCreate
  object dspMaster: TDSProviderConnection
    Left = 24
    Top = 16
  end
  object cdsMaster: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspMaster'
    RemoteServer = dspMaster
    Left = 24
    Top = 64
  end
end
