unit ULogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, sLabel, sEdit, sGroupBox, Buttons, sBitBtn, sButton, 
  ComCtrls, sStatusBar, cxControls, System.UITypes,
  cxContainer, cxEdit, cxImage, db, sSkinProvider, 
  ExtCtrls;

type
  TFLogin = class(TForm)
    sb: TsStatusBar;
    sg_login: TsGroupBox;
    sLabel4: TsLabel;
    sLabel5: TsLabel;
    sLabel6: TsLabel;
    sBitBtn2: TsBitBtn;
    sButton1: TsButton;
    Ed_Kd_User: TsEdit;
    Ed_N_User: TsEdit;
    Ed_Password: TsEdit;
    sSkinProvider1: TsSkinProvider;
    procedure Ed_Kd_UserKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure sButton1Click(Sender: TObject);
    procedure Ed_N_UserEnter(Sender: TObject);
    procedure sBitBtn2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure Ed_PasswordKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Ed_Kd_UserChange(Sender: TObject);
  private
    userPassword, userRealName: string;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FLogin: TFLogin;

implementation

uses
  Udm, UMain;


{$R *.dfm}

// prosedur dipanggil ketika menekan keyboard pada ed_kd_user 
// @param TObject sender
// @param Key key pada keyboard
// @param Shift ctrl shift atau alt
procedure TFLogin.Ed_Kd_UserKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  sql: string;
begin
  // jika ditekan enter.
  if key = vk_return then
  begin
    sql := 'SELECT n_user, `password` FROM tb_user WHERE ' +
    'kd_user="'+ed_kd_user.Text+'" AND payroll="Y"';
    dm.SQLExec(DM.QShow, sql, true);
    if dm.QShow.Eof then
    begin
      messagedlg('Kode ini tidak terdaftar...', mtError, [mbOk], 0);
      ed_kd_user.SetFocus;
    end
    else
    begin
      userRealName := dm.QShow.FieldByName('n_user').AsString;
      userPassword := dm.QShow.FieldByName('password').AsString;

      sql:= 'SELECT `nilai` FROM `tb_settings` WHERE `parameter`="checkin"';
      dm.SQLExec(DM.QShow,sql,true);
      if dm.QShow.FieldByName('nilai').AsBoolean then
      begin
        sql:= 'SELECT user_id FROM tb_checkinout WHERE ISNULL(checkout_time) ' +
              'AND user_id="'+ed_kd_user.Text+'"';
        dm.SQLExec(DM.QShow,sql,true);
        if dm.QShow.Eof then
        begin
          messagedlg('Tidak Dapat Login '#10#13'USER belum Check IN....',mtError,[mbOk],0);
          ed_kd_user.SetFocus;
          Exit;
        end;
      end;

      ed_password.Enabled := true;
      Ed_Password.SetFocus;
      Ed_N_User.Text := userRealName;
    end;
  end;

  if key = vk_escape then
    close;
end;

procedure TFLogin.sButton1Click(Sender: TObject);
var
  passs: string;
begin
  if ed_n_user.Text <> '' then
  begin
    DM.SQLExec(dm.QShow, 'select md5("' + ed_password.Text + '")as passs', true);
    passs := dm.QShow.fieldbyname('passs').AsString;
    if compareText(userPassword, passs) <> 0 then
    begin
      messagedlg('Password salah..', mtError, [mbOk], 0);
      ed_password.Clear;
      ed_password.SetFocus;
    end
    else
    begin
      FMain.Sb.Panels[1].Text := UpperCase(ed_kd_user.Text);

      FMain.panel_auto_width;
      DM.login := True;
      close;
    end;
  end;
end;

procedure TFLogin.Ed_N_UserEnter(Sender: TObject);
begin
  ed_kd_user.SetFocus;
end;

procedure TFLogin.sBitBtn2Click(Sender: TObject);
begin
  close;
end;

procedure TFLogin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action := cafree;
end;

procedure TFLogin.FormShow(Sender: TObject);
begin
  Ed_Kd_User.Clear;
  Ed_N_User.Clear;

  Ed_Kd_User.setfocus;

  sb.Panels[0].Text := dm.xConn.Database + '@' + dm.xConn.Server;
end;

procedure TFLogin.Ed_PasswordKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if key = vk_return then
  begin
    sButton1Click(Sender);
  end;
end;

procedure TFLogin.Ed_Kd_UserChange(Sender: TObject);
begin
  Ed_N_User.Clear;
  ed_password.clear;
end;

end.

