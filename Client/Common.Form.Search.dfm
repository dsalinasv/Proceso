inherited frmSearch: TfrmSearch
  Caption = 'B'#250'squeda'
  ClientHeight = 461
  ClientWidth = 884
  Constraints.MinHeight = 500
  Constraints.MinWidth = 900
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyUp = FormKeyUp
  OnShow = FormShow
  ExplicitTop = -58
  ExplicitWidth = 900
  ExplicitHeight = 500
  PixelsPerInch = 96
  TextHeight = 13
  object txtFilter: TcxTextEdit
    Left = 0
    Top = 0
    Align = alTop
    ParentFont = False
    Properties.CharCase = ecUpperCase
    Properties.OnChange = txtFilterPropertiesChange
    TabOrder = 0
    Width = 884
  end
  object gpFotter: TGridPanel
    Left = 0
    Top = 432
    Width = 884
    Height = 29
    Align = alBottom
    ColumnCollection = <
      item
        Value = 12.500000000000000000
      end
      item
        Value = 12.500000000000000000
      end
      item
        Value = 50.000000000000000000
      end
      item
        Value = 12.500000000000000000
      end
      item
        Value = 12.500000000000000000
      end>
    ControlCollection = <
      item
        Column = 2
        Control = lblBusqueda
        Row = 0
      end
      item
        Column = 3
        Control = btnOk
        Row = 0
      end
      item
        Column = 4
        Control = btnCancel
        Row = 0
      end>
    RowCollection = <
      item
        Value = 100.000000000000000000
      end>
    TabOrder = 1
    object lblBusqueda: TcxLabel
      Left = 221
      Top = 1
      Align = alClient
      Caption = 'B'#250'squeda por nombre'
      Properties.Alignment.Horz = taCenter
      Properties.Alignment.Vert = taVCenter
      Transparent = True
      AnchorX = 442
      AnchorY = 15
    end
    object btnOk: TcxButton
      Left = 662
      Top = 1
      Width = 100
      Height = 25
      Caption = 'Aceptar'
      Default = True
      ModalResult = 1
      TabOrder = 1
      TabStop = False
    end
    object btnCancel: TcxButton
      Left = 772
      Top = 1
      Width = 100
      Height = 25
      Cancel = True
      Caption = 'Cancelar'
      ModalResult = 2
      TabOrder = 2
      TabStop = False
    end
  end
  object grdSearch: TcxGrid
    Left = 0
    Top = 21
    Width = 884
    Height = 411
    Align = alClient
    TabOrder = 2
    TabStop = False
    object grdSearchView: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      OnCellDblClick = grdSearchViewCellDblClick
      DataController.DataSource = dsSearch
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.AlwaysShowEditor = True
      OptionsCustomize.ColumnsQuickCustomization = True
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsSelection.MultiSelect = True
      OptionsSelection.HideFocusRectOnExit = False
      OptionsSelection.InvertSelect = False
      OptionsSelection.UnselectFocusedRecordOnExit = False
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      OnColumnHeaderClick = grdSearchViewColumnHeaderClick
    end
    object grdSearchLevel: TcxGridLevel
      GridView = grdSearchView
    end
  end
  object dsSearch: TDataSource
    DataSet = dmSearch.cdsGetByField
    Left = 136
    Top = 72
  end
  object actList: TActionList
    Left = 232
    Top = 72
  end
end
