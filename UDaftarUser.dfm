object FDaftarUser: TFDaftarUser
  Left = 192
  Top = 124
  Width = 696
  Height = 480
  Caption = 'Daftar User'
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
        OnCellDblClick = TvDataCellDblClick
        DataController.DataSource = DM.dsUser
        DataController.Summary.DefaultGroupSummaryItems = <
          item
            Kind = skCount
            Position = spFooter
          end>
        DataController.Summary.FooterSummaryItems = <
          item
            Format = '###,##0 User'
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
          Width = 45
        end
        object TvDatan_user: TcxGridDBColumn
          Caption = 'Nama Karyawan'
          DataBinding.FieldName = 'n_user'
          Width = 150
        end
        object TvDatajabatan: TcxGridDBColumn
          Caption = 'Jabatan'
          DataBinding.FieldName = 'jabatan'
          Width = 86
        end
        object TvDatapendidikan: TcxGridDBColumn
          Caption = 'Pendidikan'
          DataBinding.FieldName = 'pendidikan'
          Visible = False
          Width = 43
        end
        object TvDatasex: TcxGridDBColumn
          Caption = 'Jenis Kelamin'
          DataBinding.FieldName = 'sex'
          Visible = False
          Width = 56
        end
        object TvDataTanggalLahir: TcxGridDBColumn
          Caption = 'Tanggal Lahir'
          DataBinding.FieldName = 'tanggal_lahir'
          Visible = False
        end
        object TvDataAlamat: TcxGridDBColumn
          DataBinding.FieldName = 'Alamat'
          Width = 127
        end
        object TvDataKontak: TcxGridDBColumn
          Caption = 'Telp/HP'
          DataBinding.FieldName = 'Kontak'
          Width = 87
        end
        object TvDataemail: TcxGridDBColumn
          Caption = 'Email'
          DataBinding.FieldName = 'email'
          Visible = False
          Width = 60
        end
        object TvDatakawin: TcxGridDBColumn
          Caption = 'Kawin'
          DataBinding.FieldName = 'kawin'
          Visible = False
        end
        object TvDataTanggal_masuk: TcxGridDBColumn
          Caption = 'Tanggal Masuk'
          DataBinding.FieldName = 'tanggal_masuk'
          Width = 76
        end
        object TvDataTanggal_Keluar: TcxGridDBColumn
          Caption = 'Tanggal Keluar'
          DataBinding.FieldName = 'tanggal_keluar'
          Visible = False
          Width = 91
        end
        object TvDataAktif: TcxGridDBColumn
          Caption = 'Aktif'
          DataBinding.FieldName = 'aktif'
          Width = 45
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
    object sbRefresh: TsSpeedButton
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
      OnClick = sbRefreshClick
      Align = alTop
      SkinData.SkinSection = 'TOOLBUTTON'
      DisabledGlyphKind = []
      ImageIndex = 4
      Images = DM.image
      Reflected = True
    end
    object sbKeluar: TsSpeedButton
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
      OnClick = sbKeluarClick
      Align = alTop
      SkinData.SkinSection = 'TOOLBUTTON'
      DisabledGlyphKind = []
      ImageIndex = 3
      Images = DM.image
      Reflected = True
    end
    object pnlButton: TsPanel
      Left = 0
      Top = 336
      Width = 150
      Height = 106
      Align = alBottom
      TabOrder = 0
      SkinData.SkinSection = 'PANEL'
      DesignSize = (
        150
        106)
      object btntambah: TsButton
        Left = 6
        Top = 9
        Width = 136
        Height = 25
        Anchors = [akBottom]
        Caption = '&Tambah Data'
        TabOrder = 0
        OnClick = btntambahClick
        SkinData.SkinSection = 'BUTTON'
      end
      object btnEdit: TsButton
        Left = 6
        Top = 41
        Width = 136
        Height = 25
        Anchors = [akBottom]
        Caption = '&Ubah Data'
        TabOrder = 1
        OnClick = btnEditClick
        SkinData.SkinSection = 'BUTTON'
      end
      object btnDuplikat: TsButton
        Left = 6
        Top = 73
        Width = 136
        Height = 25
        Anchors = [akBottom]
        Caption = '&Duplikat Data'
        TabOrder = 2
        OnClick = btnDuplikatClick
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
