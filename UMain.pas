unit UMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,MMSystem;

type
  TFMain = class(TForm)
    btnRegister: TButton;
    btnVerifikasi: TButton;
    btnSound: TButton;
    procedure btnRegisterClick(Sender: TObject);
    procedure btnVerifikasiClick(Sender: TObject);
    procedure btnSoundClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMain: TFMain;

implementation

uses UCheckIO, URegister;

{$R *.dfm}

procedure TFMain.btnRegisterClick(Sender: TObject);
begin
  Application.CreateForm(TFRegister,FRegister);
  FRegister.ShowModal;
end;

procedure TFMain.btnVerifikasiClick(Sender: TObject);
begin
  Application.CreateForm(TFChekIO,FChekIO);
  FChekIO.ShowModal;
end;

procedure TFMain.btnSoundClick(Sender: TObject);
begin
{
uses MMSystem;

SND_ASYNC play sound in the background and
    let the program continue while playing.
SND_SYNC stops the program while playing and
    lets the program continues only after playing the sount completely.
SND_LOOP plays the sound in a loop over and over.
    only when playing a new sound, or when you
    call PlaySound(nil,0,0) the playing is stopped.
}

PlaySound('DeviceFail',0,SND_ASYNC);
end;

end.
