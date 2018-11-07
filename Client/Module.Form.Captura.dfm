inherited frmCaptura: TfrmCaptura
  Caption = 'Captura'
  ClientHeight = 423
  ClientWidth = 926
  ExplicitWidth = 942
  ExplicitHeight = 462
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcList: TcxPageControl
    Width = 926
    Height = 367
    Properties.ActivePage = tabData
    ExplicitWidth = 926
    ExplicitHeight = 367
    ClientRectBottom = 365
    ClientRectRight = 924
    inherited tabList: TcxTabSheet
      ExplicitLeft = 2
      ExplicitTop = 28
      ExplicitWidth = 922
      ExplicitHeight = 337
      inherited grdList: TcxGrid
        Width = 922
        Height = 337
        ExplicitWidth = 922
        ExplicitHeight = 337
        inherited grdListView: TcxGridDBTableView
          object grdListViewFOLIO: TcxGridDBColumn
            Caption = 'Folio'
            DataBinding.FieldName = 'IDCAPTURA'
          end
          object grdListViewFECHA: TcxGridDBColumn
            Caption = 'Fecha'
            DataBinding.FieldName = 'FECHA'
          end
        end
      end
    end
    inherited tabData: TcxTabSheet
      ExplicitLeft = 2
      ExplicitTop = 28
      ExplicitWidth = 922
      ExplicitHeight = 337
      inherited lcData: TdxLayoutControl
        Width = 922
        Height = 337
        ExplicitWidth = 922
        ExplicitHeight = 337
        object cxDBCheckBox1: TcxDBCheckBox [0]
          Left = 36
          Top = 89
          Caption = 'cxDBCheckBox1'
          DataBinding.DataField = 'PASO1'
          DataBinding.DataSource = dsMaster
          Properties.ValueChecked = 1
          Properties.ValueUnchecked = 0
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebs3D
          Style.HotTrack = False
          TabOrder = 2
        end
        object cxDBCheckBox2: TcxDBCheckBox [1]
          Left = 10000
          Top = 10000
          Caption = 'cxDBCheckBox2'
          DataBinding.DataField = 'PASO2'
          DataBinding.DataSource = dsMaster
          Properties.ValueChecked = 1
          Properties.ValueUnchecked = 0
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebs3D
          Style.HotTrack = False
          TabOrder = 3
          Visible = False
        end
        object cxDBCheckBox3: TcxDBCheckBox [2]
          Left = 10000
          Top = 10000
          Caption = 'cxDBCheckBox3'
          DataBinding.DataField = 'PASO3'
          DataBinding.DataSource = dsMaster
          Properties.ValueChecked = 1
          Properties.ValueUnchecked = 0
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebs3D
          Style.HotTrack = False
          TabOrder = 4
          Visible = False
        end
        object cxDBCheckBox4: TcxDBCheckBox [3]
          Left = 10000
          Top = 10000
          Caption = 'cxDBCheckBox4'
          DataBinding.DataField = 'PASO4'
          DataBinding.DataSource = dsMaster
          Properties.ValueChecked = 1
          Properties.ValueUnchecked = 0
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebs3D
          Style.HotTrack = False
          TabOrder = 5
          Visible = False
        end
        object cxDBCheckBox5: TcxDBCheckBox [4]
          Left = 10000
          Top = 10000
          Caption = 'cxDBCheckBox5'
          DataBinding.DataField = 'PASO5'
          DataBinding.DataSource = dsMaster
          Properties.ValueChecked = 1
          Properties.ValueUnchecked = 0
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebs3D
          Style.HotTrack = False
          TabOrder = 6
          Visible = False
        end
        object cxDBCheckBox6: TcxDBCheckBox [5]
          Left = 10000
          Top = 10000
          Caption = 'cxDBCheckBox6'
          DataBinding.DataField = 'PASO6'
          DataBinding.DataSource = dsMaster
          Properties.ValueChecked = 1
          Properties.ValueUnchecked = 0
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebs3D
          Style.HotTrack = False
          TabOrder = 7
          Visible = False
        end
        object cxDBCheckBox7: TcxDBCheckBox [6]
          Left = 10000
          Top = 10000
          Caption = 'cxDBCheckBox7'
          DataBinding.DataField = 'PASO7'
          DataBinding.DataSource = dsMaster
          Properties.ValueChecked = 1
          Properties.ValueUnchecked = 0
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebs3D
          Style.HotTrack = False
          TabOrder = 8
          Visible = False
        end
        object cxDBCheckBox8: TcxDBCheckBox [7]
          Left = 10000
          Top = 10000
          Caption = 'cxDBCheckBox8'
          DataBinding.DataField = 'PASO8'
          DataBinding.DataSource = dsMaster
          Properties.ValueChecked = 1
          Properties.ValueUnchecked = 0
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebs3D
          Style.HotTrack = False
          TabOrder = 9
          Visible = False
        end
        object cxDBCheckBox9: TcxDBCheckBox [8]
          Left = 10000
          Top = 10000
          Caption = 'cxDBCheckBox9'
          DataBinding.DataField = 'PASO9'
          DataBinding.DataSource = dsMaster
          Properties.ValueChecked = 1
          Properties.ValueUnchecked = 0
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebs3D
          Style.HotTrack = False
          TabOrder = 10
          Visible = False
        end
        object cxDBCheckBox10: TcxDBCheckBox [9]
          Left = 10000
          Top = 10000
          Caption = 'cxDBCheckBox10'
          DataBinding.DataField = 'PASO10'
          DataBinding.DataSource = dsMaster
          Properties.ValueChecked = 1
          Properties.ValueUnchecked = 0
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebs3D
          Style.HotTrack = False
          TabOrder = 11
          Visible = False
        end
        object dtpFecha: TcxDBDateEdit [10]
          Left = 44
          Top = 10
          DataBinding.DataField = 'FECHA'
          DataBinding.DataSource = dsMaster
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebs3D
          Style.HotTrack = False
          Style.ButtonStyle = bts3D
          Style.PopupBorderStyle = epbsFrame3D
          TabOrder = 0
          Width = 121
        end
        object cxDBLookupComboBox1: TcxDBLookupComboBox [11]
          Left = 216
          Top = 10
          DataBinding.DataField = 'IDALMACEN'
          DataBinding.DataSource = dsMaster
          Properties.KeyFieldNames = 'IDALMACEN'
          Properties.ListColumns = <
            item
              FieldName = 'NAME'
            end>
          Properties.ListSource = dsAlmacen
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebs3D
          Style.HotTrack = False
          Style.ButtonStyle = bts3D
          Style.PopupBorderStyle = epbsFrame3D
          TabOrder = 1
          Width = 145
        end
        inherited lcDataGroup_Root: TdxLayoutGroup
          ItemIndex = 1
        end
        object dxLayoutGroup1: TdxLayoutGroup
          Parent = lgGlobal
          CaptionOptions.Text = 'Paso1'
          ButtonOptions.Buttons = <>
          Index = 0
        end
        object dxLayoutGroup2: TdxLayoutGroup
          Parent = lgGlobal
          CaptionOptions.Text = 'Paso2'
          ButtonOptions.Buttons = <>
          Index = 1
        end
        object dxLayoutGroup3: TdxLayoutGroup
          Parent = lgGlobal
          CaptionOptions.Text = 'Paso3'
          ButtonOptions.Buttons = <>
          Index = 2
        end
        object dxLayoutGroup4: TdxLayoutGroup
          Parent = lgGlobal
          CaptionOptions.Text = 'Paso4'
          ButtonOptions.Buttons = <>
          Index = 3
        end
        object dxLayoutGroup5: TdxLayoutGroup
          Parent = lgGlobal
          CaptionOptions.Text = 'Paso5'
          ButtonOptions.Buttons = <>
          Index = 4
        end
        object dxLayoutGroup6: TdxLayoutGroup
          Parent = lgGlobal
          CaptionOptions.Text = 'Paso6'
          ButtonOptions.Buttons = <>
          Index = 5
        end
        object dxLayoutGroup7: TdxLayoutGroup
          Parent = lgGlobal
          CaptionOptions.Text = 'Paso7'
          ButtonOptions.Buttons = <>
          Index = 6
        end
        object dxLayoutGroup8: TdxLayoutGroup
          Parent = lgGlobal
          CaptionOptions.Text = 'Paso8'
          ButtonOptions.Buttons = <>
          Index = 7
        end
        object dxLayoutGroup9: TdxLayoutGroup
          Parent = lgGlobal
          CaptionOptions.Text = 'Paso9'
          ButtonOptions.Buttons = <>
          Index = 8
        end
        object dxLayoutGroup10: TdxLayoutGroup
          Parent = lgGlobal
          CaptionOptions.Text = 'Paso10'
          ButtonOptions.Buttons = <>
          Index = 9
        end
        object dxLayoutItem1: TdxLayoutItem
          Parent = dxLayoutGroup1
          AlignHorz = ahLeft
          CaptionOptions.Text = 'cxDBCheckBox1'
          CaptionOptions.Visible = False
          Control = cxDBCheckBox1
          ControlOptions.OriginalHeight = 21
          ControlOptions.OriginalWidth = 101
          ControlOptions.ShowBorder = False
          Index = 0
        end
        object dxLayoutItem2: TdxLayoutItem
          Parent = dxLayoutGroup2
          AlignHorz = ahLeft
          CaptionOptions.Text = 'cxDBCheckBox2'
          CaptionOptions.Visible = False
          Control = cxDBCheckBox2
          ControlOptions.OriginalHeight = 21
          ControlOptions.OriginalWidth = 101
          ControlOptions.ShowBorder = False
          Index = 0
        end
        object dxLayoutItem3: TdxLayoutItem
          Parent = dxLayoutGroup3
          AlignHorz = ahLeft
          CaptionOptions.Text = 'cxDBCheckBox3'
          CaptionOptions.Visible = False
          Control = cxDBCheckBox3
          ControlOptions.OriginalHeight = 21
          ControlOptions.OriginalWidth = 101
          ControlOptions.ShowBorder = False
          Index = 0
        end
        object dxLayoutItem4: TdxLayoutItem
          Parent = dxLayoutGroup4
          AlignHorz = ahLeft
          CaptionOptions.Text = 'cxDBCheckBox4'
          CaptionOptions.Visible = False
          Control = cxDBCheckBox4
          ControlOptions.OriginalHeight = 21
          ControlOptions.OriginalWidth = 101
          ControlOptions.ShowBorder = False
          Index = 0
        end
        object dxLayoutItem5: TdxLayoutItem
          Parent = dxLayoutGroup5
          AlignHorz = ahLeft
          CaptionOptions.Text = 'cxDBCheckBox5'
          CaptionOptions.Visible = False
          Control = cxDBCheckBox5
          ControlOptions.OriginalHeight = 21
          ControlOptions.OriginalWidth = 101
          ControlOptions.ShowBorder = False
          Index = 0
        end
        object dxLayoutItem6: TdxLayoutItem
          Parent = dxLayoutGroup6
          AlignHorz = ahLeft
          CaptionOptions.Text = 'cxDBCheckBox6'
          CaptionOptions.Visible = False
          Control = cxDBCheckBox6
          ControlOptions.OriginalHeight = 21
          ControlOptions.OriginalWidth = 101
          ControlOptions.ShowBorder = False
          Index = 0
        end
        object dxLayoutItem7: TdxLayoutItem
          Parent = dxLayoutGroup7
          AlignHorz = ahLeft
          CaptionOptions.Text = 'cxDBCheckBox7'
          CaptionOptions.Visible = False
          Control = cxDBCheckBox7
          ControlOptions.OriginalHeight = 21
          ControlOptions.OriginalWidth = 101
          ControlOptions.ShowBorder = False
          Index = 0
        end
        object dxLayoutItem8: TdxLayoutItem
          Parent = dxLayoutGroup8
          AlignHorz = ahLeft
          CaptionOptions.Text = 'cxDBCheckBox8'
          CaptionOptions.Visible = False
          Control = cxDBCheckBox8
          ControlOptions.OriginalHeight = 21
          ControlOptions.OriginalWidth = 101
          ControlOptions.ShowBorder = False
          Index = 0
        end
        object dxLayoutItem9: TdxLayoutItem
          Parent = dxLayoutGroup9
          AlignHorz = ahLeft
          CaptionOptions.Text = 'cxDBCheckBox9'
          CaptionOptions.Visible = False
          Control = cxDBCheckBox9
          ControlOptions.OriginalHeight = 21
          ControlOptions.OriginalWidth = 101
          ControlOptions.ShowBorder = False
          Index = 0
        end
        object dxLayoutItem10: TdxLayoutItem
          Parent = dxLayoutGroup10
          AlignHorz = ahLeft
          CaptionOptions.Text = 'cxDBCheckBox10'
          CaptionOptions.Visible = False
          Control = cxDBCheckBox10
          ControlOptions.OriginalHeight = 21
          ControlOptions.OriginalWidth = 107
          ControlOptions.ShowBorder = False
          Index = 0
        end
        object lblFecha: TdxLayoutItem
          Parent = dxLayoutAutoCreatedGroup1
          AlignHorz = ahLeft
          AlignVert = avTop
          CaptionOptions.Text = 'Fecha'
          Control = dtpFecha
          ControlOptions.OriginalHeight = 21
          ControlOptions.OriginalWidth = 121
          ControlOptions.ShowBorder = False
          Index = 0
        end
        object lgGlobal: TdxLayoutGroup
          Parent = lcDataGroup_Root
          AlignHorz = ahClient
          AlignVert = avClient
          CaptionOptions.Text = 'New Group'
          ButtonOptions.Buttons = <>
          LayoutDirection = ldTabbed
          Index = 1
        end
        object lblAlmacen: TdxLayoutItem
          Parent = dxLayoutAutoCreatedGroup1
          AlignVert = avClient
          CaptionOptions.Text = 'Almac'#233'n'
          Control = cxDBLookupComboBox1
          ControlOptions.OriginalHeight = 21
          ControlOptions.OriginalWidth = 145
          ControlOptions.ShowBorder = False
          Index = 1
        end
        object dxLayoutAutoCreatedGroup1: TdxLayoutAutoCreatedGroup
          Parent = lcDataGroup_Root
          AlignVert = avTop
          LayoutDirection = ldHorizontal
          Index = 0
          AutoCreated = True
        end
      end
    end
  end
  inherited dsMaster: TDataSource
    DataSet = dmCaptura.cdsMaster
  end
  inherited imgList: TcxImageList
    FormatVersion = 1
  end
  inherited barList: TdxBarManager
    PixelsPerInch = 96
    inherited ToolBar: TdxBar
      ItemLinks = <
        item
          Visible = True
          ItemName = 'btnPost'
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
          ItemName = 'btnClose'
        end
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
          ItemName = 'btnPrint'
        end>
    end
  end
  inherited dsConsult: TDataSource
    DataSet = dmCaptura.cdsConsult
  end
  object dsAlmacen: TDataSource
    DataSet = dmGlobal.cdsAlmacen
    Left = 24
    Top = 112
  end
end
