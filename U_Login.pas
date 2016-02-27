unit U_Login;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, sLabel, sEdit, sGroupBox, Buttons, sBitBtn, sButton, Mask,
  sMaskEdit, sCustomComboEdit, ComCtrls, sStatusBar, sTooledit, cxControls,
  cxContainer, cxEdit, cxImage, mySQLDbTables, db, Registry, sSkinProvider, jpeg,
  ExtCtrls, sPanel, XPMan;

type
  TF_Login = class(TForm)
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
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Login: TF_Login;
  userPassword, userRealName: string;
  isAdmin: Boolean;

implementation

uses
  Udm, UMain;


{$R *.dfm}

procedure TF_Login.Ed_Kd_UserKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  sql: string;
begin
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

      sql := 'SELECT user_id FROM tb_checkinout WHERE ISNULL(checkout_time) ' +
        'AND user_id="' + ed_kd_user.Text + '"';
      dm.SQLExec(DM.QShow, sql, true);
      if dm.QShow.Eof then
      begin
        messagedlg('Tidak Dapat Login '#10#13'USER belum Check IN....',
          mtError,[mbOk], 0);
        ed_kd_user.SetFocus;
      end
      else
      begin
        ed_password.Enabled := true;
        Ed_Password.SetFocus;
        Ed_N_User.Text := userRealName;
      end;
    end;
  end;

  if key = vk_escape then
    close;
end;

procedure TF_Login.sButton1Click(Sender: TObject);
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
      login := True;
      close;
    end;
  end;
end;

procedure TF_Login.Ed_N_UserEnter(Sender: TObject);
begin
  ed_kd_user.SetFocus;
end;

procedure TF_Login.sBitBtn2Click(Sender: TObject);
begin
  close;
end;

procedure TF_Login.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action := cafree;
end;

procedure TF_Login.FormShow(Sender: TObject);
begin
  Ed_Kd_User.Clear;
  Ed_N_User.Clear;

  Ed_Kd_User.setfocus;

  sb.Panels[0].Text := dm.xConn.DatabaseName + '@' + dm.xConn.Host;
end;

procedure TF_Login.Ed_PasswordKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if key = vk_return then
  begin
    sButton1Click(Sender);
  end;
end;

procedure TF_Login.Ed_Kd_UserChange(Sender: TObject);
begin
  Ed_N_User.Clear;
  ed_password.clear;
end;

end.
