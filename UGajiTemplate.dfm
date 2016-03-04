object FGajiTemplate: TFGajiTemplate
  Left = 188
  Top = 124
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Template Gaji'
  ClientHeight = 362
  ClientWidth = 416
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlHeader: TsPanel
    Left = 0
    Top = 0
    Width = 416
    Height = 65
    Align = alTop
    Enabled = False
    TabOrder = 0
    SkinData.SkinSection = 'PANEL'
    object sLabel1: TsLabel
      Left = 8
      Top = 8
      Width = 59
      Height = 13
      Caption = 'Id Karyawan'
    end
    object sLabel2: TsLabel
      Left = 8
      Top = 32
      Width = 78
      Height = 13
      Caption = 'Nama Karyawan'
    end
    object edId: TsEdit
      Left = 104
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
      Left = 104
      Top = 32
      Width = 297
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
  object gbGajiPokok: TsGroupBox
    Left = 0
    Top = 65
    Width = 416
    Height = 80
    Align = alTop
    Caption = '| Gaji Pokok |'
    TabOrder = 1
    SkinData.SkinSection = 'GROUPBOX'
    object sLabel4: TsLabel
      Left = 8
      Top = 24
      Width = 52
      Height = 13
      Caption = 'Gaji Pokok'
    end
    object sLabel5: TsLabel
      Left = 208
      Top = 24
      Width = 25
      Height = 13
      Caption = 'Hadir'
    end
    object sLabel6: TsLabel
      Left = 8
      Top = 48
      Width = 45
      Height = 13
      Caption = 'Transport'
    end
    object sLabel7: TsLabel
      Left = 208
      Top = 48
      Width = 45
      Height = 13
      Caption = 'Konsumsi'
    end
    object edGajiPokok: TsCurrencyEdit
      Left = 88
      Top = 24
      Width = 113
      Height = 21
      AutoSize = False
      TabOrder = 0
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
      DisplayFormat = '###,###,##0;(###,###,##0);0'
    end
    object edKonsumsi: TsCurrencyEdit
      Left = 288
      Top = 48
      Width = 113
      Height = 21
      AutoSize = False
      TabOrder = 3
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
      DisplayFormat = '###,###,##0;(###,###,##0);0'
    end
    object edHadir: TsCurrencyEdit
      Left = 288
      Top = 24
      Width = 113
      Height = 21
      AutoSize = False
      TabOrder = 1
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
      DisplayFormat = '###,###,##0;(###,###,##0);0'
    end
    object edTransport: TsCurrencyEdit
      Left = 88
      Top = 48
      Width = 113
      Height = 21
      AutoSize = False
      TabOrder = 2
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
      DisplayFormat = '###,###,##0;(###,###,##0);0'
    end
  end
  object pnlFooter: TsPanel
    Left = 0
    Top = 321
    Width = 416
    Height = 41
    Align = alBottom
    TabOrder = 4
    SkinData.SkinSection = 'PANEL'
    DesignSize = (
      416
      41)
    object btnSimpan: TsButton
      Left = 267
      Top = 8
      Width = 63
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Simpan'
      TabOrder = 0
      OnClick = btnSimpanClick
      SkinData.SkinSection = 'BUTTON'
    end
    object btnBatal: TsButton
      Left = 339
      Top = 8
      Width = 63
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Batal'
      ModalResult = 2
      TabOrder = 1
      SkinData.SkinSection = 'BUTTON'
    end
  end
  object gbTunjangan: TsGroupBox
    Left = 0
    Top = 145
    Width = 416
    Height = 80
    Align = alTop
    Caption = '| Tunjangan |'
    TabOrder = 2
    SkinData.SkinSection = 'GROUPBOX'
    object sLabel14: TsLabel
      Left = 8
      Top = 24
      Width = 38
      Height = 13
      Caption = 'Jabatan'
    end
    object sLabel15: TsLabel
      Left = 208
      Top = 24
      Width = 53
      Height = 13
      Caption = 'Masa Kerja'
    end
    object sLabel16: TsLabel
      Left = 8
      Top = 48
      Width = 51
      Height = 13
      Caption = 'Kesehatan'
    end
    object edJabatan: TsCurrencyEdit
      Left = 88
      Top = 24
      Width = 113
      Height = 21
      AutoSize = False
      TabOrder = 0
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
      DisplayFormat = '###,###,##0;(###,###,##0);0'
    end
    object edMasaKerja: TsCurrencyEdit
      Left = 288
      Top = 24
      Width = 113
      Height = 21
      AutoSize = False
      TabOrder = 1
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
      DisplayFormat = '###,###,##0;(###,###,##0);0'
    end
    object edKesehatan: TsCurrencyEdit
      Left = 88
      Top = 48
      Width = 113
      Height = 21
      AutoSize = False
      TabOrder = 2
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
      DisplayFormat = '###,###,##0;(###,###,##0);0'
    end
  end
  object gbPotongan: TsGroupBox
    Left = 0
    Top = 225
    Width = 416
    Height = 56
    Align = alTop
    Caption = '| Potongan |'
    TabOrder = 3
    SkinData.SkinSection = 'GROUPBOX'
    object sLabel20: TsLabel
      Left = 8
      Top = 24
      Width = 71
      Height = 13
      Caption = 'Angsuran Duta'
    end
    object sLabel21: TsLabel
      Left = 208
      Top = 24
      Width = 73
      Height = 13
      Caption = 'Angsuran Bank'
    end
    object edAngsuranDuta: TsCurrencyEdit
      Left = 88
      Top = 24
      Width = 113
      Height = 21
      AutoSize = False
      TabOrder = 0
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
      DisplayFormat = '###,###,##0;(###,###,##0);0'
    end
    object edAngsuranBank: TsCurrencyEdit
      Left = 288
      Top = 24
      Width = 113
      Height = 21
      AutoSize = False
      TabOrder = 1
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
      DisplayFormat = '###,###,##0;(###,###,##0);0'
    end
  end
end
