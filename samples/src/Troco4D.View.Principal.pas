unit Troco4D.View.Principal;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Troco4D;

type
  TfrmPrincipal = class(TForm)
    edtValor: TEdit;
    btnTroco: TButton;
    procedure btnTrocoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.btnTrocoClick(Sender: TObject);
var
  LTroco4D : ITroco4D;
begin
  LTroco4D := TTroco4D.New;
  ShowMessage(LTroco4D.MontarTroco(StrToFloat(edtValor.Text)));
end;

end.
