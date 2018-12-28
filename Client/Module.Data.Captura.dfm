inherited dmCaptura: TdmCaptura
  inherited dspMaster: TDSProviderConnection
    ServerClassName = 'TsmCaptura'
    SQLConnection = dmGlobal.cntData
  end
  inherited cdsMaster: TClientDataSet
    Params = <
      item
        DataType = ftUnknown
        Name = 'FOLIO'
        ParamType = ptInput
      end>
  end
  object cdsDocs: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftString
        Name = 'FOLIO'
        ParamType = ptInput
        Size = 10
      end
      item
        DataType = ftInteger
        Name = 'ETAPA'
        ParamType = ptInput
      end>
    ProviderName = 'dspDocs'
    RemoteServer = dspMaster
    AfterInsert = cdsDocsAfterInsert
    Left = 88
    Top = 64
    object cdsDocsIDCAPTURA: TStringField
      FieldName = 'IDCAPTURA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 38
    end
    object cdsDocsFOLIO: TStringField
      FieldName = 'FOLIO'
      Size = 10
    end
    object cdsDocsETAPA: TIntegerField
      FieldName = 'ETAPA'
    end
    object cdsDocsNAME: TStringField
      FieldName = 'NAME'
      Size = 50
    end
    object cdsDocsDOC: TBlobField
      FieldName = 'DOC'
    end
  end
end
