program Payroll;

uses
  Forms,
  URegister in 'URegister.pas' {FRegister},
  UDM in 'UDM.pas' {DM: TDataModule},
  UMain in 'UMain.pas' {FMain},
  UDaftarKaryawan in 'UDaftarKaryawan.pas' {FDaftarKaryawan},
  U_Login in 'U_Login.pas' {F_Login};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Aplikasi Penggajian';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFMain, FMain);
  Application.Run;
end.
