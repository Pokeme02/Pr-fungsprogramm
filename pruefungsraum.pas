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
    Button5: TButton;
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
    Label1: TLabel;
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
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure CheckAttack1Change(Sender: TObject);
    procedure Delay1StartTimer(Sender: TObject);
    procedure Delay1Timer(Sender: TObject);
    procedure Delay2StartTimer(Sender: TObject);
    procedure Delay2Timer(Sender: TObject);
    procedure DelayStartTimer(Sender: TObject);
    procedure DelayTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure LabeledEdit1Change(Sender: TObject);
    procedure LabeledEdit2Change(Sender: TObject);
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
  MatheArray: array[0..4] of String;
  GWAArray: array[0..4] of String;
  WIArray: array[0..4] of String;
  TIArray: array[0..4] of String;
  ProgrammierenArray: array[0..4] of String;
  BWLArray: array[0..4] of String;
  OpponentAttackArray: array[1..5] of String;
  ProfLifepoints: integer;
  Spicker1Lifepoints: integer;
  Spicker2Lifepoints: integer;
  Spicker3Lifepoints: integer;


implementation



{$R *.lfm}

{ TForm2 }

//Namesanzeige + Lebenspunkte nach Spickerwechsel
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
  // Arrays Mit Namen der Angriffe
  MatheArray[0]:= 'Differentialgleichung';
  MatheArray[1]:= 'Binomische Formeln';
  MatheArray[2]:= 'PQ-Formel';
  MatheArray[3]:= 'Dreisatz';
  MatheArray[4]:= 'Potenzgesetze';

  GWAArray[0]:= 'Zitierarten';
  GWAArray[1]:= 'Zeitmanagment';
  GWAArray[2]:= 'Kommunikation';
  GWAArray[3]:= 'Lerntechniken';
  GWAArray[4]:= 'Paesentiertechniken';

  WIArray[0]:=  'Datenbanken';
  WIArray[1]:=  'Neumann Architektur';
  WIArray[2]:=  'Arithmetische Befehle';
  WIArray[3]:=  'Rechner Struktur';
  WIArray[4]:=  'CSP';

  TIArray[0]:=  'Boolesche Funktionen';
  TIArray[1]:=  'KV Diagramme';
  TIArray[2]:=  'URI';
  TIArray[3]:=  'ASCII';
  TIArray[4]:=  'Zweier Komplement';

  ProgrammierenArray[0]:= 'ForSchleife';
  ProgrammierenArray[1]:= 'While Schleife';
  ProgrammierenArray[2]:= 'Zuweisungsstatements';
  ProgrammierenArray[3]:= 'GUI';
  ProgrammierenArray[4]:= 'Semikolon';

  BWLArray[0]:= 'ABC Analyse';
  BWLArray[1]:= 'Lagerhaltung';
  BWLArray[2]:= 'EVA Prinzip';
  BWLArray[3]:= 'Prozessmamagement';
  BWLArray[4]:= 'Produktionsfaktoren';

  OpponentAttackArray[1]:= 'Geht eine Runde';
  OpponentAttackArray[2]:= 'Kaffee trinken';
  OpponentAttackArray[3]:= 'Wird Sauer';
  OpponentAttackArray[4]:= 'Aufgaben aus höherem Semester';
  OpponentAttackArray[5]:= 'Taschenrechner weg';


  // Random Zahlen für Attackenzuweisung
  Randomize;
  RandomMath:= Random(2);
  RandomMath2:= Random(1) + 2;
  RandomGWA:=  Random(2);
  RandomGWA2:=  Random(1)+2;
  RandomWI:= Random(2);
  RandomWI2:= Random(1) + 2;
  RandomTI:= Random(2);
  RandomTI2:= Random(1) +2;
  RandomProgrammieren:= Random(2);
  RandomProgrammieren2:= Random(1) +2;
  RandomBWL:= Random(2);
  RandomBWL2:= Random(1) + 2;

  //Zuweisung der Tabnamen durch ID's
  if IDArray[1] = 1 then
    begin
        SpickerTab1.Caption := 'Mathe';
        Randomize;
        Random5:=    Random(4);

        CheckAttack1.Caption:= MatheArray[RandomMath];
        CheckAttack2.Caption:= MatheArray[RandomMath2];
        CheckAttack3.Caption:= BWLArray[Random5];
        CheckAttack4.Caption:= TIArray[Random5];
    end
  else if IDArray[1] = 2 then
    begin
        SpickerTab1.Caption := 'WI';
        Randomize;
        Random5:= Random(4);

        CheckAttack1.Caption:= WIArray[RandomWI];
        CheckAttack2.Caption:= WIArray[RandomWI2];
        CheckAttack3.Caption:= MatheArray[Random5];
        CheckAttack4.Caption:= GWAArray[Random5];
    end
  else if IDArray[1] = 3 then
    begin
        SpickerTab1.Caption := 'GWA';
        Randomize;
        Random5:= Random(4);

        CheckAttack1.Caption:= GWAArray[RandomGWA];
        CheckAttack2.Caption:= GWAArray[RandomGWA2];
        CheckAttack3.Caption:= ProgrammierenArray[Random5];
        CheckAttack4.Caption:= MatheArray[Random5];
    end
  else if IDArray[1] = 4 then
    begin
        SpickerTab1.Caption := 'BWL';
        Randomize;
        Random5:= Random(4);

        CheckAttack1.Caption:= BWLArray[RandomBWL];
        CheckAttack2.Caption:= BWLArray[RandomBWL2];
        CheckAttack3.Caption:= TIArray[Random5];
        CheckAttack4.Caption:= WIArray[Random5];
    end
  else if IDArray[1] = 5 then
    begin
        SpickerTab1.Caption := 'Programmieren';
        Randomize;
        Random5:= Random(4);

        CheckAttack1.Caption:= ProgrammierenArray[RandomProgrammieren];
        CheckAttack2.Caption:= ProgrammierenArray[RandomProgrammieren2];
        CheckAttack3.Caption:= GWAArray[Random5];
        CheckAttack4.Caption:= WIArray[Random5];
    end
  else if IDArray[1] = 6 then
    begin
        SpickerTab1.Caption := 'TI';
        Randomize;
        Random5:= Random(4);

        CheckAttack1.Caption:= TIArray[RandomTI];
        CheckAttack2.Caption:= TIArray[RandomTI2];
        CheckAttack3.Caption:= ProgrammierenArray[Random5];
        CheckAttack4.Caption:= BWLArray[Random5];
    end;

  if IDArray[2] = 1 then
    begin
        SpickerTab2.Caption := 'Mathe';
        Randomize;
        Random5:=    Random(4);

        CheckAttack5.Caption:= MatheArray[RandomMath];
        CheckAttack6.Caption:= MatheArray[RandomMath2];
        CheckAttack7.Caption:= BWLArray[Random5];
        CheckAttack8.Caption:= TIArray[Random5];
    end
  else if IDArray[2] = 2 then
    begin
        SpickerTab2.Caption := 'WI';
        Randomize;
        Random5:= Random(4);

        CheckAttack5.Caption:= WIArray[RandomWI];
        CheckAttack6.Caption:= WIArray[RandomWI2];
        CheckAttack7.Caption:= MatheArray[Random5];
        CheckAttack8.Caption:= GWAArray[Random5];
    end
  else if IDArray[2] = 3 then
    begin
        SpickerTab2.Caption := 'GWA';
        Randomize;
        Random5:= Random(4);

        CheckAttack5.Caption:= GWAArray[RandomGWA];
        CheckAttack6.Caption:= GWAArray[RandomGWA2];
        CheckAttack7.Caption:= ProgrammierenArray[Random5];
        CheckAttack8.Caption:= MatheArray[Random5];
    end
  else if IDArray[2] = 4 then
    begin
        SpickerTab2.Caption := 'BWL';
        Randomize;
        Random5:= Random(4);

        CheckAttack5.Caption:= BWLArray[RandomBWL];
        CheckAttack6.Caption:= BWLArray[RandomBWL2];
        CheckAttack7.Caption:= TIArray[Random5];
        CheckAttack8.Caption:= WIArray[Random5];
    end
  else if IDArray[2] = 5 then
    begin
        SpickerTab2.Caption := 'Programmieren';
        Randomize;
        Random5:= Random(4);

        CheckAttack5.Caption:= ProgrammierenArray[RandomProgrammieren];
        CheckAttack6.Caption:= ProgrammierenArray[RandomProgrammieren2];
        CheckAttack7.Caption:= GWAArray[Random5];
        CheckAttack8.Caption:= WIArray[Random5];
    end
  else if IDArray[2] = 6 then
    begin
        SpickerTab2.Caption := 'TI';
        Randomize;
        Random5:= Random(4);

        CheckAttack5.Caption:= TIArray[RandomTI];
        CheckAttack6.Caption:= TIArray[RandomTI2];
        CheckAttack7.Caption:= ProgrammierenArray[Random5];
        CheckAttack8.Caption:= BWLArray[Random5];
    end;

  if IDArray[3] = 1 then
    begin
        SpickerTab3.Caption := 'Mathe';
        Randomize;
        Random5:=    Random(4);

        CheckAttack9.Caption:= MatheArray[RandomMath];
        CheckAttack10.Caption:= MatheArray[RandomMath2];
        CheckAttack11.Caption:= BWLArray[Random5];
        CheckAttack12.Caption:= TIArray[Random5];
    end
  else if IDArray[3] = 2 then
    begin
        SpickerTab3.Caption := 'WI';
        Randomize;
        Random5:= Random(4);

        CheckAttack9.Caption:= WIArray[RandomWI];
        CheckAttack10.Caption:= WIArray[RandomWI2];
        CheckAttack11.Caption:= MatheArray[Random5];
        CheckAttack12.Caption:= GWAArray[Random5];
    end
  else if IDArray[3] = 3 then
    begin
        SpickerTab3.Caption := 'GWA';
        Randomize;
        Random5:= Random(4);

        CheckAttack9.Caption:= GWAArray[RandomGWA];
        CheckAttack10.Caption:= GWAArray[RandomGWA2];
        CheckAttack11.Caption:= ProgrammierenArray[Random5];
        CheckAttack12.Caption:= MatheArray[Random5];
    end
  else if IDArray[3] = 4 then
    begin
        SpickerTab3.Caption := 'BWL';
        Randomize;
        Random5:= Random(4);

        CheckAttack9.Caption:= BWLArray[RandomBWL];
        CheckAttack10.Caption:= BWLArray[RandomBWL2];
        CheckAttack11.Caption:= TIArray[Random5];
        CheckAttack12.Caption:= WIArray[Random5];
    end
  else if IDArray[3] = 5 then
    begin
        SpickerTab3.Caption := 'Programmieren';
        Randomize;
        Random5:= Random(4);

        CheckAttack9.Caption:= ProgrammierenArray[RandomProgrammieren];
        CheckAttack10.Caption:= ProgrammierenArray[RandomProgrammieren2];
        CheckAttack11.Caption:= GWAArray[Random5];
        CheckAttack12.Caption:= WIArray[Random5];
    end
  else if IDArray[3] = 6 then
    begin
        SpickerTab3.Caption := 'TI';
        Randomize;
        Random5:= Random(4);

        CheckAttack9.Caption:= TIArray[RandomTI];
        CheckAttack10.Caption:= TIArray[RandomTI2];
        CheckAttack11.Caption:= ProgrammierenArray[Random5];
        CheckAttack12.Caption:= BWLArray[Random5];
    end;


  FightCounter:= 1;
  
  LabeledEdit2.EditLabel.Caption:= 'Rauscher';

  LabeledEdit1.EditLabel.Caption:= SpickerTab1.Caption;

  Spicker1Lifepoints:= 100;
  Spicker2Lifepoints:= 100;
  Spicker3Lifepoints:= 100;
  ProfLifepoints:= 100;

  LabeledEdit1.Text:= IntToStr(Spicker1Lifepoints);
  LabeledEdit2.Text:= IntToStr(ProfLifepoints);

   Memo1.Clear;
   Memo1.Lines.Add('Kampf Log');

end;

//spicker hp nicht unter null + spicker disabled
procedure TForm2.LabeledEdit1Change(Sender: TObject);
begin
    if Spicker1Lifepoints <= 0 then
  begin
      SpickerTab2.Enabled:= True;
      SpickerTab3.Enabled:= True;

      Spicker1Lifepoints:= 0;

      if Spicker2Lifepoints > 0 then
      begin
          if SwitchSpicker2.Checked = False then
          begin
          PageControl1.ActivePage:= SpickerTab2;
          LabeledEdit1.EditLabel.Caption:= SpickerTab2.Caption;
          LabeledEdit1.Text:= IntToStr(Spicker2Lifepoints);
          end
          else begin
             SwitchSpicker2.Checked:= False;
          end;
      end
      else if Spicker3Lifepoints > 0 then
      begin
          if SwitchSpicker3.Checked = False then
          begin
          PageControl1.ActivePage:= SpickerTab3;
          LabeledEdit1.EditLabel.Caption:= SpickerTab3.Caption;
          LabeledEdit1.Text:= IntToStr(Spicker3Lifepoints);
          end
          else begin
               SwitchSpicker3.Checked:= False;
          end;
      end
      else begin
         Memo1.Font.Height:= 100;
         Memo1.Lines.Add('VERLOREN!');
         PageControl1.Enabled:= False;
         LabeledEdit1.Visible:= False;
         LabeledEdit2.Visible:= False;
      end;
  end;

    if Spicker2Lifepoints <= 0 then
      begin
        SpickerTab3.Enabled:= True;
        SpickerTab1.Enabled:= True;

        Spicker2Lifepoints:= 0;

        if Spicker1Lifepoints > 0 then
        begin
          if SwitchSpicker1.Checked = False then
          begin
            PageControl1.ActivePage:= SpickerTab1;
            LabeledEdit1.EditLabel.Caption:= SpickerTab1.Caption;
            LabeledEdit1.Text:= IntToStr(Spicker1Lifepoints);
          end
          else begin
               SwitchSpicker1.Checked:= False;
          end;
        end
        else if Spicker3Lifepoints > 0 then
        begin
          if SwitchSpicker3.Checked = False then
          begin
            PageControl1.ActivePage:= SpickerTab3;
            LabeledEdit1.EditLabel.Caption:= SpickerTab3.Caption;
            LabeledEdit1.Text:= IntToStr(Spicker3Lifepoints);
          end
          else begin
               SwitchSpicker3.Checked:= False;
          end;
        end
        else begin
         Memo1.Font.Height:= 100;
         Memo1.Lines.Add('VERLOREN!');
         PageControl1.Enabled:= False;
         LabeledEdit1.Visible:= False;
         LabeledEdit2.Visible:= False;
        end;
      end;
    if Spicker3Lifepoints <= 0 then
      begin
           SpickerTab1.Enabled:= True;
           SpickerTab2.Enabled:= True;

           Spicker3Lifepoints:= 0;

        if Spicker1Lifepoints > 0 then
        begin
          if SwitchSpicker1.Checked = False then
          begin
            PageControl1.ActivePage:= SpickerTab1;
            LabeledEdit1.EditLabel.Caption:= SpickerTab1.Caption;
            LabeledEdit1.Text:= IntToStr(Spicker1Lifepoints);
          end
          else begin
               SwitchSpicker1.Checked:= False;
          end;
        end
        else if Spicker2Lifepoints > 0 then
        begin
          if SwitchSpicker2.Checked = False then
          begin
            PageControl1.ActivePage:= SpickerTab2;
            LabeledEdit1.EditLabel.Caption:= SpickerTab2.Caption;
            LabeledEdit1.Text:= IntToStr(Spicker2Lifepoints);
          end
          else begin
               SwitchSpicker2.Checked:= False;
          end;
        end
        else begin
         Memo1.Font.Height:= 100;
         Memo1.Lines.Add('VERLOREN!');
         PageControl1.Enabled:= False;
         LabeledEdit1.Visible:= False;
         LabeledEdit2.Visible:= False;
        end;
      end;
end;



//prof hp nicht unter null + Endscreen auslösen
procedure TForm2.LabeledEdit2Change(Sender: TObject);
begin
  if ProfLifepoints <= 0 then
  begin
      LabeledEdit2.Text:= '0';

      Label1.Visible:= True;
      Button5.Visible:= True;
      Memo1.Visible:= False;
      PageControl1.Enabled:= False;
  end;
end;

   // Auslösung der angriffe damage + visuelle wiedergabe

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

    if CheckAttack1.Caption = GWAArray[0] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack1.Caption = GWAArray[1] then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack1.Caption = GWAArray[2] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack1.Caption = GWAArray[3] then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack1.Caption = GWAArray[4] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end;

    if CheckAttack1.Caption = WIArray[0] then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack1.Caption = WIArray[1] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack1.Caption = WIArray[2] then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack1.Caption = WIArray[3] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack1.Caption = WIArray[4] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end;

    if CheckAttack1.Caption = TIArray[0] then
    begin
       ProfLifepoints:= ProfLifepoints - 12;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack1.Caption = TIArray[1] then
    begin
       ProfLifepoints:= ProfLifepoints - 20;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack1.Caption = TIArray[2] then
    begin
       ProfLifepoints:= ProfLifepoints - 12;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack1.Caption = TIArray[3] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack1.Caption = TIArray[4] then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end;

    if CheckAttack1.Caption = ProgrammierenArray[0] then
    begin
       ProfLifepoints:= ProfLifepoints - 12;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack1.Caption = ProgrammierenArray[1] then
    begin
       ProfLifepoints:= ProfLifepoints - 20;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack1.Caption = ProgrammierenArray[2] then
    begin
       ProfLifepoints:= ProfLifepoints - 12;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack1.Caption = ProgrammierenArray[3] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack1.Caption = ProgrammierenArray[4] then
    begin
       ProfLifepoints:= ProfLifepoints - 25;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end;

    if CheckAttack1.Caption = BWLArray[0] then
    begin
       ProfLifepoints:= ProfLifepoints - 5;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack1.Caption = BWLArray[1] then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack1.Caption = BWLArray[2] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack1.Caption = BWLArray[3] then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack1.Caption = BWLArray[4] then
    begin
       ProfLifepoints:= ProfLifepoints - 20;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end;
    Memo1.Lines.Add('Spicker setzt ' + CheckAttack1.Caption + ' ein');
  end;

  if CheckAttack2.Checked = True then
  begin
    if CheckAttack2.Caption = 'Differentialgleichung' then
    begin
       ProfLifepoints:= ProfLifepoints - 12;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack2.Caption = 'Binomische Formeln' then
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

    if CheckAttack2.Caption = GWAArray[0] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack2.Caption = GWAArray[1] then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack2.Caption = GWAArray[2] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack2.Caption = GWAArray[3] then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack2.Caption = GWAArray[4] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end;

    if CheckAttack2.Caption = WIArray[0] then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack2.Caption = WIArray[1] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack2.Caption = WIArray[2] then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack2.Caption = WIArray[3] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack2.Caption = WIArray[4] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end;

    if CheckAttack2.Caption = TIArray[0] then
    begin
       ProfLifepoints:= ProfLifepoints - 12;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack2.Caption = TIArray[1] then
    begin
       ProfLifepoints:= ProfLifepoints - 20;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack2.Caption = TIArray[2] then
    begin
       ProfLifepoints:= ProfLifepoints - 12;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack2.Caption = TIArray[3] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack2.Caption = TIArray[4] then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end;

    if CheckAttack2.Caption = ProgrammierenArray[0] then
    begin
       ProfLifepoints:= ProfLifepoints - 12;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack2.Caption = ProgrammierenArray[1] then
    begin
       ProfLifepoints:= ProfLifepoints - 20;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack2.Caption = ProgrammierenArray[2] then
    begin
       ProfLifepoints:= ProfLifepoints - 12;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack2.Caption = ProgrammierenArray[3] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack2.Caption = ProgrammierenArray[4] then
    begin
       ProfLifepoints:= ProfLifepoints - 25;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end;

    if CheckAttack2.Caption = BWLArray[0] then
    begin
       ProfLifepoints:= ProfLifepoints - 5;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack2.Caption = BWLArray[1] then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack2.Caption = BWLArray[2] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack2.Caption = BWLArray[3] then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack2.Caption = BWLArray[4] then
    begin
       ProfLifepoints:= ProfLifepoints - 20;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end;

    Memo1.Lines.Add('Spicker setzt ' + CheckAttack2.Caption + ' ein');
  end;

       if CheckAttack3.Checked = True then
  begin
    if CheckAttack3.Caption = 'Differentialgleichung' then
    begin
       ProfLifepoints:= ProfLifepoints - 12;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack3.Caption = 'Binomische Formeln' then
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

    if CheckAttack3.Caption = GWAArray[0] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack3.Caption = GWAArray[1] then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack3.Caption = GWAArray[2] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack3.Caption = GWAArray[3] then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack3.Caption = GWAArray[4] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end;

    if CheckAttack3.Caption = WIArray[0] then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack3.Caption = WIArray[1] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack3.Caption = WIArray[2] then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack3.Caption = WIArray[3] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack3.Caption = WIArray[4] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end;

    if CheckAttack3.Caption = TIArray[0] then
    begin
       ProfLifepoints:= ProfLifepoints - 12;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack3.Caption = TIArray[1] then
    begin
       ProfLifepoints:= ProfLifepoints - 20;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack3.Caption = TIArray[2] then
    begin
       ProfLifepoints:= ProfLifepoints - 12;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack3.Caption = TIArray[3] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack3.Caption = TIArray[4] then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end;

    if CheckAttack3.Caption = ProgrammierenArray[0] then
    begin
       ProfLifepoints:= ProfLifepoints - 12;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack3.Caption = ProgrammierenArray[1] then
    begin
       ProfLifepoints:= ProfLifepoints - 20;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack3.Caption = ProgrammierenArray[2] then
    begin
       ProfLifepoints:= ProfLifepoints - 12;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack3.Caption = ProgrammierenArray[3] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack3.Caption = ProgrammierenArray[4] then
    begin
       ProfLifepoints:= ProfLifepoints - 25;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end;

    if CheckAttack3.Caption = BWLArray[0] then
    begin
       ProfLifepoints:= ProfLifepoints - 5;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack3.Caption = BWLArray[1] then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack3.Caption = BWLArray[2] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack3.Caption = BWLArray[3] then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack3.Caption = BWLArray[4] then
    begin
       ProfLifepoints:= ProfLifepoints - 20;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end;
    Memo1.Lines.Add('Spicker setzt ' + CheckAttack3.Caption + ' ein');
  end;

  if CheckAttack4.Checked = True then
  begin
    if CheckAttack4.Caption = 'Differentialgleichung' then
    begin
       ProfLifepoints:= ProfLifepoints - 12;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack4.Caption = 'Binomische Formeln' then
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

    if CheckAttack4.Caption = GWAArray[0] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack4.Caption = GWAArray[1] then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack4.Caption = GWAArray[2] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack4.Caption = GWAArray[3] then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack4.Caption = GWAArray[4] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end;

    if CheckAttack4.Caption = WIArray[0] then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack4.Caption = WIArray[1] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack4.Caption = WIArray[2] then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack4.Caption = WIArray[3] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack4.Caption = WIArray[4] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end;

    if CheckAttack4.Caption = TIArray[0] then
    begin
       ProfLifepoints:= ProfLifepoints - 12;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack4.Caption = TIArray[1] then
    begin
       ProfLifepoints:= ProfLifepoints - 20;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack4.Caption = TIArray[2] then
    begin
       ProfLifepoints:= ProfLifepoints - 12;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack4.Caption = TIArray[3] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack4.Caption = TIArray[4] then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end;

    if CheckAttack4.Caption = ProgrammierenArray[0] then
    begin
       ProfLifepoints:= ProfLifepoints - 12;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack4.Caption = ProgrammierenArray[1] then
    begin
       ProfLifepoints:= ProfLifepoints - 20;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack4.Caption = ProgrammierenArray[2] then
    begin
       ProfLifepoints:= ProfLifepoints - 12;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack4.Caption = ProgrammierenArray[3] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack4.Caption = ProgrammierenArray[4] then
    begin
       ProfLifepoints:= ProfLifepoints - 25;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end;

    if CheckAttack4.Caption = BWLArray[0] then
    begin
       ProfLifepoints:= ProfLifepoints - 5;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack4.Caption = BWLArray[1] then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack4.Caption = BWLArray[2] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack4.Caption = BWLArray[3] then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack4.Caption = BWLArray[4] then
    begin
       ProfLifepoints:= ProfLifepoints - 20;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end;
    Memo1.Lines.Add('Spicker setzt ' + CheckAttack4.Caption + ' ein');
  end;

  Delay.Enabled:= True;

  if SwitchSpicker1.Checked = True then
  begin
    SpickerTab2.Enabled:= True;
    SpickerTab3.Enabled:= True;
  end;

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
    else if CheckAttack5.Caption = 'Binomische Formeln' then
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

    if CheckAttack5.Caption = GWAArray[0] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack5.Caption = GWAArray[1] then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack5.Caption = GWAArray[2] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack5.Caption = GWAArray[3] then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack5.Caption = GWAArray[4] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end;

    if CheckAttack5.Caption = WIArray[0] then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack5.Caption = WIArray[1] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack5.Caption = WIArray[2] then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack5.Caption = WIArray[3] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack5.Caption = WIArray[4] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end;

    if CheckAttack5.Caption = TIArray[0] then
    begin
       ProfLifepoints:= ProfLifepoints - 12;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack5.Caption = TIArray[1] then
    begin
       ProfLifepoints:= ProfLifepoints - 20;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack5.Caption = TIArray[2] then
    begin
       ProfLifepoints:= ProfLifepoints - 12;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack5.Caption = TIArray[3] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack5.Caption = TIArray[4] then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end;

    if CheckAttack5.Caption = ProgrammierenArray[0] then
    begin
       ProfLifepoints:= ProfLifepoints - 12;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack5.Caption = ProgrammierenArray[1] then
    begin
       ProfLifepoints:= ProfLifepoints - 20;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack5.Caption = ProgrammierenArray[2] then
    begin
       ProfLifepoints:= ProfLifepoints - 12;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack5.Caption = ProgrammierenArray[3] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack5.Caption = ProgrammierenArray[4] then
    begin
       ProfLifepoints:= ProfLifepoints - 25;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end;

    if CheckAttack5.Caption = BWLArray[0] then
    begin
       ProfLifepoints:= ProfLifepoints - 5;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack5.Caption = BWLArray[1] then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack5.Caption = BWLArray[2] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack5.Caption = BWLArray[3] then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack5.Caption = BWLArray[4] then
    begin
       ProfLifepoints:= ProfLifepoints - 20;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end;
    Memo1.Lines.Add('Spicker setzt ' + CheckAttack5.Caption + ' ein');
  end;

  if CheckAttack6.Checked = True then
  begin
    if CheckAttack6.Caption = 'Differentialgleichung' then
    begin
       ProfLifepoints:= ProfLifepoints - 12;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack6.Caption = 'Binomische Formeln' then
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

    if CheckAttack6.Caption = GWAArray[0] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack6.Caption = GWAArray[1] then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack6.Caption = GWAArray[2] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack6.Caption = GWAArray[3] then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack6.Caption = GWAArray[4] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end;

    if CheckAttack6.Caption = WIArray[0] then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack6.Caption = WIArray[1] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack6.Caption = WIArray[2] then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack6.Caption = WIArray[3] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack6.Caption = WIArray[4] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end;

    if CheckAttack6.Caption = TIArray[0] then
    begin
       ProfLifepoints:= ProfLifepoints - 12;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack6.Caption = TIArray[1] then
    begin
       ProfLifepoints:= ProfLifepoints - 20;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack6.Caption = TIArray[2] then
    begin
       ProfLifepoints:= ProfLifepoints - 12;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack6.Caption = TIArray[3] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack6.Caption = TIArray[4] then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end;

    if CheckAttack6.Caption = ProgrammierenArray[0] then
    begin
       ProfLifepoints:= ProfLifepoints - 12;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack6.Caption = ProgrammierenArray[1] then
    begin
       ProfLifepoints:= ProfLifepoints - 20;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack6.Caption = ProgrammierenArray[2] then
    begin
       ProfLifepoints:= ProfLifepoints - 12;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack6.Caption = ProgrammierenArray[3] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack6.Caption = ProgrammierenArray[4] then
    begin
       ProfLifepoints:= ProfLifepoints - 25;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end;

    if CheckAttack6.Caption = BWLArray[0] then
    begin
       ProfLifepoints:= ProfLifepoints - 5;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack6.Caption = BWLArray[1] then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack6.Caption = BWLArray[2] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack6.Caption = BWLArray[3] then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack6.Caption = BWLArray[4] then
    begin
       ProfLifepoints:= ProfLifepoints - 20;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end;
    Memo1.Lines.Add('Spicker setzt ' + CheckAttack6.Caption + ' ein');
  end;
    if CheckAttack7.Checked = True then
  begin
    if CheckAttack7.Caption = 'Differentialgleichung' then
    begin
       ProfLifepoints:= ProfLifepoints - 12;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack7.Caption = 'Binomische Formeln' then
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

    if CheckAttack7.Caption = GWAArray[0] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack7.Caption = GWAArray[1] then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack7.Caption = GWAArray[2] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack7.Caption = GWAArray[3] then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack7.Caption = GWAArray[4] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end;

    if CheckAttack7.Caption = WIArray[0] then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack7.Caption = WIArray[1] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack7.Caption = WIArray[2] then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack7.Caption = WIArray[3] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack7.Caption = WIArray[4] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end;

    if CheckAttack7.Caption = TIArray[0] then
    begin
       ProfLifepoints:= ProfLifepoints - 12;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack7.Caption = TIArray[1] then
    begin
       ProfLifepoints:= ProfLifepoints - 20;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack7.Caption = TIArray[2] then
    begin
       ProfLifepoints:= ProfLifepoints - 12;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack7.Caption = TIArray[3] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack7.Caption = TIArray[4] then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end;

    if CheckAttack7.Caption = ProgrammierenArray[0] then
    begin
       ProfLifepoints:= ProfLifepoints - 12;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack7.Caption = ProgrammierenArray[1] then
    begin
       ProfLifepoints:= ProfLifepoints - 20;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack7.Caption = ProgrammierenArray[2] then
    begin
       ProfLifepoints:= ProfLifepoints - 12;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack7.Caption = ProgrammierenArray[3] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack7.Caption = ProgrammierenArray[4] then
    begin
       ProfLifepoints:= ProfLifepoints - 25;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end;

    if CheckAttack7.Caption = BWLArray[0] then
    begin
       ProfLifepoints:= ProfLifepoints - 5;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack7.Caption = BWLArray[1] then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack7.Caption = BWLArray[2] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack7.Caption = BWLArray[3] then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack7.Caption = BWLArray[4] then
    begin
       ProfLifepoints:= ProfLifepoints - 20;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end;
    Memo1.Lines.Add('Spicker setzt ' + CheckAttack7.Caption + ' ein');
  end;

  if CheckAttack8.Checked = True then
  begin
    if CheckAttack8.Caption = 'Differentialgleichung' then
    begin
       ProfLifepoints:= ProfLifepoints - 12;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack8.Caption = 'Binomische Formeln' then
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

    if CheckAttack8.Caption = GWAArray[0] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack8.Caption = GWAArray[1] then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack8.Caption = GWAArray[2] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack8.Caption = GWAArray[3] then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack8.Caption = GWAArray[4] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end;

    if CheckAttack8.Caption = WIArray[0] then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack8.Caption = WIArray[1] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack8.Caption = WIArray[2] then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack8.Caption = WIArray[3] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack8.Caption = WIArray[4] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end;

    if CheckAttack8.Caption = TIArray[0] then
    begin
       ProfLifepoints:= ProfLifepoints - 12;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack8.Caption = TIArray[1] then
    begin
       ProfLifepoints:= ProfLifepoints - 20;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack8.Caption = TIArray[2] then
    begin
       ProfLifepoints:= ProfLifepoints - 12;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack8.Caption = TIArray[3] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack8.Caption = TIArray[4] then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end;

    if CheckAttack8.Caption = ProgrammierenArray[0] then
    begin
       ProfLifepoints:= ProfLifepoints - 12;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack8.Caption = ProgrammierenArray[1] then
    begin
       ProfLifepoints:= ProfLifepoints - 20;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack8.Caption = ProgrammierenArray[2] then
    begin
       ProfLifepoints:= ProfLifepoints - 12;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack8.Caption = ProgrammierenArray[3] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack8.Caption = ProgrammierenArray[4] then
    begin
       ProfLifepoints:= ProfLifepoints - 25;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end;

    if CheckAttack8.Caption = BWLArray[0] then
    begin
       ProfLifepoints:= ProfLifepoints - 5;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack8.Caption = BWLArray[1] then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack8.Caption = BWLArray[2] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack8.Caption = BWLArray[3] then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack8.Caption = BWLArray[4] then
    begin
       ProfLifepoints:= ProfLifepoints - 20;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end;
    Memo1.Lines.Add('Spicker setzt ' + CheckAttack8.Caption + ' ein');
  end;

  Delay1.Enabled:= True;

  if SwitchSpicker2.Checked = True then
  begin
    SpickerTab1.Enabled:= True;
    SpickerTab3.Enabled:= True;
  end;

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
    else if CheckAttack9.Caption = 'Binomische Formeln' then
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

    if CheckAttack9.Caption = GWAArray[0] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack9.Caption = GWAArray[1] then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack9.Caption = GWAArray[2] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack9.Caption = GWAArray[3] then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack9.Caption = GWAArray[4] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end;

    if CheckAttack9.Caption = WIArray[0] then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack9.Caption = WIArray[1] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack9.Caption = WIArray[2] then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack9.Caption = WIArray[3] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack9.Caption = WIArray[4] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end;

    if CheckAttack9.Caption = TIArray[0] then
    begin
       ProfLifepoints:= ProfLifepoints - 12;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack9.Caption = TIArray[1] then
    begin
       ProfLifepoints:= ProfLifepoints - 20;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack9.Caption = TIArray[2] then
    begin
       ProfLifepoints:= ProfLifepoints - 12;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack9.Caption = TIArray[3] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack9.Caption = TIArray[4] then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end;

    if CheckAttack9.Caption = ProgrammierenArray[0] then
    begin
       ProfLifepoints:= ProfLifepoints - 12;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack9.Caption = ProgrammierenArray[1] then
    begin
       ProfLifepoints:= ProfLifepoints - 20;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack9.Caption = ProgrammierenArray[2] then
    begin
       ProfLifepoints:= ProfLifepoints - 12;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack9.Caption = ProgrammierenArray[3] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack9.Caption = ProgrammierenArray[4] then
    begin
       ProfLifepoints:= ProfLifepoints - 25;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end;

    if CheckAttack9.Caption = BWLArray[0] then
    begin
       ProfLifepoints:= ProfLifepoints - 5;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack9.Caption = BWLArray[1] then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack9.Caption = BWLArray[2] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack9.Caption = BWLArray[3] then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack9.Caption = BWLArray[4] then
    begin
       ProfLifepoints:= ProfLifepoints - 20;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end;
    Memo1.Lines.Add('Spicker setzt ' + CheckAttack9.Caption + ' ein');
  end;

  if CheckAttack10.Checked = True then
  begin
    if CheckAttack10.Caption = 'Differentialgleichung' then
    begin
       ProfLifepoints:= ProfLifepoints - 12;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack10.Caption = 'Binomische Formeln' then
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

    if CheckAttack10.Caption = GWAArray[0] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack10.Caption = GWAArray[1] then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack10.Caption = GWAArray[2] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack10.Caption = GWAArray[3] then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack10.Caption = GWAArray[4] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end;

    if CheckAttack8.Caption = WIArray[0] then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack10.Caption = WIArray[1] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack10.Caption = WIArray[2] then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack10.Caption = WIArray[3] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack10.Caption = WIArray[4] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end;

    if CheckAttack10.Caption = TIArray[0] then
    begin
       ProfLifepoints:= ProfLifepoints - 12;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack10.Caption = TIArray[1] then
    begin
       ProfLifepoints:= ProfLifepoints - 20;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack10.Caption = TIArray[2] then
    begin
       ProfLifepoints:= ProfLifepoints - 12;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack10.Caption = TIArray[3] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack10.Caption = TIArray[4] then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end;

    if CheckAttack10.Caption = ProgrammierenArray[0] then
    begin
       ProfLifepoints:= ProfLifepoints - 12;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack10.Caption = ProgrammierenArray[1] then
    begin
       ProfLifepoints:= ProfLifepoints - 20;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack10.Caption = ProgrammierenArray[2] then
    begin
       ProfLifepoints:= ProfLifepoints - 12;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack10.Caption = ProgrammierenArray[3] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack10.Caption = ProgrammierenArray[4] then
    begin
       ProfLifepoints:= ProfLifepoints - 25;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end;

    if CheckAttack10.Caption = BWLArray[0] then
    begin
       ProfLifepoints:= ProfLifepoints - 5;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack10.Caption = BWLArray[1] then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack10.Caption = BWLArray[2] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack10.Caption = BWLArray[3] then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack10.Caption = BWLArray[4] then
    begin
       ProfLifepoints:= ProfLifepoints - 20;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end;
    Memo1.Lines.Add('Spicker setzt ' + CheckAttack10.Caption + ' ein');
  end;
      if CheckAttack11.Checked = True then
  begin
    if CheckAttack11.Caption = 'Differentialgleichung' then
    begin
       ProfLifepoints:= ProfLifepoints - 12;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack11.Caption = 'Binomische Formeln' then
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

    if CheckAttack11.Caption = GWAArray[0] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack11.Caption = GWAArray[1] then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack11.Caption = GWAArray[2] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack11.Caption = GWAArray[3] then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack11.Caption = GWAArray[4] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end;

    if CheckAttack11.Caption = WIArray[0] then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack11.Caption = WIArray[1] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack11.Caption = WIArray[2] then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack11.Caption = WIArray[3] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack11.Caption = WIArray[4] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end;

    if CheckAttack11.Caption = TIArray[0] then
    begin
       ProfLifepoints:= ProfLifepoints - 12;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack11.Caption = TIArray[1] then
    begin
       ProfLifepoints:= ProfLifepoints - 20;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack11.Caption = TIArray[2] then
    begin
       ProfLifepoints:= ProfLifepoints - 12;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack11.Caption = TIArray[3] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack11.Caption = TIArray[4] then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end;

    if CheckAttack11.Caption = ProgrammierenArray[0] then
    begin
       ProfLifepoints:= ProfLifepoints - 12;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack11.Caption = ProgrammierenArray[1] then
    begin
       ProfLifepoints:= ProfLifepoints - 20;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack11.Caption = ProgrammierenArray[2] then
    begin
       ProfLifepoints:= ProfLifepoints - 12;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack11.Caption = ProgrammierenArray[3] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack11.Caption = ProgrammierenArray[4] then
    begin
       ProfLifepoints:= ProfLifepoints - 25;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end;

    if CheckAttack11.Caption = BWLArray[0] then
    begin
       ProfLifepoints:= ProfLifepoints - 5;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack11.Caption = BWLArray[1] then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack11.Caption = BWLArray[2] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack11.Caption = BWLArray[3] then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack11.Caption = BWLArray[4] then
    begin
       ProfLifepoints:= ProfLifepoints - 20;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end;
    Memo1.Lines.Add('Spicker setzt ' + CheckAttack11.Caption + ' ein');
  end;

  if CheckAttack12.Checked = True then
  begin
    if CheckAttack12.Caption = 'Differentialgleichung' then
    begin
       ProfLifepoints:= ProfLifepoints - 12;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack12.Caption = 'Binomische Formeln' then
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

    if CheckAttack12.Caption = GWAArray[0] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack12.Caption = GWAArray[1] then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack12.Caption = GWAArray[2] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack12.Caption = GWAArray[3] then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack12.Caption = GWAArray[4] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end;

    if CheckAttack12.Caption = WIArray[0] then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack12.Caption = WIArray[1] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack12.Caption = WIArray[2] then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack12.Caption = WIArray[3] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack12.Caption = WIArray[4] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end;

    if CheckAttack12.Caption = TIArray[0] then
    begin
       ProfLifepoints:= ProfLifepoints - 12;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack12.Caption = TIArray[1] then
    begin
       ProfLifepoints:= ProfLifepoints - 20;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack12.Caption = TIArray[2] then
    begin
       ProfLifepoints:= ProfLifepoints - 12;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack12.Caption = TIArray[3] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack12.Caption = TIArray[4] then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end;

    if CheckAttack12.Caption = ProgrammierenArray[0] then
    begin
       ProfLifepoints:= ProfLifepoints - 12;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack12.Caption = ProgrammierenArray[1] then
    begin
       ProfLifepoints:= ProfLifepoints - 20;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack12.Caption = ProgrammierenArray[2] then
    begin
       ProfLifepoints:= ProfLifepoints - 12;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack12.Caption = ProgrammierenArray[3] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack12.Caption = ProgrammierenArray[4] then
    begin
       ProfLifepoints:= ProfLifepoints - 25;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end;

    if CheckAttack12.Caption = BWLArray[0] then
    begin
       ProfLifepoints:= ProfLifepoints - 5;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack12.Caption = BWLArray[1] then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text:= IntToStr(ProfLifepoints);
    end
    else if CheckAttack12.Caption = BWLArray[2] then
    begin
       ProfLifepoints:= ProfLifepoints - 10;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack12.Caption = BWLArray[3] then
    begin
       ProfLifepoints:= ProfLifepoints - 15;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end
    else if CheckAttack12.Caption = BWLArray[4] then
    begin
       ProfLifepoints:= ProfLifepoints - 20;
       LabeledEdit2.Text := IntToStr(ProfLifepoints);
    end;
    Memo1.Lines.Add('Spicker setzt ' + CheckAttack12.Caption + ' ein');
  end;

  Delay2.Enabled:= True;

  if SwitchSpicker3.Checked = True then
  begin
    SpickerTab1.Enabled:= True;
    SpickerTab2.Enabled:= True;
  end;

end;


procedure TForm2.Button5Click(Sender: TObject);
begin
  Self.Close;
end;

procedure TForm2.CheckAttack1Change(Sender: TObject);
begin

end;

//Freigabe button
procedure TForm2.Delay1StartTimer(Sender: TObject);
begin
  Button2.Enabled:= False;
  if ProfLifepoints <= 0 then
  begin
   Memo1.Lines.Add('DER PROF IST BESIEGT!');
   Memo1.Lines.Add('DU HAST GEWONNEN!');
  end;
end;

procedure TForm2.Delay2StartTimer(Sender: TObject);
begin
  Button3.Enabled:= False;
  if ProfLifepoints <= 0 then
  begin
   Memo1.Lines.Add('DER PROF IST BESIEGT!');
   Memo1.Lines.Add('DU HAST GEWONNEN!');
  end;
end;

procedure TForm2.DelayStartTimer(Sender: TObject);
begin
  Button1.Enabled:= False;
  if ProfLifepoints <= 0 then
  begin
   Memo1.Lines.Add('DER PROF IST BESIEGT!');
   Memo1.Lines.Add('DU HAST GEWONNEN!');
  end;
end;

//Gegenangriff Prof + Log
procedure TForm2.Delay1Timer(Sender: TObject);
begin
   Randomize;
   RandomDamage:= Random(4);

  if RandomDamage = 0 then
  begin
   if ProfLifepoints > 0 then
    begin
     Spicker2Lifepoints:= Spicker2Lifepoints - 10;
     Memo1.Lines.Add('Der Professor geht eine Runde');
    end;
  end
  else if RandomDamage = 1 then
  begin
   if ProfLifepoints > 0 then
    begin
    Memo1.Lines.Add('Der Professor trinkt Kaffee');
    end;
  end
  else if RandomDamage = 2 then
  begin
  if ProfLifepoints > 0 then
    begin
     Spicker2Lifepoints:= Spicker2Lifepoints - 12;
     Memo1.Lines.Add('Der Professor steht hinter dir');
    end;
  end
  else if RandomDamage = 3 then
  begin
  if ProfLifepoints > 0 then
    begin
     Spicker2Lifepoints:= Spicker2Lifepoints - 15;
     Memo1.Lines.Add('Der Professor kontrolliert deine Federmappe');
    end;
  end
  else if RandomDamage = 4 then
  begin
  if ProfLifepoints > 0 then
    begin
     Spicker2Lifepoints:= Spicker2Lifepoints - 18;
     Memo1.Lines.Add('Der Professor findet einen Spicken');
    end;
  end;
   if SwitchSpicker2.Checked = False then
  begin
  LabeledEdit1.Text:= IntToStr(Spicker2Lifepoints);
  end;


  Delay1.Enabled:= False;

  Button2.Enabled:= True;
end;


procedure TForm2.DelayTimer(Sender: TObject);
begin
  Randomize;
  RandomDamage:= Random(4);

  if RandomDamage = 0 then
  begin
    if ProfLifepoints > 0 then
    begin
     Spicker1Lifepoints:= Spicker1Lifepoints - 10;
     Memo1.Lines.Add('Der Professor geht eine Runde');
    end;
  end
  else if RandomDamage = 1 then
  begin
    if ProfLifepoints > 0 then
    begin
    Memo1.Lines.Add('Der Professor trinkt Kaffee');
    end;
  end
  else if RandomDamage = 2 then
  begin
       if ProfLifepoints > 0 then
    begin
     Spicker1Lifepoints:= Spicker1Lifepoints - 12;
     Memo1.Lines.Add('Der Professor steht hinter dir');
    end;
  end
  else if RandomDamage = 3 then
  begin
    if ProfLifepoints > 0 then
    begin
     Spicker1Lifepoints:= Spicker1Lifepoints - 15;
     Memo1.Lines.Add('Der Professor kontrolliert deine Federmappe');
    end;
  end
  else if RandomDamage = 4 then
  begin
   if ProfLifepoints > 0 then
    begin
     Spicker1Lifepoints:= Spicker1Lifepoints - 18;
     Memo1.Lines.Add('Der Professor findet einen Spicken');
    end;
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
  Randomize;
  RandomDamage:= Random(4);

  if RandomDamage = 0 then
  begin
   if ProfLifepoints > 0 then
    begin
     Spicker3Lifepoints:= Spicker3Lifepoints - 10;
     Memo1.Lines.Add('Der Professor geht eine Runde');
    end;
  end
  else if RandomDamage = 1 then
  begin
    if ProfLifepoints > 0 then
    begin
    Memo1.Lines.Add('Der Professor trinkt Kaffee');
    end;
  end
  else if RandomDamage = 2 then
  begin
   if ProfLifepoints > 0 then
    begin
     Spicker3Lifepoints:= Spicker3Lifepoints - 12;
     Memo1.Lines.Add('Der Professor steht hinter dir');
    end;
  end
  else if RandomDamage = 3 then
  begin
   if ProfLifepoints > 0 then
    begin
     Spicker3Lifepoints:= Spicker3Lifepoints - 15;
     Memo1.Lines.Add('Der Professor kontrolliert deine Federmappe');
    end;
  end
  else if RandomDamage = 4 then
  begin
   if ProfLifepoints > 0 then
    begin
     Spicker3Lifepoints:= Spicker3Lifepoints - 18;
     Memo1.Lines.Add('Der Professor findet einen Spicken');
    end;
  end;
  if SwitchSpicker3.Checked = False then
  begin
  LabeledEdit1.Text:= IntToStr(Spicker3Lifepoints);
  end;


  Delay2.Enabled:= False;
  Button3.Enabled:= True;
end;


//Disable Spicker nach Spickerwechsel
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

