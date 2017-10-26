object FDaftarGaji: TFDaftarGaji
  Left = 192
  Top = 124
  Caption = 'Daftar Gaji'
  ClientHeight = 359
  ClientWidth = 709
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
    Width = 559
    Height = 359
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    SkinData.SkinSection = 'CHECKBOX'
    ExplicitWidth = 530
    ExplicitHeight = 0
    object grid: TcxGrid
      Left = 0
      Top = 0
      Width = 559
      Height = 359
      Align = alClient
      TabOrder = 0
      LookAndFeel.Kind = lfOffice11
      LookAndFeel.NativeStyle = False
      ExplicitWidth = 530
      ExplicitHeight = 0
      object TvData: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        OnCellDblClick = TvDataCellDblClick
        DataController.DataSource = DM.dsGaji
        DataController.Summary.DefaultGroupSummaryItems = <
          item
            Kind = skCount
            Position = spFooter
          end>
        DataController.Summary.FooterSummaryItems = <
          item
            Format = '###,###,##0;(###,###,##0);0'
            Kind = skSum
            Column = TvDataGaji_Pokok
          end
          item
            Format = '###,###,##0;(###,###,##0);0'
            Kind = skSum
            Column = TvDataTunjangan
          end
          item
            Format = '###,###,##0;(###,###,##0);0'
            Kind = skSum
            Column = TvDataPotongan
          end
          item
            Format = '###,###,##0;(###,###,##0);0'
            Kind = skSum
            Column = TvDataTotal_Gaji
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
        object TvDataGaji_Pokok: TcxGridDBColumn
          Caption = 'Gaji Pokok'
          DataBinding.FieldName = 'Gaji_Pokok'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DisplayFormat = '###,###,##0;(###,###,##0);0'
        end
        object TvDataTunjangan: TcxGridDBColumn
          DataBinding.FieldName = 'Tunjangan'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DisplayFormat = '###,###,##0;(###,###,##0);0'
        end
        object TvDataPotongan: TcxGridDBColumn
          DataBinding.FieldName = 'Potongan'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DisplayFormat = '###,###,##0;(###,###,##0);0'
        end
        object TvDataTotal_Gaji: TcxGridDBColumn
          Caption = 'Total Gaji'
          DataBinding.FieldName = 'Total_Gaji'
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
    Left = 559
    Top = 0
    Width = 150
    Height = 359
    Align = alRight
    BevelOuter = bvNone
    TabOrder = 1
    SkinData.SkinSection = 'PANEL'
    ExplicitLeft = -34
    ExplicitHeight = 0
    object sbRefresh: TsSpeedButton
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
      OnClick = sbRefreshClick
      SkinData.SkinSection = 'TOOLBUTTON'
      Images = DM.image
      ImageIndex = 4
      Reflected = True
    end
    object sbKeluar: TsSpeedButton
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
      OnClick = sbKeluarClick
      SkinData.SkinSection = 'TOOLBUTTON'
      Images = DM.image
      ImageIndex = 3
      Reflected = True
    end
    object pnlPeriode: TsPanel
      Left = 0
      Top = 253
      Width = 150
      Height = 106
      Align = alBottom
      TabOrder = 0
      SkinData.SkinSection = 'PANEL'
      ExplicitTop = -106
      object l_1: TsLabel
        Left = 4
        Top = 5
        Width = 27
        Height = 13
        Caption = 'Bulan'
      end
      object sLabel1: TsLabel
        Left = 8
        Top = 48
        Width = 31
        Height = 13
        Caption = 'Tahun'
      end
      object cbBulan: TsComboBox
        Left = 8
        Top = 24
        Width = 137
        Height = 21
        Alignment = taLeftJustify
        SkinData.SkinSection = 'COMBOBOX'
        VerticalAlignment = taAlignTop
        Style = csDropDownList
        ItemIndex = -1
        TabOrder = 0
        Items.Strings = (
          'Januari'
          'Februari'
          'Maret'
          'April'
          'Mei'
          'Juni'
          'Juli'
          'Agustus'
          'September'
          'Oktober'
          'Nopember'
          'Desember')
      end
      object edTahun: TsEdit
        Left = 8
        Top = 64
        Width = 137
        Height = 21
        TabOrder = 1
        SkinData.SkinSection = 'EDIT'
      end
    end
    object pnlButton: TsPanel
      Left = 0
      Top = 181
      Width = 150
      Height = 72
      Align = alBottom
      TabOrder = 1
      SkinData.SkinSection = 'PANEL'
      ExplicitTop = -178
      DesignSize = (
        150
        72)
      object btnEdit: TsButton
        Left = 6
        Top = 39
        Width = 136
        Height = 25
        Anchors = [akBottom]
        Caption = '&Ubah Data'
        TabOrder = 0
        OnClick = btnEditClick
        SkinData.SkinSection = 'BUTTON'
      end
      object btnCetak: TsButton
        Left = 6
        Top = 7
        Width = 136
        Height = 25
        Anchors = [akBottom]
        Caption = '&Cetak Data'
        TabOrder = 1
        OnClick = btnCetakClick
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
