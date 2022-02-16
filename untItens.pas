unit untItens;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, untBancoDados, Data.DB, Vcl.StdCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls;

type
  TfrmItens = class(TForm)
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    Button3: TButton;
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    m_iCodigoNota: Integer;
  end;

var
  frmItens: TfrmItens;

implementation

{$R *.dfm}

procedure TfrmItens.Button1Click(Sender: TObject);
begin
  dmBancoDados.fdNotaItem.Append;
  dmBancoDados.fdNotaItemCODIGO_NOTA.AsInteger := m_iCodigoNota;
  dmBancoDados.fdNotaItem.Post;
  Button2.Click;
end;

procedure TfrmItens.Button2Click(Sender: TObject);
begin
  dmBancoDados.fdNotaItem.Connection.Commit;
  dmBancoDados.fdNotaItem.CheckBrowseMode;
end;

procedure TfrmItens.Button3Click(Sender: TObject);
begin
  dmBancoDados.fdNotaItem.Delete;
  Button2.Click;
end;

procedure TfrmItens.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  //Atualiza o valor total da Nota
  dmBancoDados.fdQuery1.Close;
  dmBancoDados.fdQuery1.SQL.Text := 'UPDATE NOTAS '+
                                    'SET VALOR = (SELECT COALESCE(SUM(VALOR_TOTAL),0) ITENS_NOTA '+
                                    '             FROM ITENS_NOTA WHERE CODIGO_NOTA = :CODIGO_NOTA) '+
                                    'WHERE CODIGO_NOTA = :CODIGO_NOTA ';
  dmBancoDados.fdQuery1.ParamByName('CODIGO_NOTA').AsInteger := m_iCodigoNota;
  dmBancoDados.fdQuery1.ExecSQL;
  dmBancoDados.fdQuery1.Connection.Commit;
end;

procedure TfrmItens.FormShow(Sender: TObject);
begin
  dmBancoDados.fdNotaItem.Close;
  dmBancoDados.fdNotaItem.ParamByName('CODIGO_NOTA').AsInteger := m_iCodigoNota;
  dmBancoDados.fdNotaItem.Open;
end;

end.
