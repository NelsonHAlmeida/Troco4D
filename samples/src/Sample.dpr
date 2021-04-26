program Sample;

uses
  Vcl.Forms,
  Troco4D.View.Principal in 'Troco4D.View.Principal.pas' {frmPrincipal},
  Troco4D.Maquina in '..\..\src\Troco4D.Maquina.pas',
  Troco4D.Troco in '..\..\src\Troco4D.Troco.pas',
  Troco4D in '..\..\src\Troco4D.pas';

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
