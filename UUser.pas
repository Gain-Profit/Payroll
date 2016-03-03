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
  procedure loadData;
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

uses UDM;

{$R *.dfm}

{
  procedure untuk load data dari database.
}
procedure TFUser.loadData;
begin
  edKodeUser.Text   := DM.QUser.FieldByName('kd_user').AsString;
  edNamaUser.Text   := DM.QUser.FieldByName('n_user').AsString;
  edAlamat.Text     := DM.QUser.FieldByName('alamat').AsString;
  edKontak.Text     := DM.QUser.FieldByName('kontak').AsString;
  edEmail.Text      := DM.QUser.FieldByName('email').AsString;
  edPendidikan.Text := DM.QUser.FieldByName('pendidikan').AsString;
  edJabatan.Text    := DM.QUser.FieldByName('jabatan').AsString;

  if DM.QUser.FieldByName('sex').AsString = 'L' then
    rgJenisKelamin.ItemIndex := 0 else
    rgJenisKelamin.ItemIndex := 1;
  if DM.QUser.FieldByName('kawin').AsBoolean then
    rgStatusPerkawinan.ItemIndex := 0 else
    rgStatusPerkawinan.ItemIndex := 1;
  if DM.QUser.FieldByName('aktif').AsBoolean then
    rgStatusAktif.ItemIndex := 0 else
    rgStatusAktif.ItemIndex := 1;

  deTanggalLahir.Date := DM.QUser.FieldByName('tanggal_lahir').AsDateTime;
  deTanggalMasuk.Date := DM.QUser.FieldByName('tanggal_masuk').AsDateTime;
  deTanggalKeluar.Date:= DM.QUser.FieldByName('tanggal_keluar').AsDateTime;
end;

{
  procedure yang digunakan untuk menampilkan data.
}
procedure TFUser.ShowData;
begin
  // data baru dibuat false karena database akan di edit.
  dataBaru := False;
  // tidak bisa update kode user.
  edKodeUser.Enabled  :=False;
  // password tidak bisa diedit dari form user.
  sLabel12.Visible    := False;
  edPassword.Visible  := False;
  // load database/
  loadData;
end;

{
  procedure yang digunakan untuk duplikate data.
}
procedure TFUser.DuplicateData;
begin
  // dataBaru dibuat True karena data hanya diduplikat saja.
  dataBaru := True;
  loadData;
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
  Close;
end;

end.
