inherited frmList: TfrmList
  Caption = 'frmList'
  PixelsPerInch = 96
  TextHeight = 13
  object pcList: TcxPageControl [0]
    Left = 0
    Top = 56
    Width = 784
    Height = 505
    Align = alClient
    TabOrder = 0
    Properties.ActivePage = tabData
    Properties.CustomButtons.Buttons = <>
    ClientRectBottom = 503
    ClientRectLeft = 2
    ClientRectRight = 782
    ClientRectTop = 28
    object tabData: TcxTabSheet
      Caption = 'Datos'
      ImageIndex = 1
      object lcData: TdxLayoutControl
        Left = 0
        Top = 0
        Width = 780
        Height = 475
        Align = alClient
        ParentBackground = True
        TabOrder = 0
        Transparent = True
        object txtCode: TcxDBTextEdit
          Left = 52
          Top = 10
          DataBinding.DataField = 'CODE'
          DataBinding.DataSource = dsMaster
          Properties.ReadOnly = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebs3D
          Style.HotTrack = False
          TabOrder = 0
          Width = 121
        end
        object txtName: TcxDBTextEdit
          Left = 52
          Top = 37
          DataBinding.DataField = 'NAME'
          DataBinding.DataSource = dsMaster
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebs3D
          Style.HotTrack = False
          TabOrder = 1
          Width = 718
        end
        object lcDataGroup_Root: TdxLayoutGroup
          AlignHorz = ahClient
          AlignVert = avClient
          ButtonOptions.Buttons = <>
          Hidden = True
          ShowBorder = False
          Index = -1
        end
        object lblCode: TdxLayoutItem
          Parent = lcDataGroup_Root
          AlignHorz = ahLeft
          AlignVert = avTop
          CaptionOptions.Text = 'C'#243'digo'
          Control = txtCode
          ControlOptions.OriginalHeight = 21
          ControlOptions.OriginalWidth = 121
          ControlOptions.ShowBorder = False
          Index = 0
        end
        object lblName: TdxLayoutItem
          Parent = lcDataGroup_Root
          CaptionOptions.Text = 'Nombre'
          Control = txtName
          ControlOptions.OriginalHeight = 21
          ControlOptions.OriginalWidth = 121
          ControlOptions.ShowBorder = False
          Index = 1
        end
      end
    end
    object tabList: TcxTabSheet
      Caption = 'Listado'
      ImageIndex = 0
      object grdList: TcxGrid
        Left = 0
        Top = 0
        Width = 780
        Height = 475
        Align = alClient
        TabOrder = 0
        object grdListView: TcxGridDBTableView
          Navigator.Buttons.ConfirmDelete = True
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
          Navigator.Buttons.Append.Visible = True
          Navigator.Buttons.SaveBookmark.Enabled = False
          Navigator.Buttons.SaveBookmark.Visible = False
          Navigator.Buttons.GotoBookmark.Enabled = False
          Navigator.Buttons.GotoBookmark.Visible = False
          Navigator.Buttons.Filter.Enabled = False
          Navigator.Buttons.Filter.Visible = False
          OnCellDblClick = grdListViewCellDblClick
          DataController.DataSource = dsMaster
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsBehavior.AlwaysShowEditor = True
          OptionsBehavior.FocusCellOnTab = True
          OptionsBehavior.GoToNextCellOnEnter = True
          OptionsBehavior.FocusCellOnCycle = True
          OptionsData.Appending = True
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsSelection.MultiSelect = True
          OptionsSelection.CellMultiSelect = True
          OptionsSelection.HideFocusRectOnExit = False
          OptionsSelection.InvertSelect = False
          OptionsView.ShowEditButtons = gsebAlways
          OptionsView.GroupByBox = False
          OptionsView.Indicator = True
          object grdListViewCODE: TcxGridDBColumn
            Caption = 'C'#243'digo'
            DataBinding.FieldName = 'CODE'
          end
          object grdListViewNAME: TcxGridDBColumn
            Caption = 'Nombre'
            DataBinding.FieldName = 'NAME'
          end
        end
        object grdListLevel: TcxGridLevel
          GridView = grdListView
        end
      end
    end
  end
  inherited imgList: TcxImageList
    FormatVersion = 1
  end
  inherited actList: TActionList
    object actInsert: TDataSetInsert [0]
      Category = 'Dataset'
      Caption = '&Nuevo'
      Hint = 'Insert'
      ImageIndex = 0
      ShortCut = 113
      DataSource = dsMaster
    end
    object actPost: TDataSetPost [1]
      Category = 'Dataset'
      Caption = '&Guadar'
      Hint = 'Post'
      ImageIndex = 1
      ShortCut = 114
    end
    object actEdit: TDataSetEdit [2]
      Category = 'Dataset'
      Caption = '&Modificar'
      Hint = 'Edit'
      ImageIndex = 2
      ShortCut = 115
      DataSource = dsMaster
    end
    object actCancel: TDataSetCancel [3]
      Category = 'Dataset'
      Caption = '&Cancelar'
      Hint = 'Cancel'
      ImageIndex = 3
      ShortCut = 116
      DataSource = dsMaster
    end
    object actDelete: TDataSetDelete [4]
      Category = 'Dataset'
      Caption = '&Eliminar'
      Hint = 'Delete'
      ImageIndex = 4
      ShortCut = 117
      DataSource = dsMaster
    end
    object actPrior: TDataSetPrior [5]
      Category = 'Dataset'
      Caption = '&Anterior'
      Hint = 'Prior'
      ImageIndex = 6
      ShortCut = 118
    end
    object actNext: TDataSetNext [6]
      Category = 'Dataset'
      Caption = '&Siguiente'
      Hint = 'Next'
      ImageIndex = 7
      ShortCut = 119
    end
  end
  inherited barList: TdxBarManager
    PixelsPerInch = 96
    inherited ToolBar: TdxBar
      AllowClose = True
      ItemLinks = <
        item
          Visible = True
          ItemName = 'btnInsert'
        end
        item
          Visible = True
          ItemName = 'btnPost'
        end
        item
          Visible = True
          ItemName = 'btnEdit'
        end
        item
          Visible = True
          ItemName = 'btnCancel'
        end
        item
          Visible = True
          ItemName = 'btnDelete'
        end
        item
          Visible = True
          ItemName = 'btnPrior'
        end
        item
          Visible = True
          ItemName = 'btnNext'
        end
        item
          Visible = True
          ItemName = 'btnClose'
        end>
    end
    object btnInsert: TdxBarLargeButton [1]
      Action = actInsert
      Category = 0
      AutoGrayScale = False
    end
    object btnPost: TdxBarLargeButton [2]
      Action = actPost
      Category = 0
      AutoGrayScale = False
    end
    object btnEdit: TdxBarLargeButton [3]
      Action = actEdit
      Category = 0
      AutoGrayScale = False
    end
    object btnCancel: TdxBarLargeButton [4]
      Action = actCancel
      Category = 0
      AutoGrayScale = False
    end
    object btnDelete: TdxBarLargeButton [5]
      Action = actDelete
      Category = 0
      AutoGrayScale = False
    end
    object btnCerrar: TdxBarLargeButton [6]
      Caption = 'Cerrar'
      Category = 0
      Visible = ivAlways
      ShortCut = 27
      AutoGrayScale = False
      LargeImageIndex = 5
      ShowCaption = False
    end
    object btnPrior: TdxBarLargeButton [7]
      Action = actPrior
      Category = 0
      AutoGrayScale = False
    end
    object btnNext: TdxBarLargeButton [8]
      Action = actNext
      Category = 0
      AutoGrayScale = False
    end
  end
end
