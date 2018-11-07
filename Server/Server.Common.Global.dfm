object smGlobal: TsmGlobal
  OldCreateOrder = False
  OnCreate = DSServerModuleCreate
  Height = 150
  Width = 215
  object qryGlobal: TFDQuery
    Left = 24
    Top = 16
  end
  object dspUser: TDataSetProvider
    DataSet = qryGlobal
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 24
    Top = 72
  end
  object qryCaptura: TFDQuery
    UpdateOptions.UpdateTableName = 'CAPTURA'
    SQL.Strings = (
      'select * from CAPTURA order by FECHA')
    Left = 96
    Top = 16
  end
  object dspCaptura: TDataSetProvider
    DataSet = qryCaptura
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 96
    Top = 72
  end
end
