unit URegister;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FlexCodeSDK, OleServer, StdCtrls, ExtCtrls, ComCtrls;

type
  TFRegister = class(TForm)
    lbl1: TLabel;
    edIdUser: TEdit;
    cbFingerIndex: TComboBox;
    lbl2: TLabel;
    imgJari: TImage;
    btnDaftar: TButton;
    btnSimpan: TButton;
    lbl4: TLabel;
    edNama: TEdit;
    status: TStatusBar;
    redtStatus: TRichEdit;
    procedure Awal;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnDaftarClick(Sender: TObject);
    procedure ShowStatus(msg: string);
    procedure btnSimpanClick(Sender: TObject);
    procedure btnVerifikasiClick(Sender: TObject);
    procedure StartVerifikasi;
    procedure StartRegistrasi;
    procedure LoadData;
  private
    FPReg: TFinFPReg;
    FPVer: TFinFPVer;
    procedure FPRegFPRegistrationStatus(ASender: TObject; Status: Integer);
    procedure FPRegFPSamplesNeeded(ASender: TObject; Samples: Smallint);
    procedure FPRegFPRegistrationTemplate(ASender: TObject;
      const FPTemplate: WideString);
    procedure FPRegFPRegistrationImage(Sender: TObject);
    procedure FPVerFPVerificationImage(Sender: TObject);
    procedure FPVerFPVerificationID(ASender: TObject; const ID: WideString;
      FingerNr: Integer);
    procedure FPVerFPVerificationStatus(ASender: TObject; Status: Integer);
  public
    SN: WideString;
    Verification: WideString;
    Activation: WideString;
    FixTemplate: WideString;
    { Public declarations }
  end;

var
  FRegister: TFRegister;

implementation

uses UDM;

{$R *.dfm}

procedure TFRegister.Awal;
begin
  edIdUser.Clear;
  edNama.Clear;
  redtStatus.Clear;
  imgJari.Picture:= nil;
  btnDaftar.Enabled:= False;
  btnSimpan.Enabled:= False;
end;

procedure TFRegister.FormCreate(Sender: TObject);
begin
  FPReg := TFinFPReg.Create(Self);
  FPReg.AutoConnect := False;
  FPReg.ConnectKind := ckRunningOrNew;
  FPReg.OnFPRegistrationStatus := FPRegFPRegistrationStatus;
  FPReg.OnFPRegistrationTemplate := FPRegFPRegistrationTemplate;
  FPReg.OnFPSamplesNeeded := FPRegFPSamplesNeeded;
  FPReg.OnFPRegistrationImage := FPRegFPRegistrationImage;

  FPVer := TFinFPVer.Create(Self);
  FPVer.AutoConnect := False;
  FPVer.ConnectKind := ckRunningOrNew;
  FPVer.OnFPVerificationStatus := FPVerFPVerificationStatus;
  FPVer.OnFPVerificationID := FPVerFPVerificationID;
  FPVer.OnFPVerificationImage := FPVerFPVerificationImage;

  imgJari.Canvas.Create();
  FPReg.PictureSamplePath := ExtractFilePath(Application.ExeName) + '\FPTemp.BMP';
  FPReg.PictureSampleHeight := 1635;
  FPReg.PictureSampleWidth := 1335;
end;

procedure TFRegister.FormShow(Sender: TObject);
begin
  edIdUser.Text := dm.QKaryawan.FIeldByName('kd_user').AsString;
  edNama.Text := dm.QKaryawan.FIeldByName('n_user').AsString;
  
  SN:= 'C800V004068';
  Verification:= 'EC5-C58-C93-CAD-DEA';
  Activation:= '1YJ3-FBDA-C633-2124-7321-5XJN';

  FPReg.DeviceInfo(SN,Verification,Activation);
end;


procedure TFRegister.btnDaftarClick(Sender: TObject);
begin
  redtStatus.Clear;

  DM.SQLExec(DM.QShow,'SELECT id_template FROM tb_user_template WHERE user_id ="'+
                      edIdUser.Text+'" AND finger_index ="'+
                      IntToStr(cbFingerIndex.ItemIndex)+'"',True);
  if (DM.QShow.RecordCount <> 0) then
  begin
    ShowMessage('Data User dengan Sidik Jari ini Sudah ada dalam Database...');
    Exit;
  end;

  StartVerifikasi;
  ShowStatus('Tempelkan Jari ke Alat Deteksi!!!');
end;

procedure TFRegister.ShowStatus(msg: string);
begin
  redtStatus.lines.add(msg);
  status.SimpleText := msg;
end;

procedure TFRegister.FPRegFPRegistrationStatus(ASender: TObject;
  Status: Integer);
begin
  case Status of
    0   : begin
            ShowStatus('Pendaftaran sidik jari Sukses, Simpan Data!!!');
            btnSimpan.Enabled:= True;
            btnSimpan.SetFocus;
          end;
    3   : ShowStatus('Pendaftaran gagal...');
    7   : ShowStatus('Masukkan Alat ke USB port!');
    8   : ShowStatus('Kualitas Gambar Jelek!');
    9   : ShowStatus('Activation/verification code is incorrent or not set!');
    10  : ShowStatus('Mulai Pendaftaran Sidik Jari!');
    11  : ShowStatus('Pendaftaran Berhenti!');
  end;
end;

procedure TFRegister.FPRegFPSamplesNeeded(ASender: TObject;
  Samples: Smallint);
begin
  ShowStatus('Butuh ' + inttostr(Samples) + ' Sampel Sidik Jari...');
end;

procedure TFRegister.FPRegFPRegistrationTemplate(ASender: TObject;
  const FPTemplate: WideString);
begin
  FixTemplate:= FPTemplate;
end;

procedure TFRegister.FPRegFPRegistrationImage(Sender: TObject);
begin
  imgJari.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + '\FPTemp.BMP');
end;

procedure TFRegister.btnSimpanClick(Sender: TObject);
var
  _sql : string;
begin
  _sql := 'INSERT INTO tb_user_template(user_id,finger_index,template) VALUES ("'+
          edIdUser.Text+'","'+IntToStr(cbFingerIndex.ItemIndex)+'","'+FixTemplate+'")';
  try
    DM.SQLExec(DM.Qexe,_sql,False);
    ShowMessage('Data Sidik Jari BERHASIL DISIMPAN ke DATABASE... ');
    Awal;
  except
    on E:exception do
    messagedlg('proses penyimpanan gagal,ulangi lagi!!! '#10#13'' + e.Message, mterror, [mbOk],0);
  end;
end;

procedure TFRegister.btnVerifikasiClick(Sender: TObject);
begin
  redtStatus.Clear;
  StartVerifikasi;
  ShowStatus('Tempelkan Jari ke Alat Deteksi!!!');
end;

procedure TFRegister.StartVerifikasi;
begin
  FPVer.AddDeviceInfo(SN,Verification,Activation);
  LoadData;
  FPVer.FPVerificationStart('');
end;

procedure TFRegister.LoadData;
var
  _sql : string;
begin
  _sql := 'SELECT * FROM tb_user_template';

  DM.SQLExec(DM.QShow,_sql,True);
  DM.QShow.First;
  while not DM.QShow.Eof do
  begin        
  FPVer.FPLoad(DM.QShow.FieldByName('id_template').AsString,
               DM.QShow.FieldByName('finger_index').AsInteger,
               DM.QShow.FieldByName('template').AsString,
               'MySecretKey'+DM.QShow.FieldByName('user_id').AsString);
  DM.QShow.Next;
  end;
end;

procedure TFRegister.FPVerFPVerificationImage(Sender: TObject);
begin
  imgJari.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + '\FPTemp.BMP');
end;

procedure TFRegister.FPVerFPVerificationID(ASender: TObject;
  const ID: WideString; FingerNr: Integer);
begin
  ShowStatus('Sudah Terdaftar dengan ID: '+ ID +' dan Index Jari: '+ IntToStr(FingerNr));
end;

procedure TFRegister.FPVerFPVerificationStatus(ASender: TObject;
  Status: Integer);
begin
  case Status of
    0  :  begin
            StartRegistrasi;
          end;
    1  :  begin
            ShowStatus('Sidik Jari Sudah Terdaftar, Daftarkan Sidik Jari lain!!!');
          end;
    2   : begin
            ShowStatus('Multiple match!');
          end;
    3  :  begin
            ShowStatus('Verification fail!');
          end;
    7   : begin
            ShowStatus('Please connect the device to USB port!');
          end;
    8  :  begin
            ShowStatus('Poor image quality!');
          end;
    9   : begin
            ShowStatus('Activation/verification code is incorrect!');
          end;
    11  : begin
            ShowStatus('&Stop Verify!');
          end;
    15  : begin
            ShowStatus('jari Menempel!');
          end;
    16  : begin
            ShowStatus('Max 2000 templates!');
          end;
    17  : begin
            ShowStatus('Max 10 Devices!');
          end;
    18  : begin
            StartRegistrasi;
          end;
  end;
end;

procedure TFRegister.StartRegistrasi;
begin
  ShowStatus('Sidik Jari Unik, Silahkan Mendaftar...');
  FPVer.FPVerificationStop;
  FPReg.FPRegistrationStart('MySecretKey'+edIdUser.Text);
end;
end.
