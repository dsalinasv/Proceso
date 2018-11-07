inherited smList: TsmList
  OldCreateOrder = True
  inherited dspMaster: TDataSetProvider
    ResolveToDataSet = True
    Options = [poPropogateChanges, poUseQuoteChar]
    AfterUpdateRecord = dspMasterAfterUpdateRecord
  end
end
