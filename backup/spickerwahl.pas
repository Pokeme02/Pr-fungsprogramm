unit Spickerwahl;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Pruefungsraum;

type

  { TForm1 }

  TForm1 = class(TForm)
    GewaehltLabel1: TLabel;
    GewaehltLabel2: TLabel;
    GewaehltLabel3: TLabel;
    GewaehltLabel4: TLabel;
    GewaehltLabel5: TLabel;
    GewaehltLabel6: TLabel;
    WeiterzurPruefungButton: TButton;
    MatheSpickerButton1: TButton;
    WISPickerButton2: TButton;
    GWASpickerButton3: TButton;
    BWLSpickerButton4: TButton;
    ProgrammierSpickerButton5: TButton;
    TISpickerButton6: TButton;
    procedure BWLSpickerButton4Click(Sender: TObject);
    procedure GWASpickerButton3Click(Sender: TObject);
    procedure MatheSpickerButton1Click(Sender: TObject);
    procedure ProgrammierSpickerButton5Click(Sender: TObject);
    procedure TISpickerButton6Click(Sender: TObject);
    procedure WeiterzurPruefungButtonClick(Sender: TObject);
    procedure WISPickerButton2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

  var
  Form1: TForm1;
  Form2: TForm2;
  SpickerCounter:integer;


implementation

{$R *.lfm}

{ TForm1 }
 procedure TForm1.FormCreate(sender:TObject);
 begin
 SpickerCounter:=0;

 IDArray[1] := 0;
 IDArray[2] := 0;
 IDArray[3] := 0;
 end;

procedure TForm1.MatheSpickerButton1Click(Sender: TObject);
begin
  MathespickerButton1.enabled:=false;
  SpickerCounter:= SpickerCounter + 1;
  GewaehltLabel1.Visible:=true;
  if IDArray[1] = 0 then
  Begin
     IDArray[1] := 1;
  end
  else if IDArray[2] = 0 then
  begin
     IDArray[2] := 1;
  end
  else if IDArray[3] = 0 then
  begin
     IDArray[3] := 1;
  end;
   if
   SpickerCounter= 3
   then
   begin
        WISpickerButton2.Enabled:=false;
        GWASpickerButton3.Enabled:=false;
        BWLSpickerButton4.Enabled:=false;
        ProgrammierSpickerButton5.Enabled:=false;
        TISpickerButton6.Enabled:=false;
   end;
end;

procedure TForm1.ProgrammierSpickerButton5Click(Sender: TObject);
begin
   ProgrammierSpickerButton5.enabled:=false;
   SpickerCounter:= SpickerCounter + 1;
   GewaehltLabel5.Visible:=true;
   if IDArray[1] = 0 then
  Begin
     IDArray[1] := 5;
  end
  else if IDArray[2] = 0 then
  begin
     IDArray[2] := 5;
  end
  else if IDArray[3] = 0 then
  begin
     IDArray[3] := 5;
  end;
   if
   SpickerCounter= 3
   then
   begin
        MatheSpickerButton1.Enabled:=false;
        WISpickerButton2.Enabled:=false;
        GWASpickerButton3.Enabled:=false;
        BWLSpickerButton4.Enabled:=false;
        TISpickerButton6.Enabled:=false;
   end;
end;

procedure TForm1.TISpickerButton6Click(Sender: TObject);
begin
  TISpickerButton6.enabled:=false;
  SpickerCounter:= SpickerCounter + 1;
  GewaehltLabel6.Visible:=true;
  if IDArray[1] = 0 then
  Begin
     IDArray[1] := 6;
  end
  else if IDArray[2] = 0 then
  begin
     IDArray[2] := 6;
  end
  else if IDArray[3] = 0 then
  begin
     IDArray[3] := 6;
  end;
  if
  SpickerCounter= 3
  then
  begin
    MatheSpickerButton1.Enabled:=false;
    WISpickerButton2.Enabled:=false;
   GWASpickerButton3.Enabled:=false;
   BWLSpickerButton4.Enabled:=false;
   ProgrammierSpickerButton5.Enabled:=false;
  end;
end;

procedure TForm1.WeiterzurPruefungButtonClick(Sender: TObject);
begin
  Application.CreateForm(TForm2, Form2);
  Form2.showModal;
end;

procedure TForm1.GWASpickerButton3Click(Sender: TObject);
begin
  GWASpickerButton3.enabled:=false;
  SpickerCounter:= SpickerCounter + 1;
  GewaehltLabel3.Visible:=true;
  if IDArray[1] = 0 then
  Begin
     IDArray[1] := 3;
  end
  else if IDArray[2] = 0 then
  begin
     IDArray[2] := 3;
  end
  else if IDArray[3] = 0 then
  begin
     IDArray[3] := 3;
  end;
  if
  SpickerCounter= 3
  then
  begin
      MatheSpickerButton1.Enabled:=false;
      WISpickerButton2.Enabled:=false;
      BWLSpickerButton4.Enabled:=false;
      ProgrammierSpickerButton5.Enabled:=false;
      TISpickerButton6.Enabled:=false;
  end;
end;

procedure TForm1.BWLSpickerButton4Click(Sender: TObject);
begin
    BWLSpickerButton4.enabled:=false;
    SpickerCounter:= SpickerCounter + 1;
    GewaehltLabel4.Visible:=true;
    IDArray[4] := 4;
    if
    SpickerCounter= 3
    then
    begin
       MatheSpickerButton1.Enabled:=false;
       WISpickerButton2.Enabled:=false;
       GWASpickerButton3.Enabled:=false;
       ProgrammierSpickerButton5.Enabled:=false;
       TISpickerButton6.Enabled:=false;
    end;
end;

procedure TForm1.WISPickerButton2Click(Sender: TObject);
begin
  WISpickerButton2.enabled:=false;
  SpickerCounter:= SpickerCounter + 1;
  GewaehltLabel2.Visible:=true;
  IDArray[2] := 2;
  if
  SpickerCounter= 3
  then
  begin
      MatheSpickerButton1.Enabled:=false;
      GWASpickerButton3.Enabled:=false;
      BWLSpickerButton4.Enabled:=false;
      ProgrammierSpickerButton5.Enabled:=false;
      TISpickerButton6.Enabled:=false;
  end;
end;

end.

