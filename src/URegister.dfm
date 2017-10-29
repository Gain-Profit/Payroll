object FRegister: TFRegister
  Left = 258
  Top = 191
  BorderStyle = bsDialog
  Caption = 'Daftar Sidik Jari'
  ClientHeight = 381
  ClientWidth = 386
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 8
    Top = 8
    Width = 36
    Height = 13
    Caption = 'User ID'
  end
  object lbl2: TLabel
    Left = 8
    Top = 56
    Width = 16
    Height = 13
    Caption = 'Jari'
  end
  object imgJari: TImage
    Left = 272
    Top = 8
    Width = 105
    Height = 105
    AutoSize = True
    Center = True
    Proportional = True
    Stretch = True
  end
  object lbl4: TLabel
    Left = 8
    Top = 32
    Width = 28
    Height = 13
    Caption = 'Nama'
  end
  object edIdUser: TEdit
    Left = 56
    Top = 8
    Width = 145
    Height = 19
    BevelInner = bvNone
    BevelOuter = bvNone
    CharCase = ecUpperCase
    Ctl3D = False
    Enabled = False
    ParentCtl3D = False
    TabOrder = 0
  end
  object cbFingerIndex: TComboBox
    Left = 56
    Top = 56
    Width = 145
    Height = 21
    Style = csDropDownList
    Ctl3D = False
    ItemIndex = 6
    ParentCtl3D = False
    TabOrder = 2
    Text = 'Telunjuk Kanan'
    Items.Strings = (
      'Kelingking Kiri'
      'Manis Kiri'
      'Tengah Kiri'
      'Telunjuk Kiri'
      'Jempol Kiri'
      'Jempol Kanan'
      'Telunjuk Kanan'
      'Tengah Kanan'
      'Manis Kanan'
      'Kelingking Kanan')
  end
  object btnDaftar: TButton
    Left = 8
    Top = 88
    Width = 105
    Height = 25
    Caption = '&Daftar'
    TabOrder = 3
    OnClick = btnDaftarClick
  end
  object btnSimpan: TButton
    Left = 160
    Top = 88
    Width = 107
    Height = 25
    Caption = '&Simpan'
    Enabled = False
    TabOrder = 4
    OnClick = btnSimpanClick
  end
  object edNama: TEdit
    Left = 56
    Top = 32
    Width = 209
    Height = 19
    BevelInner = bvNone
    BevelOuter = bvNone
    Ctl3D = False
    Enabled = False
    ParentCtl3D = False
    TabOrder = 1
  end
  object status: TStatusBar
    Left = 0
    Top = 362
    Width = 386
    Height = 19
    Panels = <>
    SimplePanel = True
  end
  object redtStatus: TRichEdit
    Left = 8
    Top = 128
    Width = 369
    Height = 233
    Ctl3D = True
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    HideScrollBars = False
    ParentCtl3D = False
    ParentFont = False
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 6
    Zoom = 100
  end
end
