object smMaster: TsmMaster
  OldCreateOrder = False
  OnCreate = DSServerModuleCreate
  Height = 150
  Width = 215
  object qryMaster: TFDQuery
    Connection = smContainer.FDConnection
    Left = 24
    Top = 8
  end
  object dspMaster: TDataSetProvider
    DataSet = qryMaster
    UpdateMode = upWhereKeyOnly
    Left = 24
    Top = 56
  end
  object qryGeneral: TFDQuery
    Connection = smContainer.FDConnection
    Left = 24
    Top = 104
  end
end
