object smGlobal: TsmGlobal
  OldCreateOrder = False
  OnCreate = DSServerModuleCreate
  Height = 150
  Width = 215
  object qryGlobal: TFDQuery
    Connection = smContainer.FDConnection
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
    Connection = smContainer.FDConnection
    UpdateOptions.UpdateTableName = 'CAPTURA'
    SQL.Strings = (
      'select * from CAPTURA c'
      
        'where c.idalmacen in (select a.code from almacen a where a.name ' +
        'in (select u.componentname from uc_rightsex u where u.userid = :' +
        'userid))'
      '  and c.etapa < (select count(idetapa) from etapa)'
      'order by c.FECHA desc')
    Left = 96
    Top = 16
    ParamData = <
      item
        Name = 'USERID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object dspCaptura: TDataSetProvider
    DataSet = qryCaptura
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 96
    Top = 72
  end
end
