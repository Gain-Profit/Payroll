object FDaftarHadir: TFDaftarHadir
  Left = 192
  Top = 124
  Width = 696
  Height = 480
  Caption = 'Daftar Hadir'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlSamping: TsPanel
    Left = 530
    Top = 0
    Width = 150
    Height = 442
    Align = alRight
    BevelOuter = bvNone
    TabOrder = 0
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
    object p1: TsPanel
      Left = 0
      Top = 352
      Width = 150
      Height = 90
      Align = alBottom
      TabOrder = 0
      SkinData.SkinSection = 'PANEL'
      object l_1: TsLabel
        Left = 4
        Top = 5
        Width = 31
        Height = 13
        Caption = 'Mulai :'
      end
      object l_2: TsLabel
        Left = 4
        Top = 45
        Width = 41
        Height = 13
        Caption = 'Sampai :'
      end
      object deMulai: TsDateEdit
        Left = 4
        Top = 21
        Width = 138
        Height = 21
        AutoSize = False
        EditMask = '!99/99/9999;1; '
        MaxLength = 10
        TabOrder = 0
        Text = '  /  /    '
        BoundLabel.Indent = 0
        BoundLabel.Font.Charset = DEFAULT_CHARSET
        BoundLabel.Font.Color = clWindowText
        BoundLabel.Font.Height = -11
        BoundLabel.Font.Name = 'MS Sans Serif'
        BoundLabel.Font.Style = []
        BoundLabel.Layout = sclLeft
        BoundLabel.MaxWidth = 0
        BoundLabel.UseSkinColor = True
        SkinData.SkinSection = 'EDIT'
        GlyphMode.Blend = 0
        GlyphMode.Grayed = False
      end
      object deSampai: TsDateEdit
        Left = 4
        Top = 61
        Width = 138
        Height = 21
        AutoSize = False
        EditMask = '!99/99/9999;1; '
        MaxLength = 10
        TabOrder = 1
        Text = '  /  /    '
        BoundLabel.Indent = 0
        BoundLabel.Font.Charset = DEFAULT_CHARSET
        BoundLabel.Font.Color = clWindowText
        BoundLabel.Font.Height = -11
        BoundLabel.Font.Name = 'MS Sans Serif'
        BoundLabel.Font.Style = []
        BoundLabel.Layout = sclLeft
        BoundLabel.MaxWidth = 0
        BoundLabel.UseSkinColor = True
        SkinData.SkinSection = 'EDIT'
        GlyphMode.Blend = 0
        GlyphMode.Grayed = False
      end
    end
  end
  object pnlUtama: TsPanel
    Left = 0
    Top = 0
    Width = 530
    Height = 442
    Align = alClient
    TabOrder = 1
    SkinData.SkinSection = 'PANEL'
    object grid: TcxGrid
      Left = 1
      Top = 65
      Width = 528
      Height = 376
      Align = alClient
      TabOrder = 0
      LookAndFeel.Kind = lfOffice11
      LookAndFeel.NativeStyle = False
      object TvData: TcxGridDBTableView
        NavigatorButtons.ConfirmDelete = False
        DataController.DataSource = dsDaftarHadir
        DataController.Summary.DefaultGroupSummaryItems = <
          item
            Kind = skCount
            Position = spFooter
          end>
        DataController.Summary.FooterSummaryItems = <
          item
            Format = '###,##0'
            Kind = skSum
            Column = TvDatajam
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
        object TvDatacheckin_time: TcxGridDBColumn
          Caption = 'Check IN'
          DataBinding.FieldName = 'checkin_time'
          Width = 160
        end
        object TvDatacheckout_time: TcxGridDBColumn
          Caption = 'Check Out'
          DataBinding.FieldName = 'checkout_time'
          Width = 160
        end
        object TvDataTotal: TcxGridDBColumn
          Caption = 'Total'
          DataBinding.FieldName = 'TOTAL'
          Width = 130
        end
        object TvDatajam: TcxGridDBColumn
          Caption = 'Jam'
          DataBinding.FieldName = 'jam'
          Width = 40
        end
        object TvDataket: TcxGridDBColumn
          Caption = 'Keterangan'
          DataBinding.FieldName = 'keterangan'
          Width = 156
        end
      end
      object lvData: TcxGridLevel
        GridView = TvData
      end
    end
    object pnlAtas: TsPanel
      Left = 1
      Top = 1
      Width = 528
      Height = 64
      Align = alTop
      TabOrder = 1
      SkinData.SkinSection = 'PANEL'
      object lbl1: TsLabel
        Left = 8
        Top = 8
        Width = 61
        Height = 13
        Caption = 'ID Karyawan'
      end
      object lbl2: TsLabel
        Left = 8
        Top = 32
        Width = 78
        Height = 13
        Caption = 'Nama Karyawan'
      end
      object edID: TsEdit
        Left = 96
        Top = 8
        Width = 137
        Height = 21
        ReadOnly = True
        TabOrder = 0
        SkinData.SkinSection = 'EDIT'
        BoundLabel.Indent = 0
        BoundLabel.Font.Charset = DEFAULT_CHARSET
        BoundLabel.Font.Color = clWindowText
        BoundLabel.Font.Height = -11
        BoundLabel.Font.Name = 'MS Sans Serif'
        BoundLabel.Font.Style = []
        BoundLabel.Layout = sclLeft
        BoundLabel.MaxWidth = 0
        BoundLabel.UseSkinColor = True
      end
      object edNama: TsEdit
        Left = 96
        Top = 32
        Width = 201
        Height = 21
        ReadOnly = True
        TabOrder = 1
        SkinData.SkinSection = 'EDIT'
        BoundLabel.Indent = 0
        BoundLabel.Font.Charset = DEFAULT_CHARSET
        BoundLabel.Font.Color = clWindowText
        BoundLabel.Font.Height = -11
        BoundLabel.Font.Name = 'MS Sans Serif'
        BoundLabel.Font.Style = []
        BoundLabel.Layout = sclLeft
        BoundLabel.MaxWidth = 0
        BoundLabel.UseSkinColor = True
      end
    end
  end
  object QDaftarHadir: TMyQuery
    Connection = DM.xConn
    Left = 8
    Top = 88
  end
  object dsDaftarHadir: TDataSource
    DataSet = QDaftarHadir
    Left = 40
    Top = 88
  end
end
