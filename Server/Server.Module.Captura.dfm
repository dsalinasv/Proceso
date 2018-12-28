inherited smCaptura: TsmCaptura
  OldCreateOrder = True
  inherited qryMaster: TFDQuery
    UpdateOptions.UpdateTableName = 'CAPTURA'
    SQL.Strings = (
      'select * from CAPTURA'
      'where FOLIO = :FOLIO')
    ParamData = <
      item
        Name = 'FOLIO'
        ParamType = ptInput
      end>
  end
  object qryDocs: TFDQuery
    Connection = smContainer.FDConnection
    UpdateOptions.UpdateTableName = 'DOCS'
    SQL.Strings = (
      'select * from DOCS'
      'where FOLIO = :FOLIO and ETAPA = :ETAPA')
    Left = 96
    Top = 8
    ParamData = <
      item
        Name = 'FOLIO'
        DataType = ftString
        ParamType = ptInput
        Size = 10
        Value = Null
      end
      item
        Name = 'ETAPA'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object dspDocs: TDataSetProvider
    DataSet = qryDocs
    UpdateMode = upWhereKeyOnly
    Left = 96
    Top = 56
  end
end
