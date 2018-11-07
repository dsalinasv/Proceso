object dmSearch: TdmSearch
  OldCreateOrder = False
  Height = 449
  Width = 585
  object cdsGetByField: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftWideString
        Precision = 2000
        Name = 'sTable'
        ParamType = ptInput
      end
      item
        DataType = ftWideString
        Precision = 2000
        Name = 'sFields'
        ParamType = ptInput
      end
      item
        DataType = ftWideString
        Precision = 2000
        Name = 'sField'
        ParamType = ptInput
      end
      item
        DataType = ftWideString
        Precision = 2000
        Name = 'sName'
        ParamType = ptInput
      end
      item
        DataType = ftDataSet
        Name = 'ReturnParameter'
        ParamType = ptResult
      end>
    ProviderName = 'dspGetByField'
    Left = 40
    Top = 104
  end
  object dspGetByField: TDataSetProvider
    DataSet = ssmGetByField
    Left = 40
    Top = 56
  end
  object ssmGetByField: TSqlServerMethod
    Params = <
      item
        DataType = ftWideString
        Precision = 2000
        Name = 'sTable'
        ParamType = ptInput
      end
      item
        DataType = ftWideString
        Precision = 2000
        Name = 'sFields'
        ParamType = ptInput
      end
      item
        DataType = ftWideString
        Precision = 2000
        Name = 'sField'
        ParamType = ptInput
      end
      item
        DataType = ftWideString
        Precision = 2000
        Name = 'sName'
        ParamType = ptInput
      end
      item
        DataType = ftDataSet
        Name = 'ReturnParameter'
        ParamType = ptResult
      end>
    SQLConnection = dmGlobal.cntPromaharin
    ServerMethodName = 'TsmGlobal.GetByField'
    Left = 40
    Top = 8
  end
  object ssmGetById: TSqlServerMethod
    Params = <
      item
        DataType = ftWideString
        Precision = 2000
        Name = 'sId'
        ParamType = ptInput
      end
      item
        DataType = ftWideString
        Precision = 2000
        Name = 'sTable'
        ParamType = ptInput
      end
      item
        DataType = ftDataSet
        Name = 'ReturnParameter'
        ParamType = ptResult
      end>
    SQLConnection = dmGlobal.cntPromaharin
    ServerMethodName = 'TsmGlobal.GetById'
    Left = 120
    Top = 8
  end
  object cdsGetById: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftWideString
        Precision = 2000
        Name = 'sId'
        ParamType = ptInput
      end
      item
        DataType = ftWideString
        Precision = 2000
        Name = 'sTable'
        ParamType = ptInput
      end
      item
        DataType = ftDataSet
        Name = 'ReturnParameter'
        ParamType = ptResult
      end>
    ProviderName = 'dspGetById'
    Left = 120
    Top = 104
  end
  object dspGetById: TDataSetProvider
    DataSet = ssmGetById
    Left = 120
    Top = 56
  end
  object ssmGetByCode: TSqlServerMethod
    Params = <
      item
        DataType = ftWideString
        Precision = 2000
        Name = 'sCode'
        ParamType = ptInput
      end
      item
        DataType = ftWideString
        Precision = 2000
        Name = 'sTable'
        ParamType = ptInput
      end
      item
        DataType = ftDataSet
        Name = 'ReturnParameter'
        ParamType = ptResult
      end>
    SQLConnection = dmGlobal.cntPromaharin
    ServerMethodName = 'TsmGlobal.GetByCode'
    Left = 192
    Top = 8
  end
  object cdsGetByCode: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftWideString
        Precision = 2000
        Name = 'sCode'
        ParamType = ptInput
      end
      item
        DataType = ftWideString
        Precision = 2000
        Name = 'sTable'
        ParamType = ptInput
      end
      item
        DataType = ftDataSet
        Name = 'ReturnParameter'
        ParamType = ptResult
      end>
    ProviderName = 'dspGetByCode'
    Left = 192
    Top = 104
  end
  object dspGetByCode: TDataSetProvider
    DataSet = ssmGetByCode
    Left = 192
    Top = 56
  end
end
