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
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnSimpanClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    dataBaru: Boolean;
  end;

var
  FUser: TFUser;

implementation

{$R *.dfm}
{
  procedure yang digunakan untuk menampilkan data.
}
procedure TFUser.ShowData;
begin
  // data baru dibuat false karena database akan di edit.
  dataBaru := False;
end;

{
  procedure yang digunakan untuk duplikate data.
}
procedure TFUser.DuplicateData;
begin
  // dataBaru dibuat True karena data hanya diduplikat saja.
  dataBaru := True;
end;

procedure TFUser.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key = vk_escape then
  Close;
end;

{
  Procedure untuk menyimpan data kedalam database.
}
procedure TFUser.btnSimpanClick(Sender: TObject);
begin
  // simpan data
end;

end.
