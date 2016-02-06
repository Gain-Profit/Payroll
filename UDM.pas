unit UDM;

interface

uses
  SysUtils, Classes, DB, mySQLDbTables;

type
  TDM = class(TDataModule)
    xConn: TmySQLDatabase;
    Qexe: TmySQLQuery;
    QShow: TmySQLQuery;
    procedure DataModuleCreate(Sender: TObject);
    procedure SQLExec(aQuery:TmySQLQuery; _SQL:string; isSearch: boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;
  _host,_db,_user,_password:string;
  _port:Integer;

implementation

{$R *.dfm}

procedure TDM.DataModuleCreate(Sender: TObject);
begin
  _host := _host;
  _db:= 'profit';
  _user:= 'root';
  _password:= 'server';
  _port:= 3306;

  with xConn do
  begin
    Host := _host;
    DatabaseName:= _db;
    UserName:= _user;
    UserPassword:= _password;
    port:= _port;
    Connected:= True;
  end;
end;

procedure TDM.SQLExec(aQuery:TmySQLQuery; _SQL:string; isSearch: boolean);
begin
  with aQuery  do
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

end.
