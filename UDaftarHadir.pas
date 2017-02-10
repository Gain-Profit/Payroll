unit UDaftarHadir;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxGraphics, 
  cxDataStorage, cxEdit, DB, cxDBData, StdCtrls, 
  Buttons, sSpeedButton, ExtCtrls, sPanel, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid, sEdit, sLabel, Mask, sMaskEdit,
  sCustomComboEdit, sTooledit, MemDS, DBAccess, MyAccess, cxCustomData,
  cxFilter, cxData;

const
  WM_AFTER_SHOW = WM_USER + 300; // custom message

type
  TFDaftarHadir = class(TForm)
    pnlSamping: TsPanel;
    sb_2: TsSpeedButton;
    sb_1: TsSpeedButton;
    QDaftarHadir: TMyQuery;
    dsDaftarHadir: TDataSource;
    pnlUtama: TsPanel;
    grid: TcxGrid;
    TvData: TcxGridDBTableView;
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
    p1: TsPanel;
    l_1: TsLabel;
    l_2: TsLabel;
    deMulai: TsDateEdit;
    deSampai: TsDateEdit;
    procedure WMMDIACTIVATE(var msg: TWMMDIACTIVATE); message WM_MDIACTIVATE;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sb_1Click(Sender: TObject);
    procedure sb_2Click(Sender: TObject);
    procedure segarkan;
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
var
  Year, Month, Day: Word;
begin
  DecodeDate(Now, Year, Month, Day);
  deMulai.Date:= EncodeDate(Year,Month,1);
  deSampai.Date:= Date();

  edID.Text := dm.QKaryawan.FIeldByName('kd_user').Text;
  edNama.Text := dm.QKaryawan.FIeldByName('n_user').Text;

  Caption := 'Daftar Hadir - ' + edID.Text;
  FMain.MDIChildCreated(self.Handle);
end;

procedure TFDaftarHadir.FormShow(Sender: TObject);
begin
  PostMessage(Self.Handle, WM_AFTER_SHOW, 0, 0);
end;

procedure TFDaftarHadir.WmAfterShow(var Msg: TMessage);
begin
  segarkan;
end;

procedure TFDaftarHadir.WMMDIACTIVATE(var msg: TWMMDIACTIVATE);
var
  active: TWinControl;
  idx: Integer;
begin
  active := FindControl(msg.ActiveWnd);
  if not (dm.metu_kabeh) then
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
begin
  segarkan;
end;

procedure TFDaftarHadir.segarkan;
var
  sql : string;
begin
  sql := 'SELECT user_id,checkin_time,checkout_time, ' +
  'TIMEDIFF(checkout_time,checkin_time) AS Total, ' +
  'IFNULL(fx_pembulatan(checkout_time,checkin_time),0) AS Jam, ' +
  'keterangan AS keterangan FROM tb_checkinout ' +
  'WHERE user_id = "'+edID.Text+'"  AND date(checkin_time) >= '+
  quotedstr(FormatDateTime('yyyy-MM-dd',deMulai.Date))+' AND date(checkin_time) <= '+
  quotedstr(FormatDateTime('yyyy-MM-dd',deSampai.Date))+'ORDER BY checkin_time DESC';
  
  dm.SQLExec(QDaftarHadir, sql, true);
end;

end.
