unit UMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,MMSystem, sSkinProvider, ActnList, Menus, ComCtrls,
  sTabControl, sStatusBar, Buttons, sSpeedButton, ExtCtrls, sPanel, sEdit,
  sSpinEdit;

type
  TFMain = class(TForm)
    sSkinProvider1: TsSkinProvider;
    sCoolBar1: TsPanel;
    sbKeluar: TsSpeedButton;
    sSpeedButton1: TsSpeedButton;
    sSpeedButton2: TsSpeedButton;
    sb: TsStatusBar;
    tc_child: TsTabControl;
    pmMasterData: TPopupMenu;
    miDaftarKaryawan: TMenuItem;
    N5: TMenuItem;
    DaftarKaryawan1: TMenuItem;
    procedure sbKeluarClick(Sender: TObject);
    procedure DaftarKaryawan1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMain: TFMain;

implementation

uses URegister;

{$R *.dfm}


procedure TFMain.sbKeluarClick(Sender: TObject);
begin
  Close;
end;

procedure TFMain.DaftarKaryawan1Click(Sender: TObject);
begin
  Application.CreateForm(TFRegister,FRegister);
  FRegister.ShowModal;
end;

end.
