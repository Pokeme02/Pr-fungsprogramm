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
    PageControl1: TPageControl;
    RadioAttack1: TRadioGroup;
    CheckAttack1: TRadioButton;
    CheckAttack2: TRadioButton;
    CheckAttack3: TRadioButton;
    CheckAttack4: TRadioButton;
    RadioAttack2: TRadioGroup;
    RadioAttack3: TRadioGroup;
    RadioAttack4: TRadioGroup;
    SpickerTab1: TTabSheet;
    SpickerTab2: TTabSheet;
    SpickerTab3: TTabSheet;
    SpecialSpickerTab: TTabSheet;
    procedure FormCreate(Sender: TObject);
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
    public
      constructor Create();
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
  IDArray: array[1..6] of integer;
  MatheSpicker: Spicker;
  WISpicker: Spicker;
  GWASpicker: Spicker;

implementation

MatheSpicker.Create();
begin
  //Mathe   TODO: Attacks
  Mathespicker.Name:= 'Mathespicker';
  Mathespicker.ID:= 1;
  Mathespicker.Lifepoints:= 100;
  Mathespicker.Typ:= 'Mathe';
end;

{$R *.lfm}

{ TForm2 }




procedure TForm2.PageControl1Change(Sender: TObject);
begin

end;

procedure TForm2.FormCreate(Sender: TObject);
begin


end;

end.

