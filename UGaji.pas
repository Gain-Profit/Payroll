unit UGaji;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, sPanel, StdCtrls, sEdit, sLabel, Mask, sMaskEdit,
  sCustomComboEdit, sCurrEdit, sCurrencyEdit, sGroupBox, sButton;

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
    edTransportasi: TsCurrencyEdit;
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
    procedure editExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    periode: string;
  end;

var
  FGaji: TFGaji;

implementation

{$R *.dfm}

procedure TFGaji.editExit(Sender: TObject);
begin
  edTotalGajiPokok.Value := edGajiPokok.Value + edKonsumsi.Value + edInsentif.Value +
  edHadir.Value + edTransportasi.Value;

  edTotalTunjangan.Value := edJabatan.Value + edMasaKerja.Value + edKesehatan.Value +
  edHariRaya.Value + edAkhirTahun.Value + edTunjanganLain.Value;

  edTotalPotongan.Value := edAngsuranDuta.Value + edAngsuranBank.Value +
  edCashBon.Value + edPotonganLain.Value;

  edTotalGaji.Value := edTotalGajiPokok.Value + edTotalTunjangan.Value -
  edTotalPotongan.Value;  
end;

end.
