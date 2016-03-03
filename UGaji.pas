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
    edGajiHadir: TsCurrencyEdit;
    edGajiTransport: TsCurrencyEdit;
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
    ed1: TsCurrencyEdit;
    ed2: TsCurrencyEdit;
    ed3: TsCurrencyEdit;
    ed4: TsCurrencyEdit;
    sLabel23: TsLabel;
    ed5: TsCurrencyEdit;
    sLabel24: TsLabel;
    ed6: TsCurrencyEdit;
    sLabel25: TsLabel;
    ed_nilai_faktur: TsCurrencyEdit;
    sLabel26: TsLabel;
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

end.
