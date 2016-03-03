object FUser: TFUser
  Left = 211
  Top = 173
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'User'
  ClientHeight = 377
  ClientWidth = 517
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
  object lbl1: TsLabel
    Left = 8
    Top = 16
    Width = 50
    Height = 13
    Caption = 'Kode User'
  end
  object sLabel1: TsLabel
    Left = 200
    Top = 16
    Width = 53
    Height = 13
    Caption = 'Nama User'
  end
  object sLabel2: TsLabel
    Left = 8
    Top = 48
    Width = 32
    Height = 13
    Caption = 'Alamat'
  end
  object sLabel3: TsLabel
    Left = 8
    Top = 80
    Width = 41
    Height = 13
    Caption = 'Telp/HP'
  end
  object sLabel4: TsLabel
    Left = 256
    Top = 80
    Width = 25
    Height = 13
    Caption = 'Email'
  end
  object sLabel5: TsLabel
    Left = 8
    Top = 296
    Width = 38
    Height = 13
    Caption = 'Jabatan'
  end
  object sLabel6: TsLabel
    Left = 8
    Top = 112
    Width = 53
    Height = 13
    Caption = 'Pendidikan'
  end
  object sLabel7: TsLabel
    Left = 208
    Top = 192
    Width = 50
    Height = 13
    Caption = 'Tgl Masuk'
  end
  object sLabel8: TsLabel
    Left = 208
    Top = 240
    Width = 48
    Height = 13
    Caption = 'Tgl Keluar'
  end
  object sLabel10: TsLabel
    Left = 208
    Top = 144
    Width = 65
    Height = 13
    Caption = 'Tanggal Lahir'
  end
  object sLabel12: TsLabel
    Left = 256
    Top = 112
    Width = 46
    Height = 13
    Caption = 'Password'
  end
  object imgUser: TImage
    Left = 368
    Top = 144
    Width = 135
    Height = 180
    Center = True
    Proportional = True
  end
  object edKodeUser: TsEdit
    Left = 72
    Top = 16
    Width = 121
    Height = 21
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
  object edNamaUser: TsEdit
    Left = 264
    Top = 16
    Width = 241
    Height = 21
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
  object edAlamat: TsEdit
    Left = 72
    Top = 48
    Width = 433
    Height = 21
    TabOrder = 2
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
  object edKontak: TsEdit
    Left = 72
    Top = 80
    Width = 177
    Height = 21
    TabOrder = 3
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
  object edEmail: TsEdit
    Left = 312
    Top = 80
    Width = 193
    Height = 21
    TabOrder = 4
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
  object edJabatan: TsEdit
    Left = 72
    Top = 296
    Width = 289
    Height = 21
    TabOrder = 13
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
  object edPendidikan: TsEdit
    Left = 72
    Top = 112
    Width = 177
    Height = 21
    TabOrder = 5
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
  object deTanggalMasuk: TsDateEdit
    Left = 208
    Top = 208
    Width = 153
    Height = 21
    AutoSize = False
    EditMask = '!99/99/9999;1; '
    MaxLength = 10
    TabOrder = 11
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
  object deTanggalKeluar: TsDateEdit
    Left = 208
    Top = 256
    Width = 153
    Height = 21
    AutoSize = False
    EditMask = '!99/99/9999;1; '
    MaxLength = 10
    TabOrder = 12
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
  object rgJenisKelamin: TsRadioGroup
    Left = 8
    Top = 144
    Width = 193
    Height = 41
    Caption = '| Jenis Kelamin |'
    ParentBackground = False
    TabOrder = 7
    SkinData.SkinSection = 'GROUPBOX'
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      'Laki-Laki'
      'Perempuan')
  end
  object edPassword: TsEdit
    Left = 312
    Top = 112
    Width = 193
    Height = 21
    PasswordChar = '@'
    TabOrder = 6
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
  object deTanggalLahir: TsDateEdit
    Left = 208
    Top = 160
    Width = 153
    Height = 21
    AutoSize = False
    EditMask = '!99/99/9999;1; '
    MaxLength = 10
    TabOrder = 10
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
  object rgStatusPerkawinan: TsRadioGroup
    Left = 8
    Top = 192
    Width = 193
    Height = 41
    Caption = '| Status Perkawinan |'
    ParentBackground = False
    TabOrder = 8
    SkinData.SkinSection = 'GROUPBOX'
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      'Belum Kawin'
      'Sudah Kawin')
  end
  object rgStatusAktif: TsRadioGroup
    Left = 8
    Top = 240
    Width = 193
    Height = 41
    Caption = '| Status Keaktifan |'
    ParentBackground = False
    TabOrder = 9
    SkinData.SkinSection = 'GROUPBOX'
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      'Masih Aktif'
      'Tidak Aktif')
  end
  object pnlBawah: TsPanel
    Left = 0
    Top = 335
    Width = 517
    Height = 42
    Align = alBottom
    TabOrder = 14
    SkinData.SkinSection = 'PANEL'
    object btnSimpan: TsButton
      Left = 344
      Top = 9
      Width = 75
      Height = 25
      Caption = '&Simpan'
      TabOrder = 0
      SkinData.SkinSection = 'BUTTON'
    end
    object btnBatal: TsButton
      Left = 432
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Batal'
      TabOrder = 1
      SkinData.SkinSection = 'BUTTON'
    end
  end
end
