unit untPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, untBancoDados, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfrmPrincipal = class(TForm)
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    Button5: TButton;
    Button3: TButton;
    Button4: TButton;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses untItens;

procedure TfrmPrincipal.Button1Click(Sender: TObject);
begin
  dmBancoDados.fdNotas.Append;
  dmBancoDados.fdNotas.Post;
  Button2.Click;
end;

procedure TfrmPrincipal.Button2Click(Sender: TObject);
begin
  dmBancoDados.fdNotas.Connection.Commit;
  dmBancoDados.fdNotas.CheckBrowseMode;
end;

procedure TfrmPrincipal.Button3Click(Sender: TObject);
begin
  dmBancoDados.fdQuery1.Close;
  dmBancoDados.fdQuery1.SQL.Text := 'DELETE FROM ITENS_NOTA '+
                                    'WHERE CODIGO_NOTA = :CODIGO_NOTA ';
  dmBancoDados.fdQuery1.ParamByName('CODIGO_NOTA').AsInteger := dmBancoDados.fdNotasCODIGO_NOTA.AsInteger;;
  dmBancoDados.fdQuery1.ExecSQL;
  dmBancoDados.fdQuery1.Connection.Commit;

  dmBancoDados.fdNotas.Delete;
  Button2.Click;
end;

procedure TfrmPrincipal.Button4Click(Sender: TObject);

begin
  frmItens.m_iCodigoNota := dmBancoDados.fdNotasCODIGO_NOTA.AsInteger;
  frmItens.ShowModal;

  //Recarrega as Notas
  dmBancoDados.fdNotas.Close;
  dmBancoDados.fdNotas.Open;
end;

procedure TfrmPrincipal.Button5Click(Sender: TObject);
begin
  dmBancoDados.fdNotas.Cancel;
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  //Abrindo o banco de dados
  dmBancoDados.fdConector.Connected := True;
  dmBancoDados.fdNotas.Open;
end;

end.
