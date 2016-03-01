unit UDaftarKaryawan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, DB, cxDBData, cxTextEdit, cxSpinEdit, sSkinProvider, StdCtrls, sButton,
  Buttons, sSpeedButton, sEdit, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls, cxGridCustomView,
  cxGrid, ExtCtrls, sPanel;

const
  WM_AFTER_SHOW = WM_USER + 300; // custom message

type
  TFDaftarKaryawan = class(TForm)
    sPanel2: TsPanel;
    grid: TcxGrid;
    TvData: TcxGridDBTableView;
    lvData: TcxGridLevel;
    sPanel1: TsPanel;
    sb_2: TsSpeedButton;
    sb_1: TsSpeedButton;
    spnl1: TsPanel;
    btnRegister: TsButton;
    sSkinProvider1: TsSkinProvider;
    TvDatakd_user: TcxGridDBColumn;
    TvDatan_user: TcxGridDBColumn;
    TvDataAlamat: TcxGridDBColumn;
    TvDataKontak: TcxGridDBColumn;
    TvDataCheckClock: TcxGridDBColumn;
    btnDaftarHadir: TsButton;
    procedure WMMDIACTIVATE(var msg: TWMMDIACTIVATE); message WM_MDIACTIVATE;
    procedure FormShow(Sender: TObject);
    procedure sb_1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure sb_2Click(Sender: TObject);
    procedure TvDataCustomDrawCell(Sender: TcxCustomGridTableView; ACanvas:
      TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure btnRegisterClick(Sender: TObject);
    procedure btnDaftarHadirClick(Sender: TObject);
    procedure TvDataCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
  private
    procedure WmAfterShow(var Msg: TMessage); message WM_AFTER_SHOW;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FDaftarKaryawan: TFDaftarKaryawan;

implementation

uses
  UMain, UDM, URegister, UDaftarHadir;

{$R *.dfm}

procedure TFDaftarKaryawan.FormCreate(Sender: TObject);
begin
  FMain.MDIChildCreated(self.Handle);
end;

procedure TFDaftarKaryawan.FormShow(Sender: TObject);
begin
  PostMessage(Self.Handle, WM_AFTER_SHOW, 0, 0);
end;

procedure TFDaftarKaryawan.WmAfterShow(var Msg: TMessage);
begin
  dm.SQLExec(dm.QKaryawan, 'SELECT kd_user,n_user,Alamat,Kontak, ' +
    'fx_clock_registered(kd_user) AS CheckClock FROM tb_user', true);
  tvdata.DataController.FocusedRowIndex := 1;
end;

procedure TFDaftarKaryawan.sb_1Click(Sender: TObject);
begin
  Close;
end;

procedure TFDaftarKaryawan.WMMDIACTIVATE(var msg: TWMMDIACTIVATE);
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

procedure TFDaftarKaryawan.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FMain.MDIChildDestroyed(Self.Handle);
  action := cafree;
  FDaftarKaryawan := nil;
end;

procedure TFDaftarKaryawan.sb_2Click(Sender: TObject);
var
  posisi: integer;
begin
  posisi := tvdata.DataController.DataSource.DataSet.RecNo;
  tvdata.DataController.DataSource.DataSet.Close;
  tvdata.DataController.DataSource.DataSet.Open;
  tvdata.DataController.DataSource.DataSet.RecNo := posisi;
end;

procedure TFDaftarKaryawan.TvDataCustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  if (AViewInfo.Text = 'BELUM TERDAFTAR') then
  begin
    ACanvas.Font.Color := clYellow;
    ACanvas.Brush.Color := clRed;
  end;
end;

procedure TFDaftarKaryawan.btnRegisterClick(Sender: TObject);
begin
  Application.CreateForm(TFRegister, FRegister);
  FRegister.ShowModal;
end;

procedure TFDaftarKaryawan.btnDaftarHadirClick(Sender: TObject);
begin
  Application.CreateForm(TFDaftarHadir, FDaftarHadir);
  FDaftarHadir.Show;
end;

procedure TFDaftarKaryawan.TvDataCellDblClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  Application.CreateForm(TFDaftarHadir, FDaftarHadir);
  FDaftarHadir.Show;
end;

end.

