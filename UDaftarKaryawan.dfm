object FDaftarKaryawan: TFDaftarKaryawan
  Left = 192
  Top = 124
  Width = 696
  Height = 480
  Caption = 'Daftar Karyawan'
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
    object grid: TcxGrid
      Left = 0
      Top = 0
      Width = 530
      Height = 442
      Align = alClient
      TabOrder = 0
      LookAndFeel.Kind = lfOffice11
      object TvData: TcxGridDBTableView
        NavigatorButtons.ConfirmDelete = False
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
    object sb_2: TsSpeedButton
      Left = 0
      Top = 90
      Width = 150
      Height = 90
      Cursor = crHandPoint
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
      Align = alTop
      SkinData.SkinSection = 'TOOLBUTTON'
      DisabledGlyphKind = []
      ImageIndex = 4
      Images = DM.image
      Reflected = True
    end
    object sb_1: TsSpeedButton
      Left = 0
      Top = 0
      Width = 150
      Height = 90
      Cursor = crHandPoint
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
      Align = alTop
      SkinData.SkinSection = 'TOOLBUTTON'
      DisabledGlyphKind = []
      ImageIndex = 3
      Images = DM.image
      Reflected = True
    end
    object spnl1: TsPanel
      Left = 0
      Top = 265
      Width = 150
      Height = 137
      Align = alBottom
      TabOrder = 0
      SkinData.SkinSection = 'PANEL'
      DesignSize = (
        150
        137)
      object B_tambah: TsButton
        Left = 6
        Top = 8
        Width = 136
        Height = 25
        Anchors = [akBottom]
        Caption = '&Tambah Data'
        TabOrder = 0
        SkinData.SkinSection = 'BUTTON'
      end
      object b_edit: TsButton
        Left = 6
        Top = 40
        Width = 136
        Height = 25
        Anchors = [akBottom]
        Caption = '&Ubah Data'
        TabOrder = 1
        SkinData.SkinSection = 'BUTTON'
      end
      object b_hapus: TsButton
        Left = 6
        Top = 72
        Width = 136
        Height = 25
        Anchors = [akBottom]
        Caption = '&Hapus Data'
        TabOrder = 2
        SkinData.SkinSection = 'BUTTON'
      end
      object b_duplikat: TsButton
        Left = 6
        Top = 104
        Width = 136
        Height = 25
        Anchors = [akBottom]
        Caption = '&Duplikat Data'
        TabOrder = 3
        SkinData.SkinSection = 'BUTTON'
      end
    end
    object p1: TsPanel
      Left = 0
      Top = 402
      Width = 150
      Height = 40
      Align = alBottom
      TabOrder = 1
      SkinData.SkinSection = 'PANEL'
      DesignSize = (
        150
        40)
      object B_property: TsButton
        Left = 6
        Top = 7
        Width = 136
        Height = 25
        Anchors = [akBottom]
        Caption = '&Property'
        TabOrder = 0
        SkinData.SkinSection = 'BUTTON'
      end
    end
  end
  object sSkinProvider1: TsSkinProvider
    AddedTitle.Font.Charset = DEFAULT_CHARSET
    AddedTitle.Font.Color = clNone
    AddedTitle.Font.Height = -11
    AddedTitle.Font.Name = 'MS Sans Serif'
    AddedTitle.Font.Style = []
    SkinData.SkinSection = 'FORM'
    TitleButtons = <>
    Left = 8
    Top = 40
  end
end
