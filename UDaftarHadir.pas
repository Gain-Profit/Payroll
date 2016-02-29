unit UDaftarHadir;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, mySQLDbTables, StdCtrls, sButton,
  Buttons, sSpeedButton, ExtCtrls, sPanel, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid, sEdit, sLabel;

const
  WM_AFTER_SHOW = WM_USER + 300; // custom message

type
  TFDaftarHadir = class(TForm)
    pnlSamping: TsPanel;
    sb_2: TsSpeedButton;
    sb_1: TsSpeedButton;
    QDaftarHadir: TmySQLQuery;
    dsDaftarHadir: TDataSource;
    pnlUtama: TsPanel;
    grid: TcxGrid;
    TvData: TcxGridDBTableView;
    TvDatauser_id: TcxGridDBColumn;
    TvDatacheckin_time: TcxGridDBColumn;
    TvDatacheckout_time: TcxGridDBColumn;
    TvDataTotal: TcxGridDBColumn;
    TvDatajam: TcxGridDBColumn;
    TvDataket: TcxGridDBColumn;
    lvData: TcxGridLevel;
    pnlAtas: TsPanel;
    lbl1: TsLabel;
    lbl2: TsLabel;
    edID: TsEdit;
    edNama: TsEdit;
    procedure WMMDIACTIVATE(var msg: TWMMDIACTIVATE); message WM_MDIACTIVATE;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sb_1Click(Sender: TObject);
    procedure sb_2Click(Sender: TObject);
  private
    procedure WmAfterShow(var Msg: TMessage); message WM_AFTER_SHOW;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FDaftarHadir: TFDaftarHadir;

implementation

uses UDM, UMain;

{$R *.dfm}

procedure TFDaftarHadir.FormCreate(Sender: TObject);
begin
  FMain.MDIChildCreated(self.Handle);
end;

procedure TFDaftarHadir.FormShow(Sender: TObject);
begin
  edID.Text := dm.QKaryawan.FIeldByName('kd_user').Text;
  edNama.Text := dm.QKaryawan.FIeldByName('n_user').Text;

  Caption := 'Daftar Hadir - ' + edID.Text; 
  PostMessage(Self.Handle, WM_AFTER_SHOW, 0, 0);
end;

procedure TFDaftarHadir.WmAfterShow(var Msg: TMessage);
var
  periode, sql : string;
begin
  periode := FMain.sb.Panels[5].Text + FMain.sb.Panels[4].Text;
  sql := 'SELECT user_id,checkin_time,checkout_time, ' +
  'TIMEDIFF(checkout_time,checkin_time) AS Total, ' +
  'IFNULL(fx_pembulatan(checkout_time,checkin_time),0) AS Jam, ' +
  'fx_overhours(checkout_time,checkin_time) AS ket FROM tb_checkinout ' +
  'WHERE EXTRACT(YEAR_MONTH FROM checkin_time) = "'+periode+'" ' +
  'AND user_id = "'+edID.Text+'" ORDER BY checkin_time DESC';
  
  dm.SQLExec(QDaftarHadir, sql, true);

  tvdata.DataController.FocusedRowIndex := 1;
end;

procedure TFDaftarHadir.WMMDIACTIVATE(var msg: TWMMDIACTIVATE);
var
  active: TWinControl;
  idx: Integer;
begin
  active := FindControl(msg.ActiveWnd);
  if not (metu_kabeh) then
  begin
    if Assigned(active) then
    begin
      idx := FMain.tc_child.Tabs.IndexOfObject(TObject(msg.ActiveWnd));
      FMain.tc_child.Tag := -1;
      FMain.tc_child.TabIndex := idx;
      FMain.tc_child.Tag := 0;
    end;
  end;
end;

procedure TFDaftarHadir.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FMain.MDIChildDestroyed(Self.Handle);
  action := cafree;
  FDaftarHadir := nil;
end;

procedure TFDaftarHadir.sb_1Click(Sender: TObject);
begin
  Close;
end;

procedure TFDaftarHadir.sb_2Click(Sender: TObject);
var
  posisi: integer;
begin
  posisi := tvdata.DataController.DataSource.DataSet.RecNo;
  tvdata.DataController.DataSource.DataSet.Close;
  tvdata.DataController.DataSource.DataSet.Open;
  tvdata.DataController.DataSource.DataSet.RecNo := posisi;
end;

end.
