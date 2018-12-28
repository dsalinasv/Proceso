inherited frmEtapa: TfrmEtapa
  Caption = 'Etapas'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcList: TcxPageControl
    inherited tabData: TcxTabSheet
      ExplicitLeft = 2
      ExplicitTop = 28
      ExplicitWidth = 780
      ExplicitHeight = 475
      inherited lcData: TdxLayoutControl
        inherited txtCode: TcxDBTextEdit
          Left = 72
          ExplicitLeft = 72
        end
        inherited txtName: TcxDBTextEdit
          Left = 72
          ExplicitLeft = 72
          ExplicitWidth = 121
          Width = 121
        end
        object txtContenedor: TcxDBTextEdit [2]
          Left = 72
          Top = 64
          DataBinding.DataField = 'CONTENEDOR'
          DataBinding.DataSource = dsMaster
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebs3D
          Style.HotTrack = False
          TabOrder = 2
          Width = 121
        end
        object txtDescripcion: TcxDBTextEdit [3]
          Left = 72
          Top = 91
          DataBinding.DataField = 'DESCRIPCION'
          DataBinding.DataSource = dsMaster
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebs3D
          Style.HotTrack = False
          TabOrder = 3
          Width = 698
        end
        object txtGrupo: TcxDBTextEdit [4]
          Left = 72
          Top = 118
          DataBinding.DataField = 'GRUPO'
          DataBinding.DataSource = dsMaster
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebs3D
          Style.HotTrack = False
          TabOrder = 4
          Width = 121
        end
        object chkAdjuntar: TcxDBCheckBox [5]
          Left = 72
          Top = 145
          DataBinding.DataField = 'ADJUNTAR'
          DataBinding.DataSource = dsMaster
          Properties.Alignment = taRightJustify
          Properties.ValueChecked = 1
          Properties.ValueUnchecked = 0
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebs3D
          Style.HotTrack = False
          TabOrder = 5
          Transparent = True
        end
        inherited lcDataGroup_Root: TdxLayoutGroup
          ItemIndex = 1
        end
        inherited lblName: TdxLayoutItem
          AlignHorz = ahLeft
        end
        object lblContenedor: TdxLayoutItem
          Parent = lcDataGroup_Root
          AlignHorz = ahLeft
          CaptionOptions.Text = 'Contenedor'
          Control = txtContenedor
          ControlOptions.OriginalHeight = 21
          ControlOptions.OriginalWidth = 121
          ControlOptions.ShowBorder = False
          Index = 2
        end
        object lblDescripcion: TdxLayoutItem
          Parent = lcDataGroup_Root
          CaptionOptions.Text = 'Descripci'#243'n'
          Control = txtDescripcion
          ControlOptions.OriginalHeight = 21
          ControlOptions.OriginalWidth = 121
          ControlOptions.ShowBorder = False
          Index = 3
        end
        object lblGrupo: TdxLayoutItem
          Parent = lcDataGroup_Root
          AlignHorz = ahLeft
          CaptionOptions.Text = 'Grupo'
          Control = txtGrupo
          ControlOptions.OriginalHeight = 21
          ControlOptions.OriginalWidth = 121
          ControlOptions.ShowBorder = False
          Index = 4
        end
        object lblAdjuntar: TdxLayoutItem
          Parent = lcDataGroup_Root
          AlignHorz = ahLeft
          CaptionOptions.Text = 'Adjuntar'
          Control = chkAdjuntar
          ControlOptions.OriginalHeight = 21
          ControlOptions.OriginalWidth = 21
          ControlOptions.ShowBorder = False
          Index = 5
        end
      end
    end
    inherited tabList: TcxTabSheet
      ExplicitLeft = 2
      ExplicitTop = 28
      ExplicitWidth = 780
      ExplicitHeight = 475
    end
  end
  inherited dsMaster: TDataSource
    DataSet = dmEtapa.cdsMaster
  end
  inherited imgList: TcxImageList
    FormatVersion = 1
  end
  inherited barList: TdxBarManager
    PixelsPerInch = 96
  end
end
