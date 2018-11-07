inherited dmAlmacen: TdmAlmacen
  inherited dspMaster: TDSProviderConnection
    ServerClassName = 'TsmAlmacen'
    Connected = True
    SQLConnection = dmGlobal.cntData
  end
end
