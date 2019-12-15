unit Pruefungsraum;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, ComCtrls,
  StdCtrls;

type

  { TForm2 }

  TForm2 = class(TForm)
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button1: TButton;
    CheckAttack10: TRadioButton;
    CheckAttack11: TRadioButton;
    CheckAttack12: TRadioButton;
    CheckAttack13: TRadioButton;
    CheckAttack14: TRadioButton;
    CheckAttack15: TRadioButton;
    CheckAttack16: TRadioButton;
    CheckAttack5: TRadioButton;
    CheckAttack6: TRadioButton;
    CheckAttack7: TRadioButton;
    CheckAttack8: TRadioButton;
    CheckAttack9: TRadioButton;
    Delay1: TTimer;
    Delay2: TTimer;
    Image1: TImage;
    LabeledEdit1: TLabeledEdit;
    LabeledEdit2: TLabeledEdit;
    Memo1: TMemo;
    PageControl1: TPageControl;
    RadioAttack1: TRadioGroup;
    CheckAttack1: TRadioButton;
    CheckAttack2: TRadioButton;
    CheckAttack3: TRadioButton;
    CheckAttack4: TRadioButton;
    RadioAttack2: TRadioGroup;
    RadioAttack3: TRadioGroup;
    RadioAttack4: TRadioGroup;
    SwitchSpicker1: TRadioButton;
    SpickerTab1: TTabSheet;
    SpickerTab2: TTabSheet;
    SpickerTab3: TTabSheet;
    SpecialSpickerTab: TTabSheet;
    SwitchSpicker2: TRadioButton;
    SwitchSpicker3: TRadioButton;
    SwitchSpicker4: TRadioButton;
    Delay: TTimer;
    //procedure Rauscher(Lifepoints: Integer);
    //procedure Rethschulte(Lifepoints: Integer);
    //procedure Haak(Lifepoints: Integer);
    //procedure Schmidt_Goettrup(Lifepoints: Integer);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure CheckAttack1Change(Sender: TObject);
    procedure Delay1Timer(Sender: TObject);
    procedure Delay2Timer(Sender: TObject);
    procedure DelayStartTimer(Sender: TObject);
    procedure DelayTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure SpickerTab1Enter(Sender: TObject);
    procedure SpickerTab2Enter(Sender: TObject);
    procedure SpickerTab3Enter(Sender: TObject);
  private

  public

  end;



var
  Form2: TForm2;
  FightCounter: Integer;
  Random5: Integer;
  RandomMath: Integer;
  RandomMath2: Integer;
  RandomGWA: Integer;
  RandomGWA2: Integer;
  RandomWI: Integer;
  RandomWI2: Integer;
  RandomTI: Integer;
  RandomTI2: Integer;
  RandomProgrammieren: Integer;
  RandomProgrammieren2: Integer;
  RandomBWL: Integer;
  RandomBWL2: Integer;
  RandomDamage: Integer;
  IDArray: array[1..3] of integer;
  MatheArray: array[1..5] of String;
  GWAArray: array[1..5] of String;
  WIArray: array[1..5] of String;
  TIArray: array[1..5] of String;
  ProgrammierenArray: array[1..5] of String;
  BWLArray: array[1..5] of String;
  OpponentAttackArray: array[1..5] of String;
  ProfLifepoints: integer;
  Spicker1Lifepoints: integer;
  Spicker2Lifepoints: integer;
  Spicker3Lifepoints: integer;


implementation



{$R *.lfm}

{ TForm2 }

procedure TForm2.PageControl1Change(Sender: TObject);
begin
  if PageControl1.TabIndex = SpickerTab1.PageIndex then
  begin
      LabeledEdit1.EditLabel.Caption:= SpickerTab1.Caption;
      LabeledEdit1.Text:= IntToStr(Spicker1Lifepoints);
  end
  else if PageControl1.TabIndex = SpickerTab2.PageIndex then
  begin
      LabeledEdit1.EditLabel.Caption:= SpickerTab2.Caption;
      LabeledEdit1.Text:= IntToStr(Spicker2Lifepoints);
  end
  else if PageControl1.TabIndex = SpickerTab3.PageIndex then
  begin
      LabeledEdit1.EditLabel.Caption:= SpickerTab3.Caption;
      LabeledEdit1.Text:= IntToStr(Spicker3Lifepoints);
  end
  else if PageControl1.TabIndex = SpecialSpickerTab.PageIndex then
  begin
      LabeledEdit1.EditLabel.Caption:= SpecialSpickerTab.Caption;
  end
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
  MatheArray[1]:= 'Differentialgleichung';
  MatheArray[2]:= 'BinomischeFormeln';
  MatheArray[3]:= 'PQFormel';
  MatheArray[4]:= 'Dreisatz';
  MatheArray[5]:= 'Potenzgesetze';

  GWAArray[1]:= 'Zitierarten';
  GWAArray[2]:= 'Zeitmanagment';
  GWAArray[3]:= 'Kommunikation';
  GWAArray[4]:= 'Lerntechniken';
  GWAArray[5]:= 'Paesentiertechniken';

  WIArray[1]:=  'Datenbanken';
  WIArray[2]:=  'Neumann_Architektur';
  WIArray[3]:=  'Arithmetische_Befehle';
  WIArray[4]:=  'Rechner_Struktur';
  WIArray[5]:=  'CSP';

  TIArray[1]:=  'Boolesche_Funktionen';
  TIArray[2]:=  'KV_Diagramme';
  TIArray[3]:=  'URI';
  TIArray[4]:=  'ASCII';
  TIArray[5]:=  'Zweier_Komplement';

  ProgrammierenArray[1]:= 'ForSchleife';
  ProgrammierenArray[2]:= 'While_Schleife';
  ProgrammierenArray[3]:= 'Zuweisungsstatements';
  ProgrammierenArray[4]:= 'GUI';
  ProgrammierenArray[5]:= 'Semikolon';

  BWLArray[1]:= 'ABC_Analyse';
  BWLArray[2]:= 'Lagerhaltung';
  BWLArray[3]:= 'EVA_Prinzip';
  BWLArray[4]:= 'Prozessmamagement';
  BWLArray[5]:= 'Produktionsfaktoren';

  OpponentAttackArray[1]:= 'Geht eine Runde';
  OpponentAttackArray[2]:= 'Kaffee trinken';
  OpponentAttackArray[3]:= 'Wird Sauer';
  OpponentAttackArray[4]:= 'Aufgaben aus höherem Semester';
  OpponentAttackArray[5]:= 'Taschenrechner weg';



  RandomMath:= Random(3);
  RandomMath2:= Random(2) + 3;
  RandomGWA:=  Random(3);
  RandomGWA2:=  Random(2)+3;
  RandomWI:= Random(3);
  RandomWI2:= Random(2) + 3;
  RandomTI:= Random(3);
  RandomTI2:= Random(2) +3;
  RandomProgrammieren:= Random(3);
  RandomProgrammieren2:= Random(2) +3;
  RandomBWL:= Random(3);
  RandomBWL2:= Random(2) + 3;

  if IDArray[1] = 1 then
    begin
        SpickerTab1.Caption := 'Mathe';
        Random5:=    Random(5);

        CheckAttack1.Caption:= MatheArray[RandomMath];
        CheckAttack2.Caption:= MatheArray[RandomMath2];
        CheckAttack3.Caption:= BWLArray[Random5];
        CheckAttack4.Caption:= TIArray[Random5];
    end
  else if IDArray[1] = 2 then
    begin
        SpickerTab1.Caption := 'WI';
        Random5:= Random(5);

        CheckAttack1.Caption:= WIArray[RandomWI];
        CheckAttack2.Caption:= WIArray[RandomWI2];
        CheckAttack3.Caption:= MatheArray[Random5];
        CheckAttack4.Caption:= GWAArray[Random5];
    end
  else if IDArray[1] = 3 then
    begin
        SpickerTab1.Caption := 'GWA';
        Random5:= Random(5);

        CheckAttack1.Caption:= GWAArray[RandomGWA];
        CheckAttack2.Caption:= GWAArray[RandomGWA2];
        CheckAttack3.Caption:= ProgrammierenArray[Random5];
        CheckAttack4.Caption:= MatheArray[Random5];
    end
  else if IDArray[1] = 4 then
    begin
        SpickerTab1.Caption := 'BWL';
        Random5:= Random(5);

        CheckAttack1.Caption:= BWLArray[RandomBWL];
        CheckAttack2.Caption:= BWLArray[RandomBWL2];
        CheckAttack3.Caption:= TIArray[Random5];
        CheckAttack4.Caption:= WIArray[Random5];
    end
  else if IDArray[1] = 5 then
    begin
        SpickerTab1.Caption := 'Programmieren';
        Random5:= Random(5);

        CheckAttack1.Caption:= ProgrammierenArray[RandomProgrammieren];
        CheckAttack2.Caption:= ProgrammierenArray[RandomProgrammieren2];
        CheckAttack3.Caption:= GWAArray[Random5];
        CheckAttack4.Caption:= WIArray[Random5];
    end
  else if IDArray[1] = 6 then
    begin
        SpickerTab1.Caption := 'TI';
        Random5:= Random(5);

        CheckAttack1.Caption:= TIArray[RandomTI];
        CheckAttack2.Caption:= TIArray[RandomTI2];
        CheckAttack3.Caption:= ProgrammierenArray[Random5];
        CheckAttack4.Caption:= BWLArray[Random5];
    end;

  if IDArray[2] = 1 then
    begin
        SpickerTab2.Caption := 'Mathe';
        Random5:=    Random(5);

        CheckAttack5.Caption:= MatheArray[RandomMath];
        CheckAttack6.Caption:= MatheArray[RandomMath2];
        CheckAttack7.Caption:= BWLArray[Random5];
        CheckAttack8.Caption:= TIArray[Random5];
    end
  else if IDArray[2] = 2 then
    begin
        SpickerTab2.Caption := 'WI';
        Random5:= Random(5);

        CheckAttack5.Caption:= WIArray[RandomWI];
        CheckAttack6.Caption:= WIArray[RandomWI2];
        CheckAttack7.Caption:= MatheArray[Random5];
        CheckAttack8.Caption:= GWAArray[Random5];
    end
  else if IDArray[2] = 3 then
    begin
        SpickerTab2.Caption := 'GWA';
        Random5:= Random(5);

        CheckAttack5.Caption:= GWAArray[RandomGWA];
        CheckAttack6.Caption:= GWAArray[RandomGWA2];
        CheckAttack7.Caption:= ProgrammierenArray[Random5];
        CheckAttack8.Caption:= MatheArray[Random5];
    end
  else if IDArray[2] = 4 then
    begin
        SpickerTab2.Caption := 'BWL';
        Random5:= Random(5);

        CheckAttack5.Caption:= BWLArray[RandomBWL];
        CheckAttack6.Caption:= BWLArray[RandomBWL2];
        CheckAttack7.Caption:= TIArray[Random5];
        CheckAttack8.Caption:= WIArray[Random5];
    end
  else if IDArray[2] = 5 then
    begin
        SpickerTab2.Caption := 'Programmieren';
        Random5:= Random(5);

        CheckAttack5.Caption:= ProgrammierenArray[RandomProgrammieren];
        CheckAttack6.Caption:= ProgrammierenArray[RandomProgrammieren2];
        CheckAttack7.Caption:= GWAArray[Random5];
        CheckAttack8.Caption:= WIArray[Random5];
    end
  else if IDArray[2] = 6 then
    begin
        SpickerTab2.Caption := 'TI';
        Random5:= Random(5);

        CheckAttack5.Caption:= TIArray[RandomTI];
        CheckAttack6.Caption:= TIArray[RandomTI2];
        CheckAttack7.Caption:= ProgrammierenArray[Random5];
        CheckAttack8.Caption:= BWLArray[Random5];
    end;

  if IDArray[3] = 1 then
    begin
        SpickerTab3.Caption := 'Mathe';
        Random5:=    Random(5);

        CheckAttack9.Caption:= MatheArray[RandomMath];
        CheckAttack10.Caption:= MatheArray[RandomMath2];
        CheckAttack11.Caption:= BWLArray[Random5];
        CheckAttack12.Caption:= TIArray[Random5];
    end
  else if IDArray[3] = 2 then
    begin
        SpickerTab3.Caption := 'WI';
        Random5:= Random(5);

        CheckAttack9.Caption:= WIArray[RandomWI];
        CheckAttack10.Caption:= WIArray[RandomWI2];
        CheckAttack11.Caption:= MatheArray[Random5];
        CheckAttack12.Caption:= GWAArray[Random5];
    end
  else if IDArray[3] = 3 then
    begin
        SpickerTab3.Caption := 'GWA';
        Random5:= Random(5);

        CheckAttack9.Caption:= GWAArray[RandomGWA];
        CheckAttack10.Caption:= GWAArray[RandomGWA2];
        CheckAttack11.Caption:= ProgrammierenArray[Random5];
        CheckAttack12.Caption:= MatheArray[Random5];
    end
  else if IDArray[3] = 4 then
    begin
        SpickerTab3.Caption := 'BWL';
        Random5:= Random(5);

        CheckAttack9.Caption:= BWLArray[RandomBWL];
        CheckAttack10.Caption:= BWLArray[RandomBWL2];
        CheckAttack11.Caption:= TIArray[Random5];
        CheckAttack12.Caption:= WIArray[Random5];
    end
  else if IDArray[3] = 5 then
    begin
        SpickerTab3.Caption := 'Programmieren';
        Random5:= Random(5);

        CheckAttack9.Caption:= ProgrammierenArray[RandomProgrammieren];
        CheckAttack10.Caption:= ProgrammierenArray[RandomProgrammieren2];
        CheckAttack11.Caption:= GWAArray[Random5];
        CheckAttack12.Caption:= WIArray[Random5];
    end
  else if IDArray[3] = 6 then
    begin
        SpickerTab3.Caption := 'TI';
        Random5:= Random(5);

        CheckAttack9.Caption:= TIArray[RandomTI];
        CheckAttack10.Caption:= TIArray[RandomTI2];
        CheckAttack11.Caption:= ProgrammierenArray[Random5];
        CheckAttack12.Caption:= BWLArray[Random5];
    end;


  FightCounter:= 1;
  
  LabeledEdit2.EditLabel.Caption:= 'Schomaker';

  LabeledEdit1.EditLabel.Caption:= SpickerTab1.Caption;

  Spicker1Lifepoints:= 100;
  Spicker2Lifepoints:= 100;
  Spicker3Lifepoints:= 100;
  ProfLifepoints:= 100;

  LabeledEdit1.Text:= IntToStr(Spicker1Lifepoints);
  LabeledEdit2.Text:= IntToStr(ProfLifepoints);

end;



procedure TForm2.Button1Click(Sender: TObject);
begin


  if CheckAttack1.Checked = True then
  begin
    if CheckAttack1.Caption = 'Differentialgleichung' then
    begin
       ProfLifepoints:= ProfLifepoints - 12;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack1.Caption = 'Binomische Formeln' then
    begin
       ProfLifepoints:= ProfLifepoints - 18;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack1.Caption = 'PQ-Formel' then
    begin
       ProfLifepoints:= ProfLifepoints - 12;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack1.Caption = 'Dreisatz' then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack1.Caption = 'Potenzgesetze' then
    begin
       ProfLifepoints:= ProfLifepoints - 18;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end;

    if CheckAttack1.Caption = GWAArray[1] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack1.Caption = GWAArray[2] then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack1.Caption = GWAArray[3] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack1.Caption = GWAArray[4] then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack1.Caption = GWAArray[5] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end;

    if CheckAttack1.Caption = WIArray[1] then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack1.Caption = WIArray[2] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack1.Caption = WIArray[3] then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack1.Caption = WIArray[4] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack1.Caption = WIArray[5] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end;

    if CheckAttack1.Caption = TIArray[1] then
    begin
       ProfLifepoints:= ProfLifepoints - 12;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack1.Caption = TIArray[2] then
    begin
       ProfLifepoints:= ProfLifepoints - 20;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack1.Caption = TIArray[3] then
    begin
       ProfLifepoints:= ProfLifepoints - 12;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack1.Caption = TIArray[4] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack1.Caption = TIArray[5] then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end;

    if CheckAttack1.Caption = ProgrammierenArray[1] then
    begin
       ProfLifepoints:= ProfLifepoints - 12;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack1.Caption = ProgrammierenArray[2] then
    begin
       ProfLifepoints:= ProfLifepoints - 20;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack1.Caption = ProgrammierenArray[3] then
    begin
       ProfLifepoints:= ProfLifepoints - 12;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack1.Caption = ProgrammierenArray[4] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack1.Caption = ProgrammierenArray[5] then
    begin
       ProfLifepoints:= ProfLifepoints - 25;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end;

    if CheckAttack1.Caption = BWLArray[1] then
    begin
       ProfLifepoints:= ProfLifepoints - 5;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack1.Caption = BWLArray[2] then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack1.Caption = BWLArray[3] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack1.Caption = BWLArray[4] then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack1.Caption = BWLArray[5] then
    begin
       ProfLifepoints:= ProfLifepoints - 20;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end;
    Memo1.Lines.Add('Spicker setzt ' + CheckAttack1.Caption + 'ein');
  end;

  if CheckAttack2.Checked = True then
  begin
    if CheckAttack2.Caption = 'Differentialgleichung' then
    begin
       ProfLifepoints:= ProfLifepoints - 12;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack2.Caption = 'Binomische_Formeln' then
    begin
       ProfLifepoints:= ProfLifepoints - 18;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack2.Caption = 'PQ-Formel' then
    begin
       ProfLifepoints:= ProfLifepoints - 12;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack2.Caption = 'Dreisatz' then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack2.Caption = 'Potenzgesetze' then
    begin
       ProfLifepoints:= ProfLifepoints - 18;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end;

    if CheckAttack2.Caption = GWAArray[1] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack2.Caption = GWAArray[2] then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack2.Caption = GWAArray[3] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack2.Caption = GWAArray[4] then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack2.Caption = GWAArray[5] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end;

    if CheckAttack2.Caption = WIArray[1] then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack2.Caption = WIArray[2] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack2.Caption = WIArray[3] then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack2.Caption = WIArray[4] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack2.Caption = WIArray[5] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end;

    if CheckAttack2.Caption = TIArray[1] then
    begin
       ProfLifepoints:= ProfLifepoints - 12;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack2.Caption = TIArray[2] then
    begin
       ProfLifepoints:= ProfLifepoints - 20;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack2.Caption = TIArray[3] then
    begin
       ProfLifepoints:= ProfLifepoints - 12;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack2.Caption = TIArray[4] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack2.Caption = TIArray[5] then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end;

    if CheckAttack2.Caption = ProgrammierenArray[1] then
    begin
       ProfLifepoints:= ProfLifepoints - 12;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack2.Caption = ProgrammierenArray[2] then
    begin
       ProfLifepoints:= ProfLifepoints - 20;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack2.Caption = ProgrammierenArray[3] then
    begin
       ProfLifepoints:= ProfLifepoints - 12;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack2.Caption = ProgrammierenArray[4] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack2.Caption = ProgrammierenArray[5] then
    begin
       ProfLifepoints:= ProfLifepoints - 25;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end;

    if CheckAttack2.Caption = BWLArray[1] then
    begin
       ProfLifepoints:= ProfLifepoints - 5;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack2.Caption = BWLArray[2] then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack2.Caption = BWLArray[3] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack2.Caption = BWLArray[4] then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack2.Caption = BWLArray[5] then
    begin
       ProfLifepoints:= ProfLifepoints - 20;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end;

    Memo1.Lines.Add('Spicker setzt ' + CheckAttack2.Caption + 'ein');
  end;

       if CheckAttack3.Checked = True then
  begin
    if CheckAttack3.Caption = 'Differentialgleichung' then
    begin
       ProfLifepoints:= ProfLifepoints - 12;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack3.Caption = 'Binomische_Formeln' then
    begin
       ProfLifepoints:= ProfLifepoints - 18;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack3.Caption = 'PQ-Formel' then
    begin
       ProfLifepoints:= ProfLifepoints - 12;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack3.Caption = 'Dreisatz' then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack3.Caption = 'Potenzgesetze' then
    begin
       ProfLifepoints:= ProfLifepoints - 18;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end;

    if CheckAttack3.Caption = GWAArray[1] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack3.Caption = GWAArray[2] then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack3.Caption = GWAArray[3] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack3.Caption = GWAArray[4] then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack3.Caption = GWAArray[5] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end;

    if CheckAttack3.Caption = WIArray[1] then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack3.Caption = WIArray[2] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack3.Caption = WIArray[3] then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack3.Caption = WIArray[4] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack3.Caption = WIArray[5] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end;

    if CheckAttack3.Caption = TIArray[1] then
    begin
       ProfLifepoints:= ProfLifepoints - 12;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack3.Caption = TIArray[2] then
    begin
       ProfLifepoints:= ProfLifepoints - 20;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack3.Caption = TIArray[3] then
    begin
       ProfLifepoints:= ProfLifepoints - 12;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack3.Caption = TIArray[4] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack3.Caption = TIArray[5] then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end;

    if CheckAttack3.Caption = ProgrammierenArray[1] then
    begin
       ProfLifepoints:= ProfLifepoints - 12;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack3.Caption = ProgrammierenArray[2] then
    begin
       ProfLifepoints:= ProfLifepoints - 20;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack3.Caption = ProgrammierenArray[3] then
    begin
       ProfLifepoints:= ProfLifepoints - 12;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack3.Caption = ProgrammierenArray[4] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack3.Caption = ProgrammierenArray[5] then
    begin
       ProfLifepoints:= ProfLifepoints - 25;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end;

    if CheckAttack3.Caption = BWLArray[1] then
    begin
       ProfLifepoints:= ProfLifepoints - 5;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack3.Caption = BWLArray[2] then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack3.Caption = BWLArray[3] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack3.Caption = BWLArray[4] then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack3.Caption = BWLArray[5] then
    begin
       ProfLifepoints:= ProfLifepoints - 20;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end;
    Memo1.Lines.Add('Spicker setzt ' + CheckAttack3.Caption + 'ein');
  end;

  if CheckAttack4.Checked = True then
  begin
    if CheckAttack4.Caption = 'Differentialgleichung' then
    begin
       ProfLifepoints:= ProfLifepoints - 12;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack4.Caption = 'Binomische_Formeln' then
    begin
       ProfLifepoints:= ProfLifepoints - 18;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack4.Caption = 'PQ-Formel' then
    begin
       ProfLifepoints:= ProfLifepoints - 12;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack4.Caption = 'Dreisatz' then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack4.Caption = 'Potenzgesetze' then
    begin
       ProfLifepoints:= ProfLifepoints - 18;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end;

    if CheckAttack4.Caption = GWAArray[1] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack4.Caption = GWAArray[2] then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack4.Caption = GWAArray[3] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack4.Caption = GWAArray[4] then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack4.Caption = GWAArray[5] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end;

    if CheckAttack4.Caption = WIArray[1] then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack4.Caption = WIArray[2] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack4.Caption = WIArray[3] then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack4.Caption = WIArray[4] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack4.Caption = WIArray[5] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end;

    if CheckAttack4.Caption = TIArray[1] then
    begin
       ProfLifepoints:= ProfLifepoints - 12;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack4.Caption = TIArray[2] then
    begin
       ProfLifepoints:= ProfLifepoints - 20;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack4.Caption = TIArray[3] then
    begin
       ProfLifepoints:= ProfLifepoints - 12;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack4.Caption = TIArray[4] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack4.Caption = TIArray[5] then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end;

    if CheckAttack4.Caption = ProgrammierenArray[1] then
    begin
       ProfLifepoints:= ProfLifepoints - 12;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack4.Caption = ProgrammierenArray[2] then
    begin
       ProfLifepoints:= ProfLifepoints - 20;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack4.Caption = ProgrammierenArray[3] then
    begin
       ProfLifepoints:= ProfLifepoints - 12;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack4.Caption = ProgrammierenArray[4] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack4.Caption = ProgrammierenArray[5] then
    begin
       ProfLifepoints:= ProfLifepoints - 25;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end;

    if CheckAttack4.Caption = BWLArray[1] then
    begin
       ProfLifepoints:= ProfLifepoints - 5;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack4.Caption = BWLArray[2] then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack4.Caption = BWLArray[3] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack4.Caption = BWLArray[4] then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack4.Caption = BWLArray[5] then
    begin
       ProfLifepoints:= ProfLifepoints - 20;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end;
    Memo1.Lines.Add('Spicker setzt ' + CheckAttack4.Caption + 'ein');
  end;

  Delay.Enabled:= True;

end;





procedure TForm2.Button2Click(Sender: TObject);
begin

      if CheckAttack5.Checked = True then
  begin
    if CheckAttack5.Caption = 'Differentialgleichung' then
    begin
       ProfLifepoints:= ProfLifepoints - 12;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack5.Caption = 'Binomische_Formeln' then
    begin
       ProfLifepoints:= ProfLifepoints - 18;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack5.Caption = 'PQ-Formel' then
    begin
       ProfLifepoints:= ProfLifepoints - 12;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack5.Caption = 'Dreisatz' then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack5.Caption = 'Potenzgesetze' then
    begin
       ProfLifepoints:= ProfLifepoints - 18;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end;

    if CheckAttack5.Caption = GWAArray[1] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack5.Caption = GWAArray[2] then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack5.Caption = GWAArray[3] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack5.Caption = GWAArray[4] then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack5.Caption = GWAArray[5] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end;

    if CheckAttack5.Caption = WIArray[1] then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack5.Caption = WIArray[2] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack5.Caption = WIArray[3] then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack5.Caption = WIArray[4] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack5.Caption = WIArray[5] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end;

    if CheckAttack5.Caption = TIArray[1] then
    begin
       ProfLifepoints:= ProfLifepoints - 12;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack5.Caption = TIArray[2] then
    begin
       ProfLifepoints:= ProfLifepoints - 20;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack5.Caption = TIArray[3] then
    begin
       ProfLifepoints:= ProfLifepoints - 12;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack5.Caption = TIArray[4] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack5.Caption = TIArray[5] then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end;

    if CheckAttack5.Caption = ProgrammierenArray[1] then
    begin
       ProfLifepoints:= ProfLifepoints - 12;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack5.Caption = ProgrammierenArray[2] then
    begin
       ProfLifepoints:= ProfLifepoints - 20;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack5.Caption = ProgrammierenArray[3] then
    begin
       ProfLifepoints:= ProfLifepoints - 12;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack5.Caption = ProgrammierenArray[4] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack5.Caption = ProgrammierenArray[5] then
    begin
       ProfLifepoints:= ProfLifepoints - 25;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end;

    if CheckAttack5.Caption = BWLArray[1] then
    begin
       ProfLifepoints:= ProfLifepoints - 5;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack5.Caption = BWLArray[2] then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack5.Caption = BWLArray[3] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack5.Caption = BWLArray[4] then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack5.Caption = BWLArray[5] then
    begin
       ProfLifepoints:= ProfLifepoints - 20;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end;
  end;

  if CheckAttack6.Checked = True then
  begin
    if CheckAttack6.Caption = 'Differentialgleichung' then
    begin
       ProfLifepoints:= ProfLifepoints - 12;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack6.Caption = 'Binomische_Formeln' then
    begin
       ProfLifepoints:= ProfLifepoints - 18;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack6.Caption = 'PQ-Formel' then
    begin
       ProfLifepoints:= ProfLifepoints - 12;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack6.Caption = 'Dreisatz' then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack6.Caption = 'Potenzgesetze' then
    begin
       ProfLifepoints:= ProfLifepoints - 18;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end;

    if CheckAttack6.Caption = GWAArray[1] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack6.Caption = GWAArray[2] then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack6.Caption = GWAArray[3] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack6.Caption = GWAArray[4] then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack6.Caption = GWAArray[5] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end;

    if CheckAttack6.Caption = WIArray[1] then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack6.Caption = WIArray[2] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack6.Caption = WIArray[3] then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack6.Caption = WIArray[4] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack6.Caption = WIArray[5] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end;

    if CheckAttack6.Caption = TIArray[1] then
    begin
       ProfLifepoints:= ProfLifepoints - 12;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack6.Caption = TIArray[2] then
    begin
       ProfLifepoints:= ProfLifepoints - 20;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack6.Caption = TIArray[3] then
    begin
       ProfLifepoints:= ProfLifepoints - 12;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack6.Caption = TIArray[4] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack6.Caption = TIArray[5] then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end;

    if CheckAttack6.Caption = ProgrammierenArray[1] then
    begin
       ProfLifepoints:= ProfLifepoints - 12;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack6.Caption = ProgrammierenArray[2] then
    begin
       ProfLifepoints:= ProfLifepoints - 20;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack6.Caption = ProgrammierenArray[3] then
    begin
       ProfLifepoints:= ProfLifepoints - 12;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack6.Caption = ProgrammierenArray[4] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack6.Caption = ProgrammierenArray[5] then
    begin
       ProfLifepoints:= ProfLifepoints - 25;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end;

    if CheckAttack6.Caption = BWLArray[1] then
    begin
       ProfLifepoints:= ProfLifepoints - 5;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack6.Caption = BWLArray[2] then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack6.Caption = BWLArray[3] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack6.Caption = BWLArray[4] then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack6.Caption = BWLArray[5] then
    begin
       ProfLifepoints:= ProfLifepoints - 20;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end;
  end;
    if CheckAttack7.Checked = True then
  begin
    if CheckAttack7.Caption = 'Differentialgleichung' then
    begin
       ProfLifepoints:= ProfLifepoints - 12;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack7.Caption = 'Binomische_Formeln' then
    begin
       ProfLifepoints:= ProfLifepoints - 18;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack7.Caption = 'PQ-Formel' then
    begin
       ProfLifepoints:= ProfLifepoints - 12;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack7.Caption = 'Dreisatz' then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack7.Caption = 'Potenzgesetze' then
    begin
       ProfLifepoints:= ProfLifepoints - 18;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end;

    if CheckAttack7.Caption = GWAArray[1] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack7.Caption = GWAArray[2] then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack7.Caption = GWAArray[3] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack7.Caption = GWAArray[4] then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack7.Caption = GWAArray[5] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end;

    if CheckAttack7.Caption = WIArray[1] then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack7.Caption = WIArray[2] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack7.Caption = WIArray[3] then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack7.Caption = WIArray[4] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack7.Caption = WIArray[5] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end;

    if CheckAttack7.Caption = TIArray[1] then
    begin
       ProfLifepoints:= ProfLifepoints - 12;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack7.Caption = TIArray[2] then
    begin
       ProfLifepoints:= ProfLifepoints - 20;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack7.Caption = TIArray[3] then
    begin
       ProfLifepoints:= ProfLifepoints - 12;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack7.Caption = TIArray[4] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack7.Caption = TIArray[5] then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end;

    if CheckAttack7.Caption = ProgrammierenArray[1] then
    begin
       ProfLifepoints:= ProfLifepoints - 12;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack7.Caption = ProgrammierenArray[2] then
    begin
       ProfLifepoints:= ProfLifepoints - 20;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack7.Caption = ProgrammierenArray[3] then
    begin
       ProfLifepoints:= ProfLifepoints - 12;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack7.Caption = ProgrammierenArray[4] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack7.Caption = ProgrammierenArray[5] then
    begin
       ProfLifepoints:= ProfLifepoints - 25;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end;

    if CheckAttack7.Caption = BWLArray[1] then
    begin
       ProfLifepoints:= ProfLifepoints - 5;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack7.Caption = BWLArray[2] then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack7.Caption = BWLArray[3] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack7.Caption = BWLArray[4] then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack7.Caption = BWLArray[5] then
    begin
       ProfLifepoints:= ProfLifepoints - 20;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end;
  end;

  if CheckAttack8.Checked = True then
  begin
    if CheckAttack8.Caption = 'Differentialgleichung' then
    begin
       ProfLifepoints:= ProfLifepoints - 12;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack8.Caption = 'Binomische_Formeln' then
    begin
       ProfLifepoints:= ProfLifepoints - 18;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack8.Caption = 'PQ-Formel' then
    begin
       ProfLifepoints:= ProfLifepoints - 12;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack8.Caption = 'Dreisatz' then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack8.Caption = 'Potenzgesetze' then
    begin
       ProfLifepoints:= ProfLifepoints - 18;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end;

    if CheckAttack8.Caption = GWAArray[1] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack8.Caption = GWAArray[2] then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack8.Caption = GWAArray[3] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack8.Caption = GWAArray[4] then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack8.Caption = GWAArray[5] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end;

    if CheckAttack8.Caption = WIArray[1] then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack8.Caption = WIArray[2] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack8.Caption = WIArray[3] then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack8.Caption = WIArray[4] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack8.Caption = WIArray[5] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end;

    if CheckAttack8.Caption = TIArray[1] then
    begin
       ProfLifepoints:= ProfLifepoints - 12;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack8.Caption = TIArray[2] then
    begin
       ProfLifepoints:= ProfLifepoints - 20;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack8.Caption = TIArray[3] then
    begin
       ProfLifepoints:= ProfLifepoints - 12;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack8.Caption = TIArray[4] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack8.Caption = TIArray[5] then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end;

    if CheckAttack8.Caption = ProgrammierenArray[1] then
    begin
       ProfLifepoints:= ProfLifepoints - 12;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack8.Caption = ProgrammierenArray[2] then
    begin
       ProfLifepoints:= ProfLifepoints - 20;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack8.Caption = ProgrammierenArray[3] then
    begin
       ProfLifepoints:= ProfLifepoints - 12;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack8.Caption = ProgrammierenArray[4] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack8.Caption = ProgrammierenArray[5] then
    begin
       ProfLifepoints:= ProfLifepoints - 25;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end;

    if CheckAttack8.Caption = BWLArray[1] then
    begin
       ProfLifepoints:= ProfLifepoints - 5;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack8.Caption = BWLArray[2] then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack8.Caption = BWLArray[3] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack8.Caption = BWLArray[4] then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack8.Caption = BWLArray[5] then
    begin
       ProfLifepoints:= ProfLifepoints - 20;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end;
  end;

  Delay1.Enabled:= True;

end;

procedure TForm2.Button3Click(Sender: TObject);
begin

       if CheckAttack9.Checked = True then
  begin
    if CheckAttack9.Caption = 'Differentialgleichung' then
    begin
       ProfLifepoints:= ProfLifepoints - 12;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack9.Caption = 'Binomische_Formeln' then
    begin
       ProfLifepoints:= ProfLifepoints - 18;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack9.Caption = 'PQ-Formel' then
    begin
       ProfLifepoints:= ProfLifepoints - 12;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack9.Caption = 'Dreisatz' then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack9.Caption = 'Potenzgesetze' then
    begin
       ProfLifepoints:= ProfLifepoints - 18;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end;

    if CheckAttack9.Caption = GWAArray[1] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack9.Caption = GWAArray[2] then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack9.Caption = GWAArray[3] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack9.Caption = GWAArray[4] then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack9.Caption = GWAArray[5] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end;

    if CheckAttack9.Caption = WIArray[1] then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack9.Caption = WIArray[2] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack9.Caption = WIArray[3] then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack9.Caption = WIArray[4] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack9.Caption = WIArray[5] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end;

    if CheckAttack9.Caption = TIArray[1] then
    begin
       ProfLifepoints:= ProfLifepoints - 12;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack9.Caption = TIArray[2] then
    begin
       ProfLifepoints:= ProfLifepoints - 20;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack9.Caption = TIArray[3] then
    begin
       ProfLifepoints:= ProfLifepoints - 12;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack9.Caption = TIArray[4] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack9.Caption = TIArray[5] then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end;

    if CheckAttack9.Caption = ProgrammierenArray[1] then
    begin
       ProfLifepoints:= ProfLifepoints - 12;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack9.Caption = ProgrammierenArray[2] then
    begin
       ProfLifepoints:= ProfLifepoints - 20;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack9.Caption = ProgrammierenArray[3] then
    begin
       ProfLifepoints:= ProfLifepoints - 12;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack9.Caption = ProgrammierenArray[4] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack9.Caption = ProgrammierenArray[5] then
    begin
       ProfLifepoints:= ProfLifepoints - 25;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end;

    if CheckAttack9.Caption = BWLArray[1] then
    begin
       ProfLifepoints:= ProfLifepoints - 5;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack9.Caption = BWLArray[2] then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack9.Caption = BWLArray[3] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack9.Caption = BWLArray[4] then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack9.Caption = BWLArray[5] then
    begin
       ProfLifepoints:= ProfLifepoints - 20;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end;
  end;

  if CheckAttack10.Checked = True then
  begin
    if CheckAttack10.Caption = 'Differentialgleichung' then
    begin
       ProfLifepoints:= ProfLifepoints - 12;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack10.Caption = 'Binomische_Formeln' then
    begin
       ProfLifepoints:= ProfLifepoints - 18;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack10.Caption = 'PQ-Formel' then
    begin
       ProfLifepoints:= ProfLifepoints - 12;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack10.Caption = 'Dreisatz' then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack10.Caption = 'Potenzgesetze' then
    begin
       ProfLifepoints:= ProfLifepoints - 18;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end;

    if CheckAttack10.Caption = GWAArray[1] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack10.Caption = GWAArray[2] then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack10.Caption = GWAArray[3] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack10.Caption = GWAArray[4] then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack10.Caption = GWAArray[5] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end;

    if CheckAttack8.Caption = WIArray[1] then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack10.Caption = WIArray[2] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack10.Caption = WIArray[3] then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack10.Caption = WIArray[4] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack10.Caption = WIArray[5] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end;

    if CheckAttack10.Caption = TIArray[1] then
    begin
       ProfLifepoints:= ProfLifepoints - 12;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack10.Caption = TIArray[2] then
    begin
       ProfLifepoints:= ProfLifepoints - 20;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack10.Caption = TIArray[3] then
    begin
       ProfLifepoints:= ProfLifepoints - 12;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack10.Caption = TIArray[4] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack10.Caption = TIArray[5] then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end;

    if CheckAttack10.Caption = ProgrammierenArray[1] then
    begin
       ProfLifepoints:= ProfLifepoints - 12;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack10.Caption = ProgrammierenArray[2] then
    begin
       ProfLifepoints:= ProfLifepoints - 20;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack10.Caption = ProgrammierenArray[3] then
    begin
       ProfLifepoints:= ProfLifepoints - 12;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack10.Caption = ProgrammierenArray[4] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack10.Caption = ProgrammierenArray[5] then
    begin
       ProfLifepoints:= ProfLifepoints - 25;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end;

    if CheckAttack10.Caption = BWLArray[1] then
    begin
       ProfLifepoints:= ProfLifepoints - 5;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack10.Caption = BWLArray[2] then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack10.Caption = BWLArray[3] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack10.Caption = BWLArray[4] then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack10.Caption = BWLArray[5] then
    begin
       ProfLifepoints:= ProfLifepoints - 20;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end;
  end;
      if CheckAttack11.Checked = True then
  begin
    if CheckAttack11.Caption = 'Differentialgleichung' then
    begin
       ProfLifepoints:= ProfLifepoints - 12;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack11.Caption = 'Binomische_Formeln' then
    begin
       ProfLifepoints:= ProfLifepoints - 18;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack1.Caption = 'PQ-Formel' then
    begin
       ProfLifepoints:= ProfLifepoints - 12;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack11.Caption = 'Dreisatz' then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack11.Caption = 'Potenzgesetze' then
    begin
       ProfLifepoints:= ProfLifepoints - 18;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end;

    if CheckAttack11.Caption = GWAArray[1] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack11.Caption = GWAArray[2] then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack11.Caption = GWAArray[3] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack11.Caption = GWAArray[4] then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack11.Caption = GWAArray[5] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end;

    if CheckAttack11.Caption = WIArray[1] then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack11.Caption = WIArray[2] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack11.Caption = WIArray[3] then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack11.Caption = WIArray[4] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack11.Caption = WIArray[5] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end;

    if CheckAttack11.Caption = TIArray[1] then
    begin
       ProfLifepoints:= ProfLifepoints - 12;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack11.Caption = TIArray[2] then
    begin
       ProfLifepoints:= ProfLifepoints - 20;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack11.Caption = TIArray[3] then
    begin
       ProfLifepoints:= ProfLifepoints - 12;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack11.Caption = TIArray[4] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack11.Caption = TIArray[5] then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end;

    if CheckAttack11.Caption = ProgrammierenArray[1] then
    begin
       ProfLifepoints:= ProfLifepoints - 12;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack11.Caption = ProgrammierenArray[2] then
    begin
       ProfLifepoints:= ProfLifepoints - 20;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack11.Caption = ProgrammierenArray[3] then
    begin
       ProfLifepoints:= ProfLifepoints - 12;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack11.Caption = ProgrammierenArray[4] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack11.Caption = ProgrammierenArray[5] then
    begin
       ProfLifepoints:= ProfLifepoints - 25;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end;

    if CheckAttack11.Caption = BWLArray[1] then
    begin
       ProfLifepoints:= ProfLifepoints - 5;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack11.Caption = BWLArray[2] then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack11.Caption = BWLArray[3] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack11.Caption = BWLArray[4] then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack11.Caption = BWLArray[5] then
    begin
       ProfLifepoints:= ProfLifepoints - 20;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end;
  end;

  if CheckAttack12.Checked = True then
  begin
    if CheckAttack12.Caption = 'Differentialgleichung' then
    begin
       ProfLifepoints:= ProfLifepoints - 12;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack12.Caption = 'Binomische_Formeln' then
    begin
       ProfLifepoints:= ProfLifepoints - 18;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack12.Caption = 'PQ-Formel' then
    begin
       ProfLifepoints:= ProfLifepoints - 12;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack12.Caption = 'Dreisatz' then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack12.Caption = 'Potenzgesetze' then
    begin
       ProfLifepoints:= ProfLifepoints - 18;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end;

    if CheckAttack12.Caption = GWAArray[1] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack12.Caption = GWAArray[2] then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack12.Caption = GWAArray[3] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack12.Caption = GWAArray[4] then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack12.Caption = GWAArray[5] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end;

    if CheckAttack12.Caption = WIArray[1] then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack12.Caption = WIArray[2] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack12.Caption = WIArray[3] then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack12.Caption = WIArray[4] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack12.Caption = WIArray[5] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end;

    if CheckAttack12.Caption = TIArray[1] then
    begin
       ProfLifepoints:= ProfLifepoints - 12;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack12.Caption = TIArray[2] then
    begin
       ProfLifepoints:= ProfLifepoints - 20;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack12.Caption = TIArray[3] then
    begin
       ProfLifepoints:= ProfLifepoints - 12;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack12.Caption = TIArray[4] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack12.Caption = TIArray[5] then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end;

    if CheckAttack12.Caption = ProgrammierenArray[1] then
    begin
       ProfLifepoints:= ProfLifepoints - 12;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack12.Caption = ProgrammierenArray[2] then
    begin
       ProfLifepoints:= ProfLifepoints - 20;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack12.Caption = ProgrammierenArray[3] then
    begin
       ProfLifepoints:= ProfLifepoints - 12;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack12.Caption = ProgrammierenArray[4] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack12.Caption = ProgrammierenArray[5] then
    begin
       ProfLifepoints:= ProfLifepoints - 25;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end;

    if CheckAttack12.Caption = BWLArray[1] then
    begin
       ProfLifepoints:= ProfLifepoints - 5;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack12.Caption = BWLArray[2] then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text:= IntToStr(ProfLifepoints);
    end
    else if CheckAttack12.Caption = BWLArray[3] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack12.Caption = BWLArray[4] then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack12.Caption = BWLArray[5] then
    begin
       ProfLifepoints:= ProfLifepoints - 20;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end;
  end;

  Delay2.Enabled:= True;

end;

procedure TForm2.CheckAttack1Change(Sender: TObject);
begin

end;

procedure TForm2.Delay1Timer(Sender: TObject);
begin
   RandomDamage:= Random(5);

  if RandomDamage = 1 then
  begin
     Spicker2Lifepoints:= Spicker2Lifepoints - 10;
  end
  else if RandomDamage = 3 then
  begin
     Spicker2Lifepoints:= Spicker2Lifepoints - 12;
  end
  else if RandomDamage = 4 then
  begin
     Spicker2Lifepoints:= Spicker2Lifepoints - 15;
  end
  else if RandomDamage = 5 then
  begin
     Spicker2Lifepoints:= Spicker2Lifepoints - 18;
  end;
   if SwitchSpicker1.Checked = False then
  begin
  LabeledEdit1.Text:= IntToStr(Spicker2Lifepoints);
  end;

  if SwitchSpicker2.Checked = True then
  begin
    SpickerTab1.Enabled:= True;
    SpickerTab3.Enabled:= True;
  end;

  Delay1.Enabled:= False;

  Button2.Enabled:= True;
end;

procedure TForm2.DelayTimer(Sender: TObject);
begin
  RandomDamage:= Random(5);

  if RandomDamage = 1 then
  begin
     Spicker1Lifepoints:= Spicker1Lifepoints - 10;
     Memo1.Lines.Add('Der Professor geht eine Runde');
  end
  else if RandomDamage = 2 then
  begin
    Memo1.Lines.Add('Der Professor trinkt Kaffee');
  end
  else if RandomDamage = 3 then
  begin
     Spicker1Lifepoints:= Spicker1Lifepoints - 12;
     Memo1.Lines.Add('Der Professor steht hinter dir');
  end
  else if RandomDamage = 4 then
  begin
     Spicker1Lifepoints:= Spicker1Lifepoints - 15;
     Memo1.Lines.Add('Der Professor kontrolliert deine Federmappe');
  end
  else if RandomDamage = 5 then
  begin
     Spicker1Lifepoints:= Spicker1Lifepoints - 18;
     Memo1.Lines.Add('Der Professor findet einen Spicken');
  end;
   if SwitchSpicker1.Checked = False then
  begin
  LabeledEdit1.Text:= IntToStr(Spicker1Lifepoints);
  end;

  if SwitchSpicker1.Checked = True then
  begin
    SpickerTab2.Enabled:= True;
    SpickerTab3.Enabled:= True;
  end;

  Delay.Enabled:= False;

  Button1.Enabled:= True;
end;


procedure TForm2.Delay2Timer(Sender: TObject);
begin
  RandomDamage:= Random(5);

  if RandomDamage = 1 then
  begin
     Spicker3Lifepoints:= Spicker3Lifepoints - 10;
  end
  else if RandomDamage = 3 then
  begin
     Spicker3Lifepoints:= Spicker3Lifepoints - 12;
  end
  else if RandomDamage = 4 then
  begin
     Spicker3Lifepoints:= Spicker3Lifepoints - 15;
  end
  else if RandomDamage = 5 then
  begin
     Spicker3Lifepoints:= Spicker3Lifepoints - 18;
  end;
  if SwitchSpicker3.Checked = False then
  begin
  LabeledEdit1.Text:= IntToStr(Spicker3Lifepoints);
  end;

  if SwitchSpicker3.Checked = True then
  begin
    SpickerTab1.Enabled:= True;
    SpickerTab2.Enabled:= True;
  end;

  Delay2.Enabled:= False;
  Button3.Enabled:= True;
end;

procedure TForm2.DelayStartTimer(Sender: TObject);
begin
  Button1.Enabled:= False;
end;



procedure TForm2.SpickerTab1Enter(Sender: TObject);
begin
    SpickerTab2.Enabled:= False;
    SpickerTab3.Enabled:= False;
end;

procedure TForm2.SpickerTab2Enter(Sender: TObject);
begin
    SpickerTab1.Enabled:= False;
    SpickerTab3.Enabled:= False;
end;

procedure TForm2.SpickerTab3Enter(Sender: TObject);
begin
    SpickerTab1.Enabled:= False;
    SpickerTab2.Enabled:= False;
end;


end.

