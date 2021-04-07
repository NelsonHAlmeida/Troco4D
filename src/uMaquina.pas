unit uMaquina;

interface

uses
  Classes,
  uIMaquina,
  uTroco;

type
  {$SCOPEDENUMS ON}
    TTipoCedula = (Nota, Moeda);
  {$SCOPEDENUMS OFF}


  TMaquina = class(TInterfacedObject, IMaquina)
  private
    FList : TList;
    FContador : Integer;
    procedure LimparObjetosList;
    procedure CalculaTroco(var aValue : Integer;
                           const aTipo : TTipoCedula);
  public
    constructor Create;
    destructor Destroy; override;
    class function New: IMaquina;

    function MontarTroco(Troco: Double): TList;
  end;

implementation

uses
  System.SysUtils;

constructor TMaquina.Create;
begin
  FList:= TList.Create;
end;

destructor TMaquina.Destroy;
begin
  LimparObjetosList;
  FList.Free;
  inherited;
end;

procedure TMaquina.LimparObjetosList;
var
  i: Integer;
begin
  for i := 0 to Pred(FList.Count) do
    TObject(FList[i]).Free;
end;

procedure TMaquina.CalculaTroco(var aValue : integer;
                                const aTipo : TTipoCedula);
var
  LCedula : TCedula;
  LTroco : TTroco;
  LQuantidade, LValorCedula : Integer;
begin
  LValorCedula:= 0;
  while (aValue <> 0) do
  begin
    LCedula := TCedula(Pred(FContador));

    case aTipo of
      TTipoCedula.Nota:
        begin
          LValorCedula := Trunc(CValorCedula[LCedula]);
        end;
      TTipoCedula.Moeda:
        begin
          LValorCedula := Trunc(CValorCedula[LCedula]*100);
        end;
    end;

    LQuantidade := aValue div LValorCedula;
    if (LQuantidade <> 0) then
    begin
      LTroco := TTroco.Create(LCedula, LQuantidade);
      FList.Add(LTroco);
      aValue := aValue mod LValorCedula;
    end;
    Inc(FContador);
  end;
end;

function TMaquina.MontarTroco(Troco: Double): TList;
var
  LValor : Integer;
begin
  if Troco <= 0 then
    raise Exception.Create('Troco invalido');

  FContador := 1;

  LimparObjetosList;
  FList.Clear;

  LValor := Trunc(Troco);
  CalculaTroco(LValor, TTipoCedula.Nota);

  LValor := Round(Frac(Troco) * 100);
  CalculaTroco(LValor, TTipoCedula.Moeda);

  Result:= FList;
end;

class function TMaquina.New: IMaquina;
begin
  Result:= Self.Create;
end;

end.

