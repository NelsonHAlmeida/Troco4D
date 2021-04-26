unit Troco4D.Troco;

interface

type

  TCedula = (ceNota100, ceNota50, ceNota20, ceNota10, ceNota5, ceNota2,
             ceMoeda100, ceMoeda50, ceMoeda25, ceMoeda10, ceMoeda5, ceMoeda1);

  TCedulaHelper = record helper for TCedula
    function GetCedula : String;
    function GetValorCedula : String;
  end;

  TTroco = class
  private
    FTipo: TCedula;
    FQuantidade: Integer;
  public
    constructor Create(Tipo: TCedula; Quantidade: Integer); reintroduce;
    function GetTipo: TCedula;
    function GetQuantidade: Integer;
    procedure SetQuantidade(Quantidade: Integer);
  end;

const
  CValorCedula: array [TCedula] of Double = (100, 50, 20, 10, 5, 2, 1, 0.5, 0.25, 0.1, 0.05, 0.01);

implementation

uses
  System.SysUtils, typinfo;

constructor TTroco.Create(Tipo: TCedula; Quantidade: Integer);
begin
  inherited Create;
  FTipo := Tipo;
  FQuantidade := Quantidade;
end;

function TTroco.GetTipo: TCedula;
begin
  Result := FTipo;
end;

function TTroco.GetQuantidade: Integer;
begin
  Result := FQuantidade;
end;

procedure TTroco.SetQuantidade(Quantidade: Integer);
begin
  FQuantidade := Quantidade;
end;

{ TCedulaHelper }

function TCedulaHelper.GetCedula: String;
begin
  case Self of
    ceNota100,
    ceNota50,
    ceNota20,
    ceNota10,
    ceNota5,
    ceNota2: Result:= 'nota';

    ceMoeda100,
    ceMoeda50,
    ceMoeda25,
    ceMoeda10,
    ceMoeda5,
    ceMoeda1: Result:= 'moeda';
  end;
//  Result := GetEnumName(TypeInfo(TCedula), Ord(Self));
end;

//function TCedulaHelper.GetCedula: Integer;
//begin
//  Result:= Ord(Self);
//end;


function TCedulaHelper.GetValorCedula: String;
begin
  Result := FormatCurr('R$ #,##0.00', CValorCedula[Self]);
end;

end.

