unit UUser;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, sEdit, sLabel, Mask, sMaskEdit, sCustomComboEdit,
  sTooledit, sGroupBox, ExtCtrls, sButton, sPanel, sRadioButton;

type
  TFUser = class(TForm)
    lbl1: TsLabel;
    edKodeUser: TsEdit;
    edNamaUser: TsEdit;
    sLabel1: TsLabel;
    edAlamat: TsEdit;
    sLabel2: TsLabel;
    edKontak: TsEdit;
    sLabel3: TsLabel;
    edEmail: TsEdit;
    sLabel4: TsLabel;
    edJabatan: TsEdit;
    sLabel5: TsLabel;
    edPendidikan: TsEdit;
    sLabel6: TsLabel;
    deTanggalMasuk: TsDateEdit;
    deTanggalKeluar: TsDateEdit;
    sLabel7: TsLabel;
    sLabel8: TsLabel;
    sLabel10: TsLabel;
    rgJenisKelamin: TsRadioGroup;
    sLabel12: TsLabel;
    edPassword: TsEdit;
    deTanggalLahir: TsDateEdit;
    rgStatusPerkawinan: TsRadioGroup;
    rgStatusAktif: TsRadioGroup;
    imgUser: TImage;
    pnlBawah: TsPanel;
    btnSimpan: TsButton;
    btnBatal: TsButton;
  procedure ShowData;
  procedure DuplicateData;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FUser: TFUser;

implementation

{$R *.dfm}

procedure TFUser.ShowData;
begin
// Show data
end;

procedure TFUser.DuplicateData;
begin
// duplicate data
end;

end.
