unit UUser;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, sEdit, sLabel, Mask, sMaskEdit, sCustomComboEdit,
  sTooledit, sGroupBox, ExtCtrls, sButton, sPanel;

type
  TFUser = class(TForm)
    lbl1: TsLabel;
    ed1: TsEdit;
    sEdit1: TsEdit;
    sLabel1: TsLabel;
    sEdit2: TsEdit;
    sLabel2: TsLabel;
    sEdit3: TsEdit;
    sLabel3: TsLabel;
    sEdit4: TsEdit;
    sLabel4: TsLabel;
    sEdit5: TsEdit;
    sLabel5: TsLabel;
    sEdit6: TsEdit;
    sLabel6: TsLabel;
    deTanggalMasuk: TsDateEdit;
    deTanggalKeluar: TsDateEdit;
    sLabel7: TsLabel;
    sLabel8: TsLabel;
    sLabel10: TsLabel;
    rgJenisKelamin: TsRadioGroup;
    sLabel12: TsLabel;
    sEdit7: TsEdit;
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
