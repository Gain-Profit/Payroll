unit UDaftarGaji;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, DB, cxDBData, cxTextEdit, cxSpinEdit, sSkinProvider, StdCtrls, sButton,
  Buttons, sSpeedButton, sEdit, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls, cxGridCustomView,
  cxGrid, ExtCtrls, sPanel, Mask, sMaskEdit, sCustomComboEdit, sTooledit, sLabel,
  ComCtrls, sComboBox, cxCurrencyEdit;

const
  WM_AFTER_SHOW = WM_USER + 300; // custom message

type
  TFDaftarGaji = class(TForm)
    sPanel2: TsPanel;
    grid: TcxGrid;
    TvData: TcxGridDBTableView;
    lvData: TcxGridLevel;
    sPanel1: TsPanel;
    sbRefresh: TsSpeedButton;
    sbKeluar: TsSpeedButton;
    sSkinProvider1: TsSkinProvider;
    TvDatakd_user: TcxGridDBColumn;
    TvDatan_user: TcxGridDBColumn;
    pnlPeriode: TsPanel;
    l_1: TsLabel;
    pnlButton: TsPanel;
    btnEdit: TsButton;
    cbBulan: TsComboBox;
    sLabel1: TsLabel;
    edTahun: TsEdit;
    TvDataGaji_Pokok: TcxGridDBColumn;
    TvDataTunjangan: TcxGridDBColumn;
    TvDataPotongan: TcxGridDBColumn;
    TvDataTotal_Gaji: TcxGridDBColumn;
    btnCetak: TsButton;
    procedure WMMDIACTIVATE(var msg: TWMMDIACTIVATE); message WM_MDIACTIVATE;
    procedure refreshData;
    procedure FormShow(Sender: TObject);
    procedure sbKeluarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure sbRefreshClick(Sender: TObject);
    procedure TvDataCellDblClick(Sender: TcxCustomGridTableView; ACellViewInfo:
      TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift: TShiftState;
      var AHandled: Boolean);
    procedure btnEditClick(Sender: TObject);
    function GetPeriode:string;
    procedure btnCetakClick(Sender: TObject);
  private
    procedure WmAfterShow(var Msg: TMessage); message WM_AFTER_SHOW;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FDaftarGaji: TFDaftarGaji;

implementation

uses
  UMain, UDM, URegister, UDaftarHadir, UUser, UGaji;

{$R *.dfm}

procedure TFDaftarGaji.FormCreate(Sender: TObject);
var
  Year, Month, Day: Word;
begin
  DecodeDate(Now, Year, Month, Day);
  cbBulan.ItemIndex := Month - 1;
  edTahun.Text := IntToStr(Year);

  FMain.MDIChildCreated(self.Handle);
end;

procedure TFDaftarGaji.FormShow(Sender: TObject);
begin
  PostMessage(Self.Handle, WM_AFTER_SHOW, 0, 0);
end;

procedure TFDaftarGaji.WmAfterShow(var Msg: TMessage);
begin
  refreshData;
  tvdata.DataController.FocusedRowIndex := 1;
end;

procedure TFDaftarGaji.sbKeluarClick(Sender: TObject);
begin
  Close;
end;

procedure TFDaftarGaji.WMMDIACTIVATE(var msg: TWMMDIACTIVATE);
var
  active: TWinControl;
  idx: Integer;
begin
  active := FindControl(msg.ActiveWnd);
  if not (DM.metu_kabeh) then
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

procedure TFDaftarGaji.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FMain.MDIChildDestroyed(Self.Handle);
  action := cafree;
  FDaftarGaji := nil;
end;

procedure TFDaftarGaji.sbRefreshClick(Sender: TObject);
begin
  refreshData;
end;

procedure TFDaftarGaji.TvDataCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift:
  TShiftState; var AHandled: Boolean);
begin
  btnEditClick(Sender);
end;

procedure TFDaftarGaji.btnEditClick(Sender: TObject);
begin
  Application.CreateForm(TFGaji, FGaji);
  FGaji.edId.Text := dm.QGaji.FieldByName('kd_user').AsString;
  FGaji.edNama.Text := dm.QGaji.FieldByName('n_user').AsString;
  FGaji.edPeriode.Text := cbBulan.Text + ' ' + edTahun.Text;
  FGaji.periode := GetPeriode;
  FGaji.ShowModal;
  refreshData;
end;

procedure TFDaftarGaji.refreshData;
var
  sql: string;
begin
  sql := 'SELECT us.kd_user, us.n_user, gj.pokok + gj.jam_hadir + gj.transport + '
    + 'gj.konsumsi + gj.insentif + gj.lembur AS gaji_pokok, gj.jabatan + gj.masa_kerja + '
    + 'gj.kesehatan + gj.hari_raya + gj.akhir_tahun + gj.tunjangan_lain AS tunjangan, '
    + 'gj.angsuran_duta + gj.angsuran_bank + gj.cash_bon + gj.potongan_lain AS potongan, '
    + '(gj.pokok + gj.jam_hadir + gj.transport + gj.konsumsi + gj.insentif + gj.lembur) + '
    + '(gj.jabatan + gj.masa_kerja + gj.kesehatan + gj.hari_raya + gj.akhir_tahun + '
    + 'gj.tunjangan_lain) - (gj.angsuran_duta + gj.angsuran_bank + gj.cash_bon + '
    + 'gj.potongan_lain) AS Total_Gaji FROM tb_user us LEFT JOIN tb_user_gaji gj '
    + 'ON (((us.kd_user = gj.user_id) AND (gj.periode = ' + GetPeriode + '))) '
    + 'WHERE us.aktif="Y" ORDER BY us.kd_user';

  dm.SQLExec(dm.QGaji, sql, true);
end;

function TFDaftarGaji.GetPeriode: string;
var
  ix, periode: string;
begin
  ix := IntToStr(cbBulan.ItemIndex + 1);

  if Length(ix) = 1 then
    periode := edTahun.Text + '0' + ix
  else
    periode := edTahun.Text + ix;

  Result := periode;
end;

procedure TFDaftarGaji.btnCetakClick(Sender: TObject);
var
  sql: string;
begin
  sql:= 'SELECT * FROM vw_user_gaji WHERE periode = "'+ GetPeriode +'"';
  DM.SQLExec(dm.QLaporan,sql,true);
  DM.laporan.LoadFromFile(dm.WPath + 'laporan\gaji.fr3');
  DM.laporan.ShowReport;
end;

end.

