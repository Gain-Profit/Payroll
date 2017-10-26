object FMain: TFMain
  Left = 168
  Top = 108
  Caption = 'Penggajian'
  ClientHeight = 350
  ClientWidth = 613
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
    Width = 613
    Height = 81
    Align = alTop
    BorderWidth = 5
    ParentColor = True
    TabOrder = 0
    SkinData.SkinSection = 'TOOLBAR'
    ExplicitWidth = 116
    object sbKeluar: TsSpeedButton
      Left = 461
      Top = 6
      Width = 146
      Height = 69
      Cursor = crHandPoint
      Align = alRight
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
      SkinData.SkinSection = 'TOOLBUTTON'
      Images = DM.image
      ImageIndex = 2
      Reflected = True
      ExplicitLeft = 640
    end
    object sSpeedButton1: TsSpeedButton
      Left = 6
      Top = 6
      Width = 130
      Height = 69
      Cursor = crHandPoint
      Align = alLeft
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
      ButtonStyle = tbsDropDown
      SkinData.SkinSection = 'TOOLBUTTON'
      DropdownMenu = pmMasterData
      Images = DM.image
      ImageIndex = 0
      Reflected = True
    end
    object sSpeedButton2: TsSpeedButton
      Left = 136
      Top = 6
      Width = 130
      Height = 69
      Cursor = crHandPoint
      Align = alLeft
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
      ButtonStyle = tbsDropDown
      SkinData.SkinSection = 'TOOLBUTTON'
      DropdownMenu = pmPenggajian
      Images = DM.image
      ImageIndex = 1
      Reflected = True
    end
  end
  object sb: TsStatusBar
    Left = 0
    Top = 325
    Width = 613
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
        Width = 50
      end>
    ParentShowHint = False
    ShowHint = True
    SkinData.SkinSection = 'STATUSBAR'
    ExplicitTop = -25
    ExplicitWidth = 116
  end
  object tc_child: TsTabControl
    Left = 0
    Top = 81
    Width = 613
    Height = 24
    Cursor = crHandPoint
    Align = alTop
    HotTrack = True
    TabOrder = 2
    Visible = False
    OnChange = tc_childChange
    SkinData.SkinSection = 'PAGECONTROL'
    ExplicitWidth = 116
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
      OnClick = miDaftarGajiClick
    end
    object MenuItem3: TMenuItem
      Caption = '-'
    end
    object miDaftarTemplateGaji: TMenuItem
      Caption = 'Daftar Template Gaji'
      OnClick = miDaftarTemplateGajiClick
    end
  end
end
