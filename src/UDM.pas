unit UDM;

interface

uses
  SysUtils, Classes, DB, Dialogs, sSkinManager, IniFiles, Forms, System.UITypes,
  ImgList, Controls, acAlphaImageList, Windows, SHFolder, MemDS, DBAccess, MyAccess,
  frxClass, frxDBSet, System.ImageList;

type
  TDM = class(TDataModule)
    xConn: TMyConnection;
    Qexe: TMyQuery;
    QShow: TMyQuery;
    sm: TsSkinManager;
    image: TsAlphaImageList;
    QKaryawan: TMyQuery;
    dsKaryawan: TDataSource;
    QUser: TMyQuery;
    dsUser: TDataSource;
    QGaji: TMyQuery;
    dsGaji: TDataSource;
    QGajiTemp: TMyQuery;
    dsGajiTemp: TDataSource;
    laporan: TfrxReport;
    DbLaporan: TfrxDBDataset;
    QLaporan: TMyQuery;
    procedure koneksikan;
    procedure DataModuleCreate(Sender: TObject);
    procedure SQLExec(aQuery: TMyQuery; _SQL: string; isSearch: boolean);
  private
    _host, _db, _user, _password: string;
    _port: Integer;
    { Private declarations }
  public
    WPath, AppPath, DocPath: string;
    metu_kabeh,login: Boolean;
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

function GetAppData(Folder: Integer): string;
var
  path: array[0..MAX_PATH] of Char;
begin
  if Succeeded(SHGetFolderPath(0, Folder, 0, 0, @Path[0])) then
    Result := path + '\Gain Profit\'
  else
    Result := '';
end;

procedure Tdm.SQLExec(aQuery: TMyQuery; _SQL: string; isSearch: boolean);
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
      Server := _host;
      Database := _db;
      UserName := _user;
      Password := _password;
      port := _port;
      Connected := True;
    end;
  except on E: Exception do
    begin
      MessageDlg('koneksi tidak berhasil' + sLineBreak + e.Message, mtError, [mbOk], 0);
      application.Terminate;
    end;
  end;
end;

procedure Tdm.DataModuleCreate(Sender: TObject);
var
  appINI: TIniFile;
begin
  WPath := ExtractFilePath(Application.ExeName);

  AppPath := GetAppData(CSIDL_COMMON_APPDATA);
  if not (DirectoryExists(AppPath)) then
    CreateDir(AppPath);

  DocPath := GetAppData(CSIDL_PERSONAL);
  if not (DirectoryExists(DocPath)) then
    CreateDir(DocPath);

  sm.SkinDirectory := WPath + 'Tools/Skins';
  appINI := TIniFile.Create(AppPath + 'gain.ini');

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

