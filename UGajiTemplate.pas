unit UGajiTemplate;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, sPanel, StdCtrls, sEdit, sLabel, Mask, sMaskEdit,
  sCustomComboEdit, sCurrEdit, sCurrencyEdit, sGroupBox, sButton;

type
  TFGajiTemplate = class(TForm)
    pnlHeader: TsPanel;
    sLabel1: TsLabel;
    sLabel2: TsLabel;
    edId: TsEdit;
    edNama: TsEdit;
    gbGajiPokok: TsGroupBox;
    edGajiPokok: TsCurrencyEdit;
    sLabel4: TsLabel;
    sLabel5: TsLabel;
    pnlFooter: TsPanel;
    btnSimpan: TsButton;
    btnBatal: TsButton;
    sLabel6: TsLabel;
    sLabel7: TsLabel;
    edKonsumsi: TsCurrencyEdit;
    edHadir: TsCurrencyEdit;
    edTransport: TsCurrencyEdit;
    gbTunjangan: TsGroupBox;
    edJabatan: TsCurrencyEdit;
    sLabel14: TsLabel;
    sLabel15: TsLabel;
    sLabel16: TsLabel;
    edMasaKerja: TsCurrencyEdit;
    edKesehatan: TsCurrencyEdit;
    gbPotongan: TsGroupBox;
    sLabel20: TsLabel;
    sLabel21: TsLabel;
    edAngsuranDuta: TsCurrencyEdit;
    edAngsuranBank: TsCurrencyEdit;
    procedure FormShow(Sender: TObject);
    procedure btnSimpanClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    periode: string;
  end;

var
  FGajiTemplate: TFGajiTemplate;

implementation

uses UDM;

{$R *.dfm}

procedure TFGajiTemplate.FormShow(Sender: TObject);
var
  sql: string;
begin
  sql:= 'SELECT * FROM tb_user_gaji_template WHERE user_id = "'+edId.Text +'"';

  DM.SQLExec(DM.QShow,sql,True);

  edGajiPokok.Value := DM.QShow.FieldByName('pokok').AsInteger;
  edHadir.Value := DM.QShow.FieldByName('jam_hadir').AsInteger;
  edTransport.Value := DM.QShow.FieldByName('transport').AsInteger;
  edKonsumsi.Value := DM.QShow.FieldByName('konsumsi').AsInteger;
  edJabatan.Value := DM.QShow.FieldByName('jabatan').AsInteger;
  edMasaKerja.Value := DM.QShow.FieldByName('masa_kerja').AsInteger;
  edKesehatan.Value := DM.QShow.FieldByName('kesehatan').AsInteger;
  edAngsuranDuta.Value := DM.QShow.FieldByName('angsuran_duta').AsInteger;
  edAngsuranBank.Value := DM.QShow.FieldByName('angsuran_bank').AsInteger;
end;

procedure TFGajiTemplate.btnSimpanClick(Sender: TObject);
var
  sql: string;
begin
  sql:= Format('REPLACE INTO tb_user_gaji_template(user_id, pokok, jam_hadir,'
  +' transport, konsumsi, jabatan, masa_kerja, kesehatan, angsuran_duta,'
  + 'angsuran_bank) VALUES ("%s", %s, %s, %s, %s, %s, %s, %s, %s, %s)',
  [edId.Text,edGajiPokok.Text,edHadir.Text,edTransport.Text,
  edKonsumsi.Text,edJabatan.Text,edMasaKerja.Text,edKesehatan.Text,
  edAngsuranDuta.Text,edAngsuranBank.Text]);

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
