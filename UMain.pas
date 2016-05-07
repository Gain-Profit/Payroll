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
    miDaftarUser: TMenuItem;
    pmPenggajian: TPopupMenu;
    miDaftarGaji: TMenuItem;
    MenuItem3: TMenuItem;
    miDaftarTemplateGaji: TMenuItem;
    procedure panel_auto_width;
    procedure MDIChildCreated(const childHandle: THandle);
    procedure MDIChildDestroyed(const childHandle: THandle);
    procedure sbKeluarClick(Sender: TObject);
    procedure miDaftarKaryawanClick(Sender: TObject);
    procedure miDaftarUserClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure tc_childChange(Sender: TObject);
    procedure cek_update;
    procedure miDaftarGajiClick(Sender: TObject);
    procedure miDaftarTemplateGajiClick(Sender: TObject);
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
  URegister, UDaftarKaryawan, UDM, ULogin, UDaftarUser, UDaftarGaji,
  UDaftarGajiTemplate;

{$R *.dfm}
// untuk mengetahui versi applikasi.
function program_versi:string;
var V1, V2, V3, V4: Word;
   VerInfoSize, VerValueSize, Dummy : DWORD;
   VerInfo : Pointer;
   VerValue : PVSFixedFileInfo;
begin
VerInfoSize := GetFileVersionInfoSize(PChar(ParamStr(0)), Dummy);
GetMem(VerInfo, VerInfoSize);
GetFileVersionInfo(PChar(ParamStr(0)), 0, VerInfoSize, VerInfo);
VerQueryValue(VerInfo, '\', Pointer(VerValue), VerValueSize);
With VerValue^ do
begin
  V1 := dwFileVersionMS shr 16;
  V2 := dwFileVersionMS and $FFFF;
  V3 := dwFileVersionLS shr 16;
  V4 := dwFileVersionLS and $FFFF;
end;
FreeMem(VerInfo, VerInfoSize);

Result := IntToStr(V1) + '.'
            + IntToStr(V2) + '.'
            + IntToStr(V3) + '.'
            + IntToStr(V4);
end;

// lebar panel menyesuaikan dengan teks yang ada di dalamnya.
procedure TFMain.panel_auto_width;
var x: integer;
    y: string;
begin
 for x:=0 to sb.Panels.Count-1 do
 begin
    y:= sb.Panels[x].text;
    sb.Panels[x].Width := sb.Canvas.TextWidth(y) +30;
 end;
end;

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
  cek_update;
  metu_kabeh := False;
  sb.Panels[0].Text := program_versi;
  sb.Panels[2].Text := dm.xConn.DatabaseName + '@' + dm.xConn.Host;

  PostMessage(Self.Handle, WM_AFTER_SHOW, 0, 0);
end;

procedure TFMain.WmAfterShow(var Msg: TMessage);
begin
  dm.sm.Active := true;
  login := False;

  application.CreateForm(TFLogin, FLogin);
  FLogin.ShowModal;

  if not(login) then
    Close;
end;

procedure TFMain.sbKeluarClick(Sender: TObject);
begin
  Close;
end;

procedure TFMain.miDaftarKaryawanClick(Sender: TObject);
begin
  if FDaftarKaryawan = nil then
    application.CreateForm(TFDaftarKaryawan, FDaftarKaryawan);

  FDaftarKaryawan.Show;
end;

procedure TFMain.miDaftarUserClick(Sender: TObject);
begin
  if FDaftarUser = nil then
    application.CreateForm(TFDaftarUser, FDaftarUser);

  FDaftarUser.Show;
end;

procedure TFMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  metu_kabeh := True;
  dm.xConn.Connected := false;

  action := cafree;
  FMain := nil;
end;

procedure TFMain.tc_childChange(Sender: TObject);
var
  cHandle: Integer;
  k: Integer;
begin
  cHandle := Integer(tc_child.Tabs.Objects[tc_child.TabIndex]);

  if tc_child.Tag = -1 then Exit;

  for k := 0 to MDIChildCount - 1 do
  begin
    if MDIChildren[k].Handle = cHandle then
    begin
      MDIChildren[k].Show;
      Break;
    end;
  end;
end;

procedure TFMain.cek_update;
var
  versiDB,versiAPP,URLDownload:string;
  fileName, UrlDownloadLocal:string;
begin
  versiAPP := program_versi;

  dm.SQLExec(dm.QShow,'select versi_terbaru, URLdownload from  app_versi where kode="payroll.exe"',true);
  versiDB           := dm.QShow.FieldByName('versi_terbaru').AsString;
  URLDownload       := dm.QShow.FieldByName('URLdownload').AsString;
  fileName          := Copy(URLDownload,LastDelimiter('/',URLDownload) + 1,Length(URLDownload));
  UrlDownloadLocal  := 'http://'+dm.xConn.Host + '/GainProfit/' + fileName;

  if versiAPP < versiDB then
  begin
    ShowMessage('APLIKASI PENGGAJIAN VERSI : '+ versiAPP +
    ' TIDAK DAPAT DIJALANKAN' + #13#10 +
    'aplikasi terbaru dengan versi : '+ versiDB +
    ' SUDAH DIRILIS...');

    Application.Terminate;
  end;  
end;

procedure TFMain.miDaftarGajiClick(Sender: TObject);
begin
  if FDaftarGaji = nil then
    application.CreateForm(TFDaftarGaji, FDaftarGaji);

  FDaftarGaji.Show;
end;

procedure TFMain.miDaftarTemplateGajiClick(Sender: TObject);
begin
  if FDaftarGajiTemplate = nil then
    application.CreateForm(TFDaftarGajiTemplate, FDaftarGajiTemplate);

  FDaftarGajiTemplate.Show;
end;

end.

