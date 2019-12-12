unit Pruefungsraum;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, ComCtrls,
  StdCtrls;

type

  { TForm2 }

  TForm2 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
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
    Image1: TImage;
    LabeledEdit1: TLabeledEdit;
    LabeledEdit2: TLabeledEdit;
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
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure LabeledEdit1Change(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
  private

  public

  end;

  type Spicker = class
    private
      Name: String;
      ID: Integer;
      OwnAttacks: array[1..4] of Integer;
      OtherAttacks: array[1..4] of array[1..5] of Integer;
      Lifepoints: Integer;
      Typ: String;

  end;
    type Profs = class
    private
      Name: String;
      ID: Integer;
      OwnAttacks: array[1..4] of Integer;
      Lifepoints: Integer;
      Typ: String;

  end;
      type ProfAttacken= class
    private
      Name: String;
      ID: Integer;

      Damage: Integer;
      Typ: String;

  end;

  //type Attack = class
  //  private
  //    Name: String;
  //    AttackPoints: Integer;
  //    ID: Integer;
  //    Typ: String;
  //end;



var
  Form2: TForm2;
  IDArray: array[1..3] of integer;
  MatheSpicker: Spicker;
  WISpicker: Spicker;
  GWASpicker: Spicker;

implementation



{$R *.lfm}

{ TForm2 }




procedure TForm2.PageControl1Change(Sender: TObject);
begin
  if PageControl1.TabIndex = SpickerTab1.PageIndex then
  begin
      LabeledEdit1.EditLabel.Caption:= SpickerTab1.Caption;
  end
  else if PageControl1.TabIndex = SpickerTab2.PageIndex then
  begin
      LabeledEdit1.EditLabel.Caption:= SpickerTab2.Caption;
  end
  else if PageControl1.TabIndex = SpickerTab3.PageIndex then
  begin
      LabeledEdit1.EditLabel.Caption:= SpickerTab3.Caption;
  end
  else if PageControl1.TabIndex = SpecialSpickerTab.PageIndex then
  begin
      LabeledEdit1.EditLabel.Caption:= SpecialSpickerTab.Caption;
  end
end;


procedure TForm2.FormCreate(Sender: TObject);
begin

  if IDArray[1] = 1 then
    begin
        SpickerTab1.Caption := 'Mathe';
    end
  else if IDArray[1] = 2 then
    begin
        SpickerTab1.Caption := 'WI';
    end
  else if IDArray[1] = 3 then
    begin
        SpickerTab1.Caption := 'GWA';
    end
  else if IDArray[1] = 4 then
    begin
        SpickerTab1.Caption := 'BWL';
    end
  else if IDArray[1] = 5 then
    begin
        SpickerTab1.Caption := 'Programmieren';
    end
  else if IDArray[1] = 6 then
    begin
        SpickerTab1.Caption := 'TI';
    end;

  if IDArray[2] = 1 then
    begin
        SpickerTab2.Caption := 'Mathe';
    end
  else if IDArray[2] = 2 then
    begin
        SpickerTab2.Caption := 'WI';
    end
  else if IDArray[2] = 3 then
    begin
        SpickerTab2.Caption := 'GWA';
    end
  else if IDArray[2] = 4 then
    begin
        SpickerTab2.Caption := 'BWL';
    end
  else if IDArray[2] = 5 then
    begin
        SpickerTab2.Caption := 'Programmieren';
    end
  else if IDArray[2] = 6 then
    begin
        SpickerTab2.Caption := 'TI';
    end;

  if IDArray[3] = 1 then
    begin
        SpickerTab3.Caption := 'Mathe';
    end
  else if IDArray[3] = 2 then
    begin
        SpickerTab3.Caption := 'WI';
    end
  else if IDArray[3] = 3 then
    begin
        SpickerTab3.Caption := 'GWA';
    end
  else if IDArray[3] = 4 then
    begin
        SpickerTab3.Caption := 'BWL';
    end
  else if IDArray[3] = 5 then
    begin
        SpickerTab3.Caption := 'Programmieren';
    end
  else if IDArray[3] = 6 then
    begin
        SpickerTab3.Caption := 'TI';
    end;



  
  LabeledEdit2.EditLabel.Caption:= 'Schomaker';

  LabeledEdit1.EditLabel.Caption:= SpickerTab1.Caption;

end;

procedure TForm2.LabeledEdit1Change(Sender: TObject);
begin

end;

procedure TForm2.Button1Click(Sender: TObject);
begin
  if SwitchSpicker1.Checked = True then
  begin
    SpickerTab2.Enabled:= True;
    SpickerTab3.Enabled:= True;
  end;
end;

end.

