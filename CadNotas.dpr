program CadNotas;

uses
  Vcl.Forms,
  untPrincipal in 'untPrincipal.pas' {frmPrincipal},
  untBancoDados in 'untBancoDados.pas' {dmBancoDados: TDataModule},
  untItens in 'untItens.pas' {frmItens};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TdmBancoDados, dmBancoDados);
  Application.CreateForm(TfrmItens, frmItens);
  Application.Run;
end.
