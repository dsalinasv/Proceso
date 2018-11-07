inherited smCaptura: TsmCaptura
  inherited qryMaster: TFDQuery
    UpdateOptions.UpdateTableName = 'CAPTURA'
    SQL.Strings = (
      'select * from CAPTURA'
      'where IDCAPTURA = :IDCAPTURA')
    ParamData = <
      item
        Name = 'IDCAPTURA'
        DataType = ftString
        ParamType = ptInput
        Size = 38
        Value = Null
      end>
  end
  inherited qryConsult: TFDQuery
    SQL.Strings = (
      'select IDCAPTURA, FECHA from CAPTURA'
      'where FECHA >= :ini and FECHA < :fin'
      'order by FECHA')
    ParamData = <
      item
        Name = 'INI'
        DataType = ftTimeStamp
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'FIN'
        DataType = ftTimeStamp
        ParamType = ptInput
      end>
  end
end
