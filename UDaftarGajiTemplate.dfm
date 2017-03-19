object FDaftarGajiTemplate: TFDaftarGajiTemplate
  Left = 192
  Top = 124
  Width = 696
  Height = 480
  Caption = 'Daftar Template Gaji'
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
    Height = 441
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    SkinData.SkinSection = 'CHECKBOX'
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
        NavigatorButtons.ConfirmDelete = False
        OnCellDblClick = TvDataCellDblClick
        DataController.DataSource = DM.dsGajiTemp
        DataController.Summary.DefaultGroupSummaryItems = <
          item
            Kind = skCount
            Position = spFooter
          end>
        DataController.Summary.FooterSummaryItems = <
          item
            Format = '###,###,##0;(###,###,##0);0'
            Kind = skSum
          end
          item
            Format = '###,###,##0;(###,###,##0);0'
            Kind = skSum
          end
          item
            Format = '###,###,##0;(###,###,##0);0'
            Kind = skSum
          end
          item
            Format = '###,###,##0;(###,###,##0);0'
            Kind = skSum
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
        object TvDatapokok: TcxGridDBColumn
          Caption = 'Pokok'
          DataBinding.FieldName = 'pokok'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DisplayFormat = '###,###,##0;(###,###,##0);0'
        end
        object TvDatajam_hadir: TcxGridDBColumn
          Caption = 'Jam Hadir'
          DataBinding.FieldName = 'jam_hadir'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DisplayFormat = '###,###,##0;(###,###,##0);0'
        end
        object TvDatatransport: TcxGridDBColumn
          Caption = 'Transport'
          DataBinding.FieldName = 'transport'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DisplayFormat = '###,###,##0;(###,###,##0);0'
        end
        object TvDatakonsumsi: TcxGridDBColumn
          Caption = 'Konsumsi'
          DataBinding.FieldName = 'konsumsi'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DisplayFormat = '###,###,##0;(###,###,##0);0'
        end
        object TvDatajabatan: TcxGridDBColumn
          Caption = 'Jabatan'
          DataBinding.FieldName = 'jabatan'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DisplayFormat = '###,###,##0;(###,###,##0);0'
        end
        object TvDatamasa_kerja: TcxGridDBColumn
          Caption = 'Masa Kerja'
          DataBinding.FieldName = 'masa_kerja'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DisplayFormat = '###,###,##0;(###,###,##0);0'
        end
        object TvDatakesehatan: TcxGridDBColumn
          Caption = 'Kesehatan'
          DataBinding.FieldName = 'kesehatan'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DisplayFormat = '###,###,##0;(###,###,##0);0'
        end
        object TvDataangsuran_duta: TcxGridDBColumn
          Caption = 'Angsuran Duta'
          DataBinding.FieldName = 'angsuran_duta'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DisplayFormat = '###,###,##0;(###,###,##0);0'
        end
        object TvDataangsuran_bank: TcxGridDBColumn
          Caption = 'Angsuran Bank'
          DataBinding.FieldName = 'angsuran_bank'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DisplayFormat = '###,###,##0;(###,###,##0);0'
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
    Height = 441
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
      Top = 401
      Width = 150
      Height = 40
      Align = alBottom
      TabOrder = 0
      SkinData.SkinSection = 'PANEL'
      DesignSize = (
        150
        40)
      object btnEdit: TsButton
        Left = 6
        Top = 7
        Width = 136
        Height = 25
        Anchors = [akBottom]
        Caption = '&Ubah Data'
        TabOrder = 0
        OnClick = btnEditClick
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
