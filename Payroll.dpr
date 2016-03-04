program Payroll;

uses
  Forms,
  URegister in 'URegister.pas' {FRegister},
  UDM in 'UDM.pas' {DM: TDataModule},
  UMain in 'UMain.pas' {FMain},
  UDaftarKaryawan in 'UDaftarKaryawan.pas' {FDaftarKaryawan},
  ULogin in 'ULogin.pas' {FLogin},
  UDaftarHadir in 'UDaftarHadir.pas' {FDaftarHadir},
  UDaftarUser in 'UDaftarUser.pas' {FDaftarUser},
  UUser in 'UUser.pas' {FUser},
  UDaftarGaji in 'UDaftarGaji.pas' {FDaftarGaji},
  UGaji in 'UGaji.pas' {FGaji},
  UDaftarGajiTemplate in 'UDaftarGajiTemplate.pas' {FDaftarGajiTemplate};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Aplikasi Penggajian';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFMain, FMain);
  Application.Run;
end.
