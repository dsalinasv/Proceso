inherited dmCapturaConsult: TdmCapturaConsult
  inherited dspMaster: TDSProviderConnection
    ServerClassName = 'TsmCapturaConsult'
    SQLConnection = dmGlobal.cntData
  end
  inherited cdsMaster: TClientDataSet
    Params = <
      item
        DataType = ftTimeStamp
        Name = 'INI'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'FIN'
        ParamType = ptInput
      end>
  end
end
