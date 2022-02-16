unit untBancoDados;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.Phys.FB, FireDAC.Phys.FBDef;

type
  TdmBancoDados = class(TDataModule)
    fdConector: TFDConnection;
    dsNotas: TDataSource;
    dsNotaItem: TDataSource;
    fdQuery1: TFDQuery;
    fdNotas: TFDQuery;
    fdNotasCODIGO_NOTA: TIntegerField;
    fdNotasCLIENTE: TStringField;
    fdNotasDATA: TDateField;
    fdNotasVALOR: TFloatField;
    fdNotaItem: TFDQuery;
    fdNotaItemCODIGO_ITEM: TIntegerField;
    fdNotaItemCODIGO_NOTA: TIntegerField;
    fdNotaItemQUANTIDADE: TIntegerField;
    fdNotaItemVALOR_UNITARIO: TFloatField;
    fdNotaItemVALOR_TOTAL: TFloatField;
    procedure fdNotasNewRecord(DataSet: TDataSet);
    procedure fdNotaItemNewRecord(DataSet: TDataSet);
    procedure fdNotaItemQUANTIDADEValidate(Sender: TField);
    procedure fdNotaItemVALOR_UNITARIOValidate(Sender: TField);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmBancoDados: TdmBancoDados;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdmBancoDados.fdNotaItemNewRecord(DataSet: TDataSet);
var
 iValor: Integer;
begin
  //Gerando código do item com incremento
  fdQuery1.Close;
  fdQuery1.SQL.Text := 'SELECT COALESCE(MAX(CODIGO_ITEM), 0)+1 VALOR FROM ITENS_NOTA';
  fdQuery1.Open;
  iValor := fdQuery1.FieldByName('VALOR').AsInteger;
  fdQuery1.Close;

  //Definindo valores padrões na criação de um novo item
  fdNotaItemCODIGO_ITEM.AsInteger := iValor;
  fdNotaItemQUANTIDADE.AsInteger := 0;
  fdNotaItemVALOR_UNITARIO.AsFloat := 0;
  fdNotaItemVALOR_TOTAL.AsFloat := 0;
end;

procedure TdmBancoDados.fdNotaItemQUANTIDADEValidate(Sender: TField);
begin
  fdNotaItemVALOR_TOTAL.AsFloat := fdNotaItemQUANTIDADE.AsInteger * fdNotaItemVALOR_UNITARIO.AsFloat;
end;

procedure TdmBancoDados.fdNotaItemVALOR_UNITARIOValidate(Sender: TField);
begin
  fdNotaItemVALOR_TOTAL.AsFloat := fdNotaItemQUANTIDADE.AsInteger * fdNotaItemVALOR_UNITARIO.AsFloat;
end;

procedure TdmBancoDados.fdNotasNewRecord(DataSet: TDataSet);
var
  iValor: Integer;
begin
  //Gerando código da nota com incremento
  fdQuery1.Close;
  fdQuery1.SQL.Text := 'SELECT COALESCE(MAX(CODIGO_NOTA), 0)+1 VALOR FROM NOTAS';
  fdQuery1.Open;
  iValor := fdQuery1.FieldByName('VALOR').AsInteger;
  fdQuery1.Close;

  //Definindo valores padrões na criação de uma nova nota
  fdNotasCODIGO_NOTA.AsInteger := iValor;
  fdNotasCLIENTE.AsString := '(Novo Cliente)';
  fdNotasDATA.AsDateTime := Date;
  fdNotasVALOR.AsFloat := 0;
end;

end.
