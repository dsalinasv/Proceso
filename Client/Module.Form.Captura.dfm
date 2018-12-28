inherited frmCaptura: TfrmCaptura
  Caption = 'Captura de etapa'
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 13
  object grdAdjuntos: TcxGrid [0]
    Left = 0
    Top = 56
    Width = 784
    Height = 505
    Align = alClient
    TabOrder = 4
    object grdAdjuntosDBTableView1: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      Navigator.Buttons.First.Enabled = False
      Navigator.Buttons.First.Visible = False
      Navigator.Buttons.PriorPage.Enabled = False
      Navigator.Buttons.PriorPage.Visible = False
      Navigator.Buttons.Prior.Enabled = False
      Navigator.Buttons.Prior.Visible = False
      Navigator.Buttons.Next.Enabled = False
      Navigator.Buttons.Next.Visible = False
      Navigator.Buttons.NextPage.Enabled = False
      Navigator.Buttons.NextPage.Visible = False
      Navigator.Buttons.Last.Enabled = False
      Navigator.Buttons.Last.Visible = False
      Navigator.Buttons.Insert.Enabled = False
      Navigator.Buttons.Insert.Visible = False
      Navigator.Buttons.Append.Visible = True
      Navigator.Buttons.Edit.Enabled = False
      Navigator.Buttons.Edit.Visible = False
      Navigator.Buttons.Refresh.Enabled = False
      Navigator.Buttons.Refresh.Visible = False
      Navigator.Buttons.SaveBookmark.Enabled = False
      Navigator.Buttons.SaveBookmark.Visible = False
      Navigator.Buttons.GotoBookmark.Enabled = False
      Navigator.Buttons.GotoBookmark.Visible = False
      Navigator.Buttons.Filter.Enabled = False
      Navigator.Buttons.Filter.Visible = False
      Navigator.Visible = True
      DataController.DataSource = dsDocs
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.Appending = True
      OptionsView.GroupByBox = False
      object grdAdjuntosDBTableView1NAME: TcxGridDBColumn
        Caption = 'Nombre'
        DataBinding.FieldName = 'NAME'
      end
      object grdAdjuntosDBTableView1DOC: TcxGridDBColumn
        Caption = 'Documento'
        DataBinding.FieldName = 'DOC'
        PropertiesClassName = 'TcxBlobEditProperties'
        Properties.BlobEditKind = bekBlob
        Properties.OnButtonClick = cxGrid1DBTableView1DOCPropertiesButtonClick
      end
    end
    object grdAdjuntosLevel1: TcxGridLevel
      GridView = grdAdjuntosDBTableView1
    end
  end
  inherited imgList: TcxImageList
    FormatVersion = 1
  end
  inherited actList: TActionList
    object actSiguiente: TAction
      Caption = 'Avanzar'
      ImageIndex = 7
      OnExecute = actSiguienteExecute
    end
  end
  inherited barList: TdxBarManager
    PixelsPerInch = 96
    inherited ToolBar: TdxBar
      ItemLinks = <
        item
          Visible = True
          ItemName = 'btnSiguiente'
        end
        item
          Visible = True
          ItemName = 'btnClose'
        end>
    end
    object btnSiguiente: TdxBarLargeButton
      Action = actSiguiente
      Category = 0
      AutoGrayScale = False
    end
  end
  object dsDocs: TDataSource
    DataSet = dmCaptura.cdsDocs
    Left = 24
    Top = 56
  end
  object dlgOpen: TOpenDialog
    Left = 240
    Top = 8
  end
end
