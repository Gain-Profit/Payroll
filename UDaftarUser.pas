unit UDaftarUser;

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
  TFDaftarUser = class(TForm)
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
    TvDataAlamat: TcxGridDBColumn;
    TvDataKontak: TcxGridDBColumn;
    TvDataTanggal_masuk: TcxGridDBColumn;
    TvDataTanggal_Keluar: TcxGridDBColumn;
    TvDataAktif: TcxGridDBColumn;
    pnlButton: TsPanel;
    btntambah: TsButton;
    btnEdit: TsButton;
    btnDuplikat: TsButton;
    TvDataemail: TcxGridDBColumn;
    TvDatasex: TcxGridDBColumn;
    TvDatakawin: TcxGridDBColumn;
    TvDatajabatan: TcxGridDBColumn;
    TvDatapendidikan: TcxGridDBColumn;
    TvDataTanggalLahir: TcxGridDBColumn;
    TvDataRekening: TcxGridDBColumn;
    procedure WMMDIACTIVATE(var msg: TWMMDIACTIVATE); message WM_MDIACTIVATE;
    procedure FormShow(Sender: TObject);
    procedure sbKeluarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure sbRefreshClick(Sender: TObject);
    procedure TvDataCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure btntambahClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnDuplikatClick(Sender: TObject);
  private
    procedure WmAfterShow(var Msg: TMessage); message WM_AFTER_SHOW;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FDaftarUser: TFDaftarUser;

implementation

uses
  UMain, UDM, URegister, UDaftarHadir, UUser;

{$R *.dfm}

procedure TFDaftarUser.FormCreate(Sender: TObject);
begin
  FMain.MDIChildCreated(self.Handle);
end;

procedure TFDaftarUser.FormShow(Sender: TObject);
begin
  PostMessage(Self.Handle, WM_AFTER_SHOW, 0, 0);
end;

procedure TFDaftarUser.WmAfterShow(var Msg: TMessage);
begin
  dm.SQLExec(dm.QUser, 'SELECT * FROM tb_user', true);
  tvdata.DataController.FocusedRowIndex := 1;
end;

procedure TFDaftarUser.sbKeluarClick(Sender: TObject);
begin
  Close;
end;

procedure TFDaftarUser.WMMDIACTIVATE(var msg: TWMMDIACTIVATE);
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

procedure TFDaftarUser.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FMain.MDIChildDestroyed(Self.Handle);
  action := cafree;
  FDaftarUser := nil;
end;

procedure TFDaftarUser.sbRefreshClick(Sender: TObject);
var
  posisi: integer;
begin
  posisi := tvdata.DataController.DataSource.DataSet.RecNo;
  tvdata.DataController.DataSource.DataSet.Close;
  tvdata.DataController.DataSource.DataSet.Open;
  tvdata.DataController.DataSource.DataSet.RecNo := posisi;
end;

procedure TFDaftarUser.TvDataCellDblClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  btnEditClick(Sender);
end;

procedure TFDaftarUser.btntambahClick(Sender: TObject);
begin
  Application.CreateForm(TFUser, FUser);
  FUser.BuatDataBaru;
  FUser.ShowModal;
  sbRefreshClick(Sender);
end;

procedure TFDaftarUser.btnEditClick(Sender: TObject);
begin
  Application.CreateForm(TFUser, FUser);
  FUser.ShowData;
  FUser.ShowModal;
  sbRefreshClick(Sender);
end;

procedure TFDaftarUser.btnDuplikatClick(Sender: TObject);
begin
  Application.CreateForm(TFUser, FUser);
  FUser.DuplicateData;
  FUser.ShowModal;
  sbRefreshClick(Sender);
end;

end.

