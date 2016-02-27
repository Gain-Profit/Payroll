unit UDM;

interface

uses
  SysUtils, Classes, DB, mySQLDbTables, Dialogs, sSkinManager, IniFiles, Forms,
  ImgList, Controls, acAlphaImageList;

type
  TDM = class(TDataModule)
    xConn: TmySQLDatabase;
    Qexe: TmySQLQuery;
    QShow: TmySQLQuery;
    sm: TsSkinManager;
    image: TsAlphaImageList;
    QKaryawan: TmySQLQuery;
    dsKaryawan: TDataSource;
    procedure koneksikan;
    procedure DataModuleCreate(Sender: TObject);
    procedure SQLExec(aQuery: TmySQLQuery; _SQL: string; isSearch: boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;
  _host, _db, _user, _password, WPath: string;
  _port: Integer;
  metu_kabeh: Boolean;

implementation

{$R *.dfm}

procedure Tdm.SQLExec(aQuery: TmySQLQuery; _SQL: string; isSearch: boolean);
begin
  with aQuery do
  begin
    Close;
    sql.Clear;
    SQL.Text := _SQL;
    if isSearch then
      Open
    else
      ExecSQL;
  end;
end;

function krupuk(const s: string; CryptInt: Integer): string;
var
  i: integer;
  s2: string;
begin
  if not (Length(s) = 0) then
    for i := 1 to Length(s) do
      s2 := s2 + Chr(Ord(s[i]) - cryptint);
  Result := s2;
end;

procedure Tdm.koneksikan;
var
  data, pusat, jalur1, jalur2, nama, kata: string;
  X: TextFile;
begin
  assignfile(X, 'tools/koneksi.cbCon');
  try
    reset(X);
    readln(X, pusat);
    readln(X, data);
    readln(X, jalur2);
    readln(X, nama);
    readln(X, kata);
    closefile(X);

    jalur1 := krupuk(jalur2, 6);

    _host := krupuk(pusat, 6);
    _db := krupuk(data, 6);
    _user := krupuk(nama, 6);
    _password := krupuk(kata, 6);
    _port := strtoint(jalur1);

    with xConn do
    begin
      Connected := False;
      Host := _host;
      DatabaseName := _db;
      UserName := _user;
      UserPassword := _password;
      port := _port;
      Connected := True;
    end;
  except
    showmessage('Tidak Terkoneksi ke database...');
  end;
end;

procedure Tdm.DataModuleCreate(Sender: TObject);
var
  appINI: TIniFile;
begin
  WPath := ExtractFilePath(Application.ExeName);
  sm.SkinDirectory := WPath + 'tools\skins';
  appINI := TIniFile.Create(WPath + 'tools\gain.ini');

  try
    sm.SkinName := appINI.ReadString('payroll', 'nama_skin', 'Air');
    sm.HueOffset := appini.ReadInteger('payroll', 'hue_skin', 0);
    sm.Saturation := appini.ReadInteger('payroll', 'sat_skin', 0);
  finally
    appINI.Free;
  end;
  sm.Active := False;

  koneksikan;
end;

end.

