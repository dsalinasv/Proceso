inherited smModule: TsmModule
  OldCreateOrder = True
  object qryConsult: TFDQuery
    Connection = smContainer.FDConnection
    Left = 88
    Top = 8
  end
  object dspConsult: TDataSetProvider
    DataSet = qryConsult
    UpdateMode = upWhereKeyOnly
    Left = 88
    Top = 56
  end
end
