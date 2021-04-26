unit Troco4D;

interface

uses
  Troco4D.Maquina;

type
  ITroco4D = Troco4D.Maquina.IMaquina;

  TTroco4D = class
  public
    class function New: ITroco4D;
  end;

implementation

class function TTroco4D.New: ITroco4D;
begin
  Result := TMaquina.New;
end;

end.
