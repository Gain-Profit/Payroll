unit UUser;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, sEdit, sLabel, Mask, sMaskEdit, sCustomComboEdit, sTooledit,
  sGroupBox, ExtCtrls, sButton, sPanel, sRadioButton;

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
    sLabel9: TsLabel;
    edRekening: TsEdit;
    procedure loadData;
    procedure BuatDataBaru;
    procedure ShowData;
    procedure DuplicateData;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    function RadioGroupToData(rb: TsRadioGroup; pola: string): string;
    function DateToData(de: TsDateEdit): string;
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

uses
  UDM;

{$R *.dfm}

{
  procedure untuk load data dari database.
}
procedure TFUser.loadData;
begin
  edKodeUser.Text := DM.QUser.FieldByName('kd_user').AsString;
  edNamaUser.Text := DM.QUser.FieldByName('n_user').AsString;
  edAlamat.Text := DM.QUser.FieldByName('alamat').AsString;
  edKontak.Text := DM.QUser.FieldByName('kontak').AsString;
  edEmail.Text := DM.QUser.FieldByName('email').AsString;
  edPendidikan.Text := DM.QUser.FieldByName('pendidikan').AsString;
  edJabatan.Text := DM.QUser.FieldByName('jabatan').AsString;
  edRekening.Text := DM.QUser.FieldByName('rekening').AsString;

  if DM.QUser.FieldByName('sex').AsString = 'L' then
    rgJenisKelamin.ItemIndex := 0
  else
    rgJenisKelamin.ItemIndex := 1;
  if DM.QUser.FieldByName('kawin').AsBoolean then
    rgStatusPerkawinan.ItemIndex := 0
  else
    rgStatusPerkawinan.ItemIndex := 1;
  if DM.QUser.FieldByName('aktif').AsBoolean then
    rgStatusAktif.ItemIndex := 0
  else
    rgStatusAktif.ItemIndex := 1;

  deTanggalLahir.Date := DM.QUser.FieldByName('tanggal_lahir').AsDateTime;
  deTanggalMasuk.Date := DM.QUser.FieldByName('tanggal_masuk').AsDateTime;
  deTanggalKeluar.Date := DM.QUser.FieldByName('tanggal_keluar').AsDateTime;
end;

{
  procedure untuk membuat data baru.
}
procedure TFUser.BuatDataBaru;
begin
  dataBaru := True;
end;  

{
  procedure yang digunakan untuk menampilkan data.
}
procedure TFUser.ShowData;
begin
  // data baru dibuat false karena database akan di edit.
  dataBaru := False;
  // tidak bisa update kode user.
  edKodeUser.Enabled := False;
  // password tidak bisa diedit dari form user.
  sLabel12.Visible := False;
  edPassword.Visible := False;
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

{
  procedure untuk mengeluarkan form ketika tombol esc ditekan.
}
procedure TFUser.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = vk_escape then
    Close;
end;

{
  fungsi untuk convert dari radio group ke data
}
function TFUser.RadioGroupToData(rb: TsRadioGroup; pola: string): string;
begin
  if rb.ItemIndex = 0 then
    Result := Copy(pola, 1, 1)
  else
    Result := Copy(pola, 2, 1);
end;

{
  fungsi untuk convert dari tanggal ke data.
}
function TFUser.DateToData(de: TsDateEdit): string;
var
  hasil: string;
begin
  hasil := FormatDateTime('yyyy-mm-dd', de.Date);
  if hasil = '1899-12-30' then
    hasil := 'NULL'
  else
    hasil := '"' + hasil + '"';

  Result := hasil;
end;

{
  Procedure untuk menyimpan data kedalam database.
}
procedure TFUser.btnSimpanClick(Sender: TObject);
var
  sql, sex, kawin, aktif, lahir, masuk, keluar: string;
begin
  sex := RadioGroupToData(rgJenisKelamin, 'LP');
  kawin := RadioGroupToData(rgStatusPerkawinan, 'YN');
  aktif := RadioGroupToData(rgStatusAktif, 'YN');
  lahir := DateToData(deTanggalLahir);
  masuk := DateToData(deTanggalMasuk);
  keluar := DateToData(deTanggalKeluar);

  if dataBaru then
  begin
    sql := Format('INSERT INTO tb_user(kd_user, `password`, n_user, Alamat, ' +
      'Kontak, email, sex, kawin, jabatan, pendidikan, rekening, tanggal_lahir, tanggal_masuk, ' +
      'tanggal_keluar, aktif) VALUES ("%s",MD5("%s"),"%s","%s","%s","%s","%s", ' +
      '"%s","%s","%s","%s",%s,%s,%s,"%s")', [edKodeUser.Text, edPassword.Text,
      edNamaUser.Text, edAlamat.Text, edKontak.Text, edEmail.Text, sex, kawin,
      edJabatan.Text, edPendidikan.Text, edRekening.Text, lahir, masuk, keluar, aktif]);
  end
  else
  begin
    sql := Format('UPDATE tb_user SET n_user="%s", Alamat="%s", Kontak="%s", ' +
      'email="%s", sex="%s", kawin="%s", jabatan="%s", pendidikan="%s", rekening="%s", ' +
      'tanggal_lahir=%s, tanggal_masuk=%s, tanggal_keluar=%s, aktif="%s" ' +
      'WHERE kd_user="%s"', [edNamaUser.Text, edAlamat.Text, edKontak.Text,
      edEmail.Text, sex, kawin, edJabatan.Text, edPendidikan.Text, edRekening.Text,
      lahir, masuk, keluar, aktif, edKodeUser.Text]);
  end;

  try
    DM.SQLExec(dm.Qexe, sql, False);
    ShowMessage('Data Berhasil Disimpan ke database...');
    ModalResult := mrYes;
    Close;
  except
    on e: Exception do
      ShowMessage('data tidak berhasil disimpan, '#10#13'' + e.Message);
  end;
end;

end.

