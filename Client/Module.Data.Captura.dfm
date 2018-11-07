inherited dmCaptura: TdmCaptura
  inherited dspMaster: TDSProviderConnection
    ServerClassName = 'TsmCaptura'
    Connected = True
    SQLConnection = dmGlobal.cntData
  end
  inherited cdsMaster: TClientDataSet
    Params = <
      item
        DataType = ftString
        Name = 'IDCAPTURA'
        ParamType = ptInput
        Size = 38
      end>
  end
  inherited cdsConsult: TClientDataSet
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
  inherited frxConsult: TfrxReport
    Datasets = <>
    Variables = <>
    Style = <>
  end
end
