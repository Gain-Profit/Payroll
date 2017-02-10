unit UGaji;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, sPanel, sEdit, sLabel, 
  sCurrEdit, sCurrencyEdit, sGroupBox, sButton, StdCtrls, Mask, sMaskEdit,
  sCustomComboEdit;

type
  TFGaji = class(TForm)
    pnlHeader: TsPanel;
    sLabel1: TsLabel;
    sLabel2: TsLabel;
    edId: TsEdit;
    edNama: TsEdit;
    sLabel3: TsLabel;
    edPeriode: TsEdit;
    gbGajiPokok: TsGroupBox;
    edGajiPokok: TsCurrencyEdit;
    sLabel4: TsLabel;
    sLabel5: TsLabel;
    pnlFooter: TsPanel;
    btnLoad: TsButton;
    btnSimpan: TsButton;
    btnBatal: TsButton;
    sLabel6: TsLabel;
    sLabel7: TsLabel;
    sLabel8: TsLabel;
    edKonsumsi: TsCurrencyEdit;
    edInsentif: TsCurrencyEdit;
    edJam: TsCurrencyEdit;
    edHari: TsCurrencyEdit;
    edHadir: TsCurrencyEdit;
    edTransport: TsCurrencyEdit;
    sLabel9: TsLabel;
    edTemplateHadir: TsCurrencyEdit;
    edTemplateTransport: TsCurrencyEdit;
    sLabel10: TsLabel;
    sLabel11: TsLabel;
    sLabel12: TsLabel;
    sLabel13: TsLabel;
    edTotalGajiPokok: TsCurrencyEdit;
    gbTunjangan: TsGroupBox;
    edJabatan: TsCurrencyEdit;
    sLabel14: TsLabel;
    sLabel15: TsLabel;
    sLabel16: TsLabel;
    sLabel17: TsLabel;
    sLabel18: TsLabel;
    sLabel19: TsLabel;
    edMasaKerja: TsCurrencyEdit;
    edKesehatan: TsCurrencyEdit;
    edHariRaya: TsCurrencyEdit;
    edTunjanganLain: TsCurrencyEdit;
    edAkhirTahun: TsCurrencyEdit;
    gbPotongan: TsGroupBox;
    sLabel20: TsLabel;
    sLabel21: TsLabel;
    sLabel22: TsLabel;
    edAngsuranDuta: TsCurrencyEdit;
    edAngsuranBank: TsCurrencyEdit;
    edCashBon: TsCurrencyEdit;
    edPotonganLain: TsCurrencyEdit;
    sLabel23: TsLabel;
    edTotalTunjangan: TsCurrencyEdit;
    sLabel24: TsLabel;
    edTotalPotongan: TsCurrencyEdit;
    sLabel25: TsLabel;
    pnlTotalGaji: TsPanel;
    sLabel26: TsLabel;
    edTotalGaji: TsCurrencyEdit;
    edTahun: TsCurrencyEdit;
    sLabel27: TsLabel;
    edTemplateMasaKerja: TsCurrencyEdit;
    sLabel28: TsLabel;
    sLabel29: TsLabel;
    edLembur: TsCurrencyEdit;
    procedure HitungGaji;
    function GetTemplateFromData(BilPertama: Real; BilanganKedua: Real): Real;
    procedure LoadData;
    procedure FormShow(Sender: TObject);
    procedure editExit(Sender: TObject);
    procedure btnLoadClick(Sender: TObject);
    procedure btnSimpanClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    periode: string;
  end;

var
  FGaji: TFGaji;

implementation

uses UDM;

{$R *.dfm}

procedure TFGaji.HitungGaji;
begin
  edHadir.Value := edJam.Value * edTemplateHadir.Value;
  edTransport.Value := edHari.Value * edTemplateTransport.Value;
  edMasaKerja.Value := edTahun.Value * edTemplateMasaKerja.Value;

  edTotalGajiPokok.Value := edGajiPokok.Value + edKonsumsi.Value + edInsentif.Value +
  edHadir.Value + edTransport.Value + edLembur.Value;

  edTotalTunjangan.Value := edJabatan.Value + edMasaKerja.Value + edKesehatan.Value +
  edHariRaya.Value + edAkhirTahun.Value + edTunjanganLain.Value;

  edTotalPotongan.Value := edAngsuranDuta.Value + edAngsuranBank.Value +
  edCashBon.Value + edPotonganLain.Value;

  edTotalGaji.Value := edTotalGajiPokok.Value + edTotalTunjangan.Value -
  edTotalPotongan.Value;
end;


function TFGaji.GetTemplateFromData(BilPertama: Real; BilanganKedua: Real): Real;
begin
  if BilanganKedua = 0 then
    Result := 0
  else
    Result := BilPertama / BilanganKedua;
end;

procedure TFGaji.LoadData;
var
  sql: string;
begin
  sql:= 'SELECT * FROM tb_user_gaji WHERE user_id = "'+edId.Text +'" AND'
  + ' periode = "'+periode+'"';

  DM.SQLExec(DM.QShow,sql,True);

  edGajiPokok.Value := DM.QShow.FieldByName('pokok').AsInteger;
  edHadir.Value := DM.QShow.FieldByName('jam_hadir').AsInteger;
  edTransport.Value := DM.QShow.FieldByName('transport').AsInteger;
  edKonsumsi.Value := DM.QShow.FieldByName('konsumsi').AsInteger;
  edInsentif.Value :=  DM.QShow.FieldByName('insentif').AsInteger;
  edLembur.Value :=  DM.QShow.FieldByName('lembur').AsInteger;
  edJabatan.Value := DM.QShow.FieldByName('jabatan').AsInteger;
  edMasaKerja.Value := DM.QShow.FieldByName('masa_kerja').AsInteger;
  edKesehatan.Value := DM.QShow.FieldByName('kesehatan').AsInteger;
  edHariRaya.Value :=  DM.QShow.FieldByName('hari_raya').AsInteger;
  edAkhirTahun.Value :=  DM.QShow.FieldByName('akhir_tahun').AsInteger;
  edTunjanganLain.Value :=  DM.QShow.FieldByName('tunjangan_lain').AsInteger;
  edAngsuranDuta.Value := DM.QShow.FieldByName('angsuran_duta').AsInteger;
  edAngsuranBank.Value := DM.QShow.FieldByName('angsuran_bank').AsInteger;
  edCashBon.Value :=  DM.QShow.FieldByName('cash_bon').AsInteger;
  edPotonganLain.Value :=  DM.QShow.FieldByName('potongan_lain').AsInteger;

  edTemplateHadir.Value := GetTemplateFromData(edHadir.Value,edJam.Value);
  edTemplateTransport.Value := GetTemplateFromData(edTransport.Value,edHari.Value);
  edTemplateMasaKerja.Value := GetTemplateFromData(edMasaKerja.Value,edTahun.Value);
  HitungGaji;
end;

procedure TFGaji.FormShow(Sender: TObject);
var
  sql,DatePeriode: string;
begin
  DatePeriode:= periode;          // 201603
  Insert('-',DatePeriode,5);      // 2016-03
  Insert('-01',DatePeriode,8);    // 2016-03-01

  sql:= 'SELECT SUM(fx_pembulatan(checkout_time,checkin_time)) AS Total_Jam'
  +' FROM tb_checkinout WHERE user_id ="'+ edId.Text +'" AND'
  +' EXTRACT(YEAR_MONTH FROM checkin_time) ="'+periode+'" GROUP BY'
  +' EXTRACT(YEAR_MONTH FROM checkin_time)';

  DM.SQLExec(DM.QShow,sql,True);
  edJam.Value := DM.QShow.FieldByName('Total_Jam').AsInteger;

  sql:= 'SELECT COUNT(DISTINCT DATE(checkin_time)) AS Total_Hari'
  +' FROM tb_checkinout WHERE user_id ="'+ edId.Text +'" AND'
  +' EXTRACT(YEAR_MONTH FROM checkin_time) ="'+periode+'"';

  DM.SQLExec(DM.QShow,sql,True);
  edHari.Value := DM.QShow.FieldByName('Total_Hari').AsInteger;

  sql:= 'SELECT TIMESTAMPDIFF(YEAR,tanggal_masuk,LAST_DAY("'+DatePeriode+'"))'
  +' AS Total_Tahun FROM tb_user WHERE kd_user ="'+ edId.Text +'"';

  DM.SQLExec(DM.QShow,sql,True);
  edTahun.Value := DM.QShow.FieldByName('Total_Tahun').AsInteger;

  LoadData;
end;

procedure TFGaji.editExit(Sender: TObject);
begin
  HitungGaji;
end;

procedure TFGaji.btnLoadClick(Sender: TObject);
var
  sql: string;
begin
  sql:= 'SELECT * FROM tb_user_gaji_template WHERE user_id ="'+edId.Text +'"';

  DM.SQLExec(DM.QShow,sql,True);

  edGajiPokok.Value := DM.QShow.FieldByName('pokok').AsInteger;
  edTemplateHadir.Value := DM.QShow.FieldByName('jam_hadir').AsInteger;
  edTemplateTransport.Value := DM.QShow.FieldByName('transport').AsInteger;
  edKonsumsi.Value := DM.QShow.FieldByName('konsumsi').AsInteger;
  edJabatan.Value := DM.QShow.FieldByName('jabatan').AsInteger;
  edTemplateMasaKerja.Value := DM.QShow.FieldByName('masa_kerja').AsInteger;
  edKesehatan.Value := DM.QShow.FieldByName('kesehatan').AsInteger;
  edAngsuranDuta.Value := DM.QShow.FieldByName('angsuran_duta').AsInteger;
  edAngsuranBank.Value := DM.QShow.FieldByName('angsuran_bank').AsInteger;

  HitungGaji;
end;

procedure TFGaji.btnSimpanClick(Sender: TObject);
var
  sql: string;
begin
  sql:= Format('REPLACE INTO tb_user_gaji(user_id, periode, pokok, jam_hadir,'
  +' transport, konsumsi, insentif, lembur, jabatan, masa_kerja, kesehatan, hari_raya,'
  + 'akhir_tahun, tunjangan_lain, angsuran_duta, angsuran_bank, cash_bon,'
  + 'potongan_lain) VALUES ("%s", %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s,'
  + '%s,%s,%s,%s,%s,%s)',[edId.Text,periode,edGajiPokok.Text,edHadir.Text,
  edTransport.Text,edKonsumsi.Text,edInsentif.Text,edLembur.Text,edJabatan.Text,edMasaKerja.Text,
  edKesehatan.Text,edHariRaya.Text,edAkhirTahun.Text,edTunjanganLain.Text,
  edAngsuranDuta.Text,edAngsuranBank.Text,edCashBon.Text,edPotonganLain.Text]);

  try
    DM.SQLExec(dm.Qexe, sql, False);
    ShowMessage('Data Berhasil Disimpan ke database...');
    Close;
  except
    on e: Exception do
      ShowMessage('data tidak berhasil disimpan, '#10#13'' + e.Message);
  end;
end;

end.
