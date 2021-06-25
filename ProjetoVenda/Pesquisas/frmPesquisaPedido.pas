unit frmPesquisaPedido;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids, uPedido;

type
  TformPesquisaPedido = class(TForm)
    dbgPedidos: TDBGrid;
    qPedidos: TFDQuery;
    dsPedidos: TDataSource;
    qPedidosCD_PEDIDO: TIntegerField;
    qPedidosDATA_EMISSAO: TDateField;
    qPedidosNOME: TStringField;
    qPedidosVALOR_TOTAL: TFloatField;
    qPedidosCD_CLIENTE: TIntegerField;
    procedure FormShow(Sender: TObject);
    procedure dbgPedidosDblClick(Sender: TObject);
    procedure dbgPedidosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    vIdPedido : Integer;
  end;

var
  formPesquisaPedido: TformPesquisaPedido;

implementation

{$R *.dfm}

procedure TformPesquisaPedido.dbgPedidosDblClick(Sender: TObject);
begin
  if (dbgPedidos.DataSource.DataSet.RecordCount > 0) then
  begin
    vIdPedido := dbgPedidos.DataSource.DataSet.FieldByName('CD_PEDIDO').AsInteger;

    Close;
  end;


end;

procedure TformPesquisaPedido.dbgPedidosKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_RETURN) then
  begin
    Key := 0;
    dbgPedidosDblClick(nil);
  end;
end;

procedure TformPesquisaPedido.FormShow(Sender: TObject);
var
  Pedido: TPedido;
begin
  Pedido := TPedido.Create();

  dsPedidos.DataSet := Pedido.RetornaDadosPedido();

end;

end.
