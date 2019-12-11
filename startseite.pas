unit StartSeite;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls, Spickerwahl;

type

  { TForm0 }

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

implementation

{$R *.lfm}


procedure TForm3.StartButtonClick(Sender: TObject);
begin
  Form1.Show;
end;

end.

