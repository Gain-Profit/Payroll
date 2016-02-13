program Payroll;

uses
  Forms,
  URegister in 'URegister.pas' {FRegister},
  UDM in 'UDM.pas' {DM: TDataModule},
  UCheckIO in 'UCheckIO.pas' {FChekIO},
  UMain in 'UMain.pas' {FMain};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Aplikasi Penggajian';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFMain, FMain);
  Application.Run;
end.
