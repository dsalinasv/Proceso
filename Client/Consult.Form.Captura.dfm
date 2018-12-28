inherited frmCapturaConsult: TfrmCapturaConsult
  Caption = 'Capturas cerradas'
  ExplicitTop = -4
  PixelsPerInch = 96
  TextHeight = 13
  object grdCaptura: TcxGrid [0]
    Left = 0
    Top = 56
    Width = 784
    Height = 505
    Align = alClient
    TabOrder = 4
    object grdCapturaTableView: TcxGridDBTableView
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
      Navigator.Buttons.Append.Enabled = False
      Navigator.Buttons.Delete.Enabled = False
      Navigator.Buttons.Delete.Visible = False
      Navigator.Buttons.Edit.Enabled = False
      Navigator.Buttons.Edit.Visible = False
      Navigator.Buttons.Post.Enabled = False
      Navigator.Buttons.Post.Visible = False
      Navigator.Buttons.Cancel.Enabled = False
      Navigator.Buttons.Cancel.Visible = False
      Navigator.Buttons.SaveBookmark.Enabled = False
      Navigator.Buttons.SaveBookmark.Visible = False
      Navigator.Buttons.GotoBookmark.Enabled = False
      Navigator.Buttons.GotoBookmark.Visible = False
      Navigator.Buttons.Filter.Enabled = False
      Navigator.Buttons.Filter.Visible = False
      Navigator.Visible = True
      DataController.DataSource = dsMaster
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsSelection.MultiSelect = True
      OptionsView.GroupByBox = False
      object grdCapturaTableViewFOLIO: TcxGridDBColumn
        Caption = 'Folio'
        DataBinding.FieldName = 'FOLIO'
        Width = 50
      end
      object grdCapturaTableViewIDALMACEN: TcxGridDBColumn
        Caption = 'Almacen'
        DataBinding.FieldName = 'IDALMACEN'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.KeyFieldNames = 'CODE'
        Properties.ListColumns = <
          item
            FieldName = 'DESCRIPCION'
          end>
        Properties.ListSource = dsAlmacen
        Width = 200
      end
      object grdCapturaTableViewFECHA: TcxGridDBColumn
        Caption = 'Fecha'
        DataBinding.FieldName = 'FECHA'
        Width = 80
      end
      object grdCapturaTableViewETAPA: TcxGridDBColumn
        Caption = 'Etapa'
        DataBinding.FieldName = 'ETAPA'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.KeyFieldNames = 'IDETAPA'
        Properties.ListColumns = <
          item
            FieldName = 'DESCRIPCION'
          end>
        Properties.ListSource = dsEtapa
        Width = 100
      end
      object grdCapturaTableViewAVANCE: TcxGridDBColumn
        Caption = 'Avance'
        DataBinding.FieldName = 'ETAPA'
        PropertiesClassName = 'TcxProgressBarProperties'
        Properties.BeginColor = 54056
        Properties.Max = 10.000000000000000000
        Properties.OverloadValue = 8.000000000000000000
        Properties.ShowText = False
        Width = 200
      end
    end
    object grdCapturaLevel1: TcxGridLevel
      GridView = grdCapturaTableView
    end
  end
  inherited dsMaster: TDataSource
    DataSet = dmCapturaConsult.cdsMaster
  end
  inherited imgList: TcxImageList
    FormatVersion = 1
  end
  inherited actList: TActionList
    object actConsult: TAction
      Caption = 'Consultar'
      ImageIndex = 8
      OnExecute = actConsultExecute
    end
  end
  inherited barList: TdxBarManager
    PixelsPerInch = 96
    inherited ToolBar: TdxBar
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dtpFechaInicial'
        end
        item
          Visible = True
          ItemName = 'dtpFechaFinal'
        end
        item
          Visible = True
          ItemName = 'btnConsult'
        end
        item
          Visible = True
          ItemName = 'btnClose'
        end>
    end
    object dtpFechaInicial: TdxBarDateCombo
      Caption = 'Fecha inicial:'
      Category = 0
      Hint = 'Fecha inicial:'
      Visible = ivAlways
      ShowCaption = True
      ShowDayText = False
    end
    object dtpFechaFinal: TdxBarDateCombo
      Caption = 'Fecha final:'
      Category = 0
      Hint = 'Fecha final:'
      Visible = ivAlways
      ShowCaption = True
      ShowDayText = False
    end
    object btnConsult: TdxBarLargeButton
      Action = actConsult
      Category = 0
      AutoGrayScale = False
    end
  end
  object dsEtapa: TDataSource
    DataSet = dmGlobal.cdsEtapa
    Left = 384
    Top = 384
  end
  object dsAlmacen: TDataSource
    DataSet = dmGlobal.cdsAlmacen
    Left = 384
    Top = 336
  end
end
