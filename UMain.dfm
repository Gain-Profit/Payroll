object FMain: TFMain
  Left = 168
  Top = 108
  Width = 808
  Height = 579
  Caption = 'Penggajian'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIForm
  OldCreateOrder = False
  Position = poScreenCenter
  WindowState = wsMaximized
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object sCoolBar1: TsPanel
    Left = 0
    Top = 0
    Width = 792
    Height = 81
    Align = alTop
    BorderWidth = 5
    ParentBackground = True
    ParentColor = True
    TabOrder = 0
    SkinData.SkinSection = 'TOOLBAR'
    object sbKeluar: TsSpeedButton
      Left = 640
      Top = 6
      Width = 146
      Height = 69
      Cursor = crHandPoint
      Caption = 'Keluar'
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
      Align = alRight
      SkinData.SkinSection = 'TOOLBUTTON'
      DisabledGlyphKind = []
      ImageIndex = 2
      Images = DM.image
      Reflected = True
    end
    object sSpeedButton1: TsSpeedButton
      Left = 6
      Top = 6
      Width = 130
      Height = 69
      Cursor = crHandPoint
      Caption = 'Master Data'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Rockwell'
      Font.Style = [fsBold]
      Layout = blGlyphTop
      ParentFont = False
      Spacing = 0
      Align = alLeft
      ButtonStyle = tbsDropDown
      SkinData.SkinSection = 'TOOLBUTTON'
      DropdownMenu = pmMasterData
      ImageIndex = 0
      Images = DM.image
      Reflected = True
    end
    object sSpeedButton2: TsSpeedButton
      Left = 136
      Top = 6
      Width = 130
      Height = 69
      Cursor = crHandPoint
      Caption = 'Penggajian'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Rockwell'
      Font.Style = [fsBold]
      Layout = blGlyphTop
      ParentFont = False
      Spacing = 0
      Align = alLeft
      ButtonStyle = tbsDropDown
      SkinData.SkinSection = 'TOOLBUTTON'
      DropdownMenu = pmPenggajian
      ImageIndex = 1
      Images = DM.image
      Reflected = True
    end
  end
  object sb: TsStatusBar
    Left = 0
    Top = 516
    Width = 792
    Height = 25
    Hint = 'Double Klick Untuk Mengganti Periode Akun'
    Panels = <
      item
        Alignment = taCenter
        Text = 'VERSI'
        Width = 100
      end
      item
        Alignment = taCenter
        Text = 'USER'
        Width = 150
      end
      item
        Alignment = taCenter
        Text = 'profit@localhost'
        Width = 150
      end
      item
        Alignment = taCenter
        Text = 'Periode :'
        Width = 60
      end
      item
        Alignment = taCenter
        Text = '02'
        Width = 50
      end
      item
        Alignment = taCenter
        Text = '2016'
        Width = 75
      end
      item
        Width = 50
      end>
    ParentShowHint = False
    ShowHint = True
    SkinData.SkinSection = 'STATUSBAR'
  end
  object tc_child: TsTabControl
    Left = 0
    Top = 81
    Width = 792
    Height = 24
    Cursor = crHandPoint
    Align = alTop
    HotTrack = True
    TabOrder = 2
    Visible = False
    OnChange = tc_childChange
    SkinData.SkinSection = 'PAGECONTROL'
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
    Top = 120
  end
  object pmMasterData: TPopupMenu
    MenuAnimation = [maLeftToRight, maRightToLeft, maTopToBottom, maBottomToTop]
    Left = 16
    Top = 8
    object miDaftarKaryawan: TMenuItem
      Caption = 'Daftar Karyawan'
      OnClick = miDaftarKaryawanClick
    end
    object N5: TMenuItem
      Caption = '-'
    end
    object miDaftarUser: TMenuItem
      Caption = 'Daftar User'
      OnClick = miDaftarUserClick
    end
  end
  object pmPenggajian: TPopupMenu
    MenuAnimation = [maLeftToRight, maRightToLeft, maTopToBottom, maBottomToTop]
    Left = 144
    Top = 8
    object miDaftarGaji: TMenuItem
      Caption = 'Daftar Gaji'
    end
    object MenuItem3: TMenuItem
      Caption = '-'
    end
    object miDaftarGajiTemplate: TMenuItem
      Caption = 'Daftar Gaji Template'
    end
  end
end
