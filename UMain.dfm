object FMain: TFMain
  Left = 367
  Top = 335
  Width = 288
  Height = 212
  Caption = 'Absensi Sidik Jari'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object btnRegister: TButton
    Left = 24
    Top = 16
    Width = 233
    Height = 25
    Caption = 'Register'
    TabOrder = 0
    OnClick = btnRegisterClick
  end
  object btnVerifikasi: TButton
    Left = 24
    Top = 56
    Width = 233
    Height = 25
    Caption = 'Check'
    TabOrder = 1
    OnClick = btnVerifikasiClick
  end
  object btnSound: TButton
    Left = 24
    Top = 104
    Width = 233
    Height = 25
    Caption = 'Sound'
    TabOrder = 2
    OnClick = btnSoundClick
  end
end
