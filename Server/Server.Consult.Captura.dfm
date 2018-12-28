inherited smCapturaConsult: TsmCapturaConsult
  OldCreateOrder = True
  inherited qryMaster: TFDQuery
    SQL.Strings = (
      
        'select * from captura c where c.fecha >= :ini and c.fecha <= :fi' +
        'n and c.etapa = (select count(e.idetapa) from etapa e)')
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
