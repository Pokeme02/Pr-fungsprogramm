unit StartSeite;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls, Spickerwahl;

type

  { TForm3 }

  TForm3 = class(TForm)
    StartButton: TButton;
    Image1: TImage;
    procedure StartButtonClick(Sender: TObject);
  private

  public

  end;

var
  Form3: TForm3;
  Form1: TForm1;

implementation

{$R *.lfm}


procedure TForm3.StartButtonClick(Sender: TObject);
begin
   Visible := False; // Makes Form3 invisible
  try
    Form1.ShowModal; // Shows the Form1
  finally
    Visible := True; // Makes Form3 visible again
  end;
end;

end.

