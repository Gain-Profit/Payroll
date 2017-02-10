unit UDaftarGajiTemplate;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxDataStorage,
  cxEdit, DB, cxDBData, cxTextEdit, cxSpinEdit, sSkinProvider, sButton,
  Buttons, sSpeedButton, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls, cxGridCustomView,
  cxGrid, ExtCtrls, sPanel, 
  ComCtrls, cxCurrencyEdit, cxFilter, cxData, StdCtrls;

const
  WM_AFTER_SHOW = WM_USER + 300; // custom message

type
  TFDaftarGajiTemplate = class(TForm)
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
    pnlButton: TsPanel;
    btnEdit: TsButton;
    TvDatapokok: TcxGridDBColumn;
    TvDatajam_hadir: TcxGridDBColumn;
    TvDatatransport: TcxGridDBColumn;
    TvDatakonsumsi: TcxGridDBColumn;
    TvDatajabatan: TcxGridDBColumn;
    TvDatamasa_kerja: TcxGridDBColumn;
    TvDatakesehatan: TcxGridDBColumn;
    TvDataangsuran_duta: TcxGridDBColumn;
    TvDataangsuran_bank: TcxGridDBColumn;
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
  private
    procedure WmAfterShow(var Msg: TMessage); message WM_AFTER_SHOW;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FDaftarGajiTemplate: TFDaftarGajiTemplate;

implementation

uses
  UMain, UDM, UGajiTemplate;

{$R *.dfm}

procedure TFDaftarGajiTemplate.FormCreate(Sender: TObject);
begin
  FMain.MDIChildCreated(self.Handle);
end;

procedure TFDaftarGajiTemplate.FormShow(Sender: TObject);
begin
  PostMessage(Self.Handle, WM_AFTER_SHOW, 0, 0);
end;

procedure TFDaftarGajiTemplate.WmAfterShow(var Msg: TMessage);
begin
  refreshData;
  tvdata.DataController.FocusedRowIndex := 1;
end;

procedure TFDaftarGajiTemplate.sbKeluarClick(Sender: TObject);
begin
  Close;
end;

procedure TFDaftarGajiTemplate.WMMDIACTIVATE(var msg: TWMMDIACTIVATE);
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

procedure TFDaftarGajiTemplate.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FMain.MDIChildDestroyed(Self.Handle);
  action := cafree;
  FDaftarGajiTemplate := nil;
end;

procedure TFDaftarGajiTemplate.sbRefreshClick(Sender: TObject);
begin
  refreshData;
end;

procedure TFDaftarGajiTemplate.TvDataCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift:
  TShiftState; var AHandled: Boolean);
begin
  btnEditClick(Sender);
end;

procedure TFDaftarGajiTemplate.btnEditClick(Sender: TObject);
begin
  Application.CreateForm(TFGajiTemplate, FGajiTemplate);
  FGajiTemplate.edId.Text := dm.QGajiTemp.FieldByName('kd_user').AsString;
  FGajiTemplate.edNama.Text := dm.QGajiTemp.FieldByName('n_user').AsString;
  FGajiTemplate.ShowModal;
  refreshData;
end;

procedure TFDaftarGajiTemplate.refreshData;
var
  sql: string;
begin
  sql := 'SELECT us.kd_user, us.n_user, gt.pokok, gt.jam_hadir, gt.transport,'
  + ' gt.konsumsi, gt.jabatan, gt.masa_kerja, gt.kesehatan, gt.angsuran_duta,'
  + ' gt.angsuran_bank FROM tb_user us LEFT JOIN tb_user_gaji_template gt'
  + ' ON us.kd_user = gt.user_id WHERE us.aktif="Y" ORDER BY us.kd_user';

  dm.SQLExec(dm.QGajiTemp, sql, true);
end;

end.

