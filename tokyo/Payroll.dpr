program Payroll;

uses
  Forms,
//  URegister in '..\src\URegister.pas' {FRegister},
  UDM in '..\src\UDM.pas' {DM: TDataModule},
  UMain in '..\src\UMain.pas' {FMain},
  UDaftarKaryawan in '..\src\UDaftarKaryawan.pas' {FDaftarKaryawan},
  ULogin in '..\src\ULogin.pas' {FLogin},
  UDaftarHadir in '..\src\UDaftarHadir.pas' {FDaftarHadir},
  UDaftarUser in '..\src\UDaftarUser.pas' {FDaftarUser},
  UUser in '..\src\UUser.pas' {FUser},
  UDaftarGaji in '..\src\UDaftarGaji.pas' {FDaftarGaji},
  UGaji in '..\src\UGaji.pas' {FGaji},
  UDaftarGajiTemplate in '..\src\UDaftarGajiTemplate.pas' {FDaftarGajiTemplate},
  UGajiTemplate in '..\src\UGajiTemplate.pas' {FGajiTemplate};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Aplikasi Penggajian';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFMain, FMain);
  Application.Run;
end.
