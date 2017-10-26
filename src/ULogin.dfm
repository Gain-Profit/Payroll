object FLogin: TFLogin
  Left = 411
  Top = 163
  BorderStyle = bsDialog
  Caption = 'Login'
  ClientHeight = 275
  ClientWidth = 374
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object sb: TsStatusBar
    Left = 0
    Top = 254
    Width = 374
    Height = 21
    Cursor = crHandPoint
    Panels = <
      item
        Width = 70
      end>
    SkinData.SkinSection = 'STATUSBAR'
  end
  object sg_login: TsGroupBox
    Left = 0
    Top = 0
    Width = 374
    Height = 254
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Rockwell'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    SkinData.SkinSection = 'GROUPBOX'
    object sLabel4: TsLabel
      Left = 8
      Top = 24
      Width = 76
      Height = 19
      Caption = 'Kode User'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'Rockwell'
      Font.Style = []
    end
    object sLabel5: TsLabel
      Left = 8
      Top = 80
      Width = 82
      Height = 19
      Caption = 'Nama User'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'Rockwell'
      Font.Style = []
    end
    object sLabel6: TsLabel
      Left = 8
      Top = 136
      Width = 70
      Height = 19
      Caption = 'Password'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'Rockwell'
      Font.Style = []
    end
    object sBitBtn2: TsBitBtn
      Left = 272
      Top = 192
      Width = 81
      Height = 33
      Cursor = crHandPoint
      Caption = '&Close'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Rockwell'
      Font.Style = []
      ModalResult = 2
      ParentFont = False
      TabOrder = 4
      OnClick = sBitBtn2Click
      NumGlyphs = 2
      SkinData.SkinSection = 'BUTTON'
    end
    object sButton1: TsButton
      Left = 152
      Top = 192
      Width = 75
      Height = 33
      Caption = '&Login'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Rockwell'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnClick = sButton1Click
      SkinData.SkinSection = 'BUTTON'
    end
    object Ed_Kd_User: TsEdit
      Left = 32
      Top = 48
      Width = 321
      Height = 27
      CharCase = ecUpperCase
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'Rockwell'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnChange = Ed_Kd_UserChange
      OnKeyDown = Ed_Kd_UserKeyDown
      SkinData.CustomColor = True
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
    object Ed_N_User: TsEdit
      Left = 32
      Top = 104
      Width = 321
      Height = 27
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'Rockwell'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnEnter = Ed_N_UserEnter
      SkinData.CustomColor = True
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
    object Ed_Password: TsEdit
      Left = 32
      Top = 160
      Width = 321
      Height = 27
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'Rockwell'
      Font.Style = []
      ParentFont = False
      PasswordChar = '@'
      TabOrder = 2
      OnKeyDown = Ed_PasswordKeyDown
      SkinData.CustomColor = True
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
  object sSkinProvider1: TsSkinProvider
    AddedTitle.Font.Charset = DEFAULT_CHARSET
    AddedTitle.Font.Color = clNone
    AddedTitle.Font.Height = -11
    AddedTitle.Font.Name = 'MS Sans Serif'
    AddedTitle.Font.Style = []
    SkinData.SkinSection = 'FORM'
    TitleButtons = <>
    Left = 16
    Top = 8
  end
end
