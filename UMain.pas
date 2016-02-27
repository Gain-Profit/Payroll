unit UMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, MMSystem, sSkinProvider, ActnList, Menus, ComCtrls,
  sTabControl, sStatusBar, Buttons, sSpeedButton, ExtCtrls, sPanel, sEdit,
  sSpinEdit;

const
  WM_AFTER_SHOW = WM_USER + 300; // custom message

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
    procedure MDIChildCreated(const childHandle: THandle);
    procedure MDIChildDestroyed(const childHandle: THandle);
    procedure sbKeluarClick(Sender: TObject);
    procedure DaftarKaryawan1Click(Sender: TObject);
    procedure miDaftarKaryawanClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    procedure WmAfterShow(var Msg: TMessage); message WM_AFTER_SHOW;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMain: TFMain;

implementation

uses
  URegister, UDaftarKaryawan, UDM;

{$R *.dfm}

//add a tab for an MDI child
procedure TFMain.MDIChildCreated(const childHandle: THandle);
begin
  tc_child.Tabs.AddObject(TForm(FindControl(childHandle)).Caption, TObject(childHandle));
  tc_child.TabIndex := -1 + tc_child.Tabs.Count;
  if FMain.MDIChildCount > 1 then
  begin
    tc_child.Visible := True;
  end;
end;

//remove a tab for this MDI child
procedure TFMain.MDIChildDestroyed(const childHandle: THandle);
var
  idx: Integer;
begin
  idx := tc_child.Tabs.IndexOfObject(TObject(childHandle));
  tc_child.Tabs.Delete(idx);

  if FMain.MDIChildCount = 2 then
    tc_child.Visible := False;
end;

procedure TFMain.FormShow(Sender: TObject);
begin
  metu_kabeh := False;
  sb.Panels[2].Text := dm.xConn.DatabaseName + '@' + dm.xConn.Host;

  PostMessage(Self.Handle, WM_AFTER_SHOW, 0, 0);
end;

procedure TFMain.WmAfterShow(var Msg: TMessage);
begin
  dm.sm.Active := true;
{
  application.CreateForm(tF_login, f_login);
  f_login.sb.Panels[0].Text:=sb.Panels[3].Text;
  f_login.sb.Panels[1].Text:=sb.Panels[4].Text;
  f_login.ShowModal;
}
end;

procedure TFMain.sbKeluarClick(Sender: TObject);
begin
  Close;
end;

procedure TFMain.DaftarKaryawan1Click(Sender: TObject);
begin
  Application.CreateForm(TFRegister, FRegister);
  FRegister.ShowModal;
end;

procedure TFMain.miDaftarKaryawanClick(Sender: TObject);
begin
  if FDaftarKaryawan = nil then
    application.CreateForm(tFDaftarKaryawan, FDaftarKaryawan);

  FDaftarKaryawan.Show;
end;

procedure TFMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  metu_kabeh := True;
  dm.xConn.Connected := false;

  action := cafree;
  FMain := nil;
end;

end.

