object FDaftarKaryawan: TFDaftarKaryawan
  Left = 192
  Top = 124
  Caption = 'Daftar Karyawan'
  ClientHeight = 442
  ClientWidth = 680
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poScreenCenter
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object sPanel2: TsPanel
    Left = 0
    Top = 0
    Width = 530
    Height = 442
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    SkinData.SkinSection = 'CHECKBOX'
    ExplicitHeight = 441
    object grid: TcxGrid
      Left = 0
      Top = 0
      Width = 530
      Height = 441
      Align = alClient
      TabOrder = 0
      LookAndFeel.Kind = lfOffice11
      LookAndFeel.NativeStyle = False
      object TvData: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        OnCellDblClick = TvDataCellDblClick
        OnCustomDrawCell = TvDataCustomDrawCell
        DataController.DataSource = DM.dsKaryawan
        DataController.Summary.DefaultGroupSummaryItems = <
          item
            Kind = skCount
            Position = spFooter
          end>
        DataController.Summary.FooterSummaryItems = <
          item
            Format = '###,##0 Karyawan'
            Kind = skCount
            Column = TvDatan_user
          end>
        DataController.Summary.SummaryGroups = <>
        OptionsBehavior.CellHints = True
        OptionsBehavior.DragDropText = True
        OptionsBehavior.IncSearch = True
        OptionsCustomize.ColumnsQuickCustomization = True
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.MultiSelect = True
        OptionsView.NoDataToDisplayInfoText = '<TIDAK ADA DATA YANG DAPAT DITAMPILKAN>'
        OptionsView.ColumnAutoWidth = True
        OptionsView.Footer = True
        OptionsView.GroupByBox = False
        object TvDatakd_user: TcxGridDBColumn
          Caption = 'Id Karyawan'
          DataBinding.FieldName = 'kd_user'
          Width = 64
        end
        object TvDatan_user: TcxGridDBColumn
          Caption = 'Nama Karyawan'
          DataBinding.FieldName = 'n_user'
          Width = 245
        end
        object TvDataAlamat: TcxGridDBColumn
          DataBinding.FieldName = 'Alamat'
          Width = 135
        end
        object TvDataKontak: TcxGridDBColumn
          DataBinding.FieldName = 'Kontak'
          Width = 114
        end
        object TvDataCheckClock: TcxGridDBColumn
          Caption = 'Check Clock'
          DataBinding.FieldName = 'CheckClock'
          Width = 114
        end
      end
      object lvData: TcxGridLevel
        GridView = TvData
      end
    end
  end
  object sPanel1: TsPanel
    Left = 530
    Top = 0
    Width = 150
    Height = 442
    Align = alRight
    BevelOuter = bvNone
    TabOrder = 1
    SkinData.SkinSection = 'PANEL'
    ExplicitHeight = 441
    object sb_2: TsSpeedButton
      Left = 0
      Top = 90
      Width = 150
      Height = 90
      Cursor = crHandPoint
      Align = alTop
      Caption = 'Refresh'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Rockwell'
      Font.Style = [fsBold]
      Layout = blGlyphTop
      ParentFont = False
      Spacing = 0
      OnClick = sb_2Click
      SkinData.SkinSection = 'TOOLBUTTON'
      Images = DM.image
      ImageIndex = 4
      Reflected = True
    end
    object sb_1: TsSpeedButton
      Left = 0
      Top = 0
      Width = 150
      Height = 90
      Cursor = crHandPoint
      Align = alTop
      Caption = 'Selesai'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Rockwell'
      Font.Style = [fsBold]
      Layout = blGlyphTop
      ParentFont = False
      Spacing = 0
      OnClick = sb_1Click
      SkinData.SkinSection = 'TOOLBUTTON'
      Images = DM.image
      ImageIndex = 3
      Reflected = True
    end
    object spnl1: TsPanel
      Left = 0
      Top = 351
      Width = 150
      Height = 90
      Align = alBottom
      TabOrder = 0
      SkinData.SkinSection = 'PANEL'
      DesignSize = (
        150
        90)
      object btnRegister: TsButton
        Left = 6
        Top = 41
        Width = 136
        Height = 40
        Anchors = [akBottom]
        Caption = '&Register'#13#10'Sidik Jari'
        TabOrder = 0
        OnClick = btnRegisterClick
        SkinData.SkinSection = 'BUTTON'
      end
      object btnDaftarHadir: TsButton
        Left = 6
        Top = 9
        Width = 136
        Height = 25
        Anchors = [akBottom]
        Caption = 'Daftar Hadir'
        TabOrder = 1
        OnClick = btnDaftarHadirClick
        SkinData.SkinSection = 'BUTTON'
      end
    end
  end
  object sSkinProvider1: TsSkinProvider
    SkinData.SkinSection = 'FORM'
    TitleButtons = <>
    Left = 8
    Top = 40
  end
end
