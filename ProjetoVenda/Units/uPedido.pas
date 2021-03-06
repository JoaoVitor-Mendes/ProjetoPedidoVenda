unit uPedido;

interface

uses
  FireDAC.Comp.Client, System.SysUtils,System.Classes, uDm,
  Datasnap.DBClient;

type
  TPedido = class

  private
    query: TFDQuery;
  
    function pConectaBanco() : boolean;


  public
    constructor Create();
    destructor Destroy(); Override;

    function RetornaTodosClientes() : TFDQuery;
    function RetornaTodosProdutos() : TFDQuery; 

    function RetornaClientePorId(idCliente : String)  : TFDQuery; 
    function RetornaProdutoPorId(idProduto : String)  : TFDQuery; 

    function RetornaProdutosPedido(idPedido : Integer)  : TFDQuery; 

    function  IncluiNovoPedido(idCliente : Integer) : Integer;
    procedure IncluiItemPedido(idPedido, idProduto, quantidade : Integer; vlUnitario, vlTotal : Double);

    function RetornaValorPedido(idPedido : Integer) : TFDQuery;
    function RetornaDadosPedido() : TFDQuery;
    function RetornaDadosPedidoPorId(idPedido : Integer) : TFDQuery;

    procedure AtualizaVlTotalPedido(vlTotal: Double; IdPedido: Integer);
    procedure DeletarPedidoItens(idPedido : Integer);
  


  end;


implementation

{ TPedido }

procedure TPedido.AtualizaVlTotalPedido(vlTotal: Double; IdPedido: Integer);
begin
  try
    query := TFDQuery.Create(nil);
    query.Connection := dm.Conexao;

    query.Close;
    query.SQL.Clear;
    query.SQL.Add('UPDATE PEDIDOS_GERAIS SET VALOR_TOTAL = :VALOR_TOTAL WHERE CD_PEDIDO = :CD_PEDIDO');
    query.Params.ParamByName('VALOR_TOTAL').AsFloat := vlTotal;
    query.Params.ParamByName('CD_PEDIDO').AsInteger := IdPedido;
    query.ExecSQL;
    
  except on E: Exception do
    begin
      raise Exception.Create(E.ToString);
      Abort;
    end;
  end;

end;

constructor TPedido.Create;
begin
  pConectaBanco();
end;

procedure TPedido.DeletarPedidoItens(idPedido: Integer);
begin
  try
    query := TFDQuery.Create(nil);
    query.Connection := dm.Conexao;

    query.Close;
    query.SQL.Clear;
    query.SQL.Add('DELETE FROM PEDIDOS_PRODUTOS WHERE ID_PEDIDO = :ID_PEDIDO');
    query.Params.ParamByName('ID_PEDIDO').AsInteger := idPedido;
    query.ExecSQL;

    query.Close;
    query.SQL.Clear;
    query.SQL.Add('DELETE FROM PEDIDOS_GERAIS WHERE CD_PEDIDO = :CD_PEDIDO');
    query.Params.ParamByName('CD_PEDIDO').AsInteger := idPedido;
    query.ExecSQL;

  except on E: Exception do
    begin
      raise Exception.Create(E.ToString);
      Abort;
    end;
  end;

end;

destructor TPedido.Destroy;
begin

  inherited;
end;

procedure TPedido.IncluiItemPedido(idPedido, idProduto, quantidade : Integer; vlUnitario, vlTotal : Double);
var
  cdPedidoProduto: Integer;
begin
   try
    query := TFDQuery.Create(nil);
    query.Connection := dm.Conexao;

    query.Close;
    query.SQL.Clear;
    query.SQL.Add('SELECT MAX(CD_PEDIDO_PRODUTO) CD_PEDIDO_PRODUTO FROM PEDIDOS_PRODUTOS');
    query.Open;
    
    cdPedidoProduto := query.FieldByName('CD_PEDIDO_PRODUTO').AsInteger + 1;

    query.Close;
    query.SQL.Clear;
    query.SQL.Add('INSERT INTO PEDIDOS_PRODUTOS(CD_PEDIDO_PRODUTO, ID_PEDIDO, ID_PRODUTO,');
    query.SQL.Add('QUANTIDADE, VALOR_UNITARIO, VALOR_TOTAL)');   
    query.SQL.Add('VALUES(:CD_PEDIDO_PRODUTO, :ID_PEDIDO, :ID_PRODUTO,');
    query.SQL.Add(':QUANTIDADE, :VALOR_UNITARIO, :VALOR_TOTAL)');   
    query.Params.ParamByName('CD_PEDIDO_PRODUTO').AsInteger  := cdPedidoProduto;
    query.Params.ParamByName('ID_PEDIDO').AsInteger          := idPedido; 
    query.Params.ParamByName('ID_PRODUTO').AsInteger         := idProduto; 
    query.Params.ParamByName('QUANTIDADE').AsInteger         := quantidade;             
    query.Params.ParamByName('VALOR_UNITARIO').AsFloat       := vlUnitario;
    query.Params.ParamByName('VALOR_TOTAL').AsFloat          := vlTotal;    
    query.ExecSQL;
    
  except on E: Exception do
    begin
      raise Exception.Create(E.ToString);
      Abort;
    end;
  end;
end;

function TPedido.IncluiNovoPedido(idCliente : Integer) : Integer;
var
  cdPedido: Integer;
begin
  try
    query := TFDQuery.Create(nil);
    query.Connection := dm.Conexao;

    query.Close;
    query.SQL.Clear;
    query.SQL.Add('SELECT MAX(CD_PEDIDO) CD_PEDIDO FROM PEDIDOS_GERAIS');
    query.Open;
    
    cdPedido := query.FieldByName('CD_PEDIDO').AsInteger + 1;

    query.Close;
    query.SQL.Clear;
    query.SQL.Add('INSERT INTO PEDIDOS_GERAIS(CD_PEDIDO, DATA_EMISSAO, ID_CLIENTE, VALOR_TOTAL)');
    query.SQL.Add('VALUES(:CD_PEDIDO, :DATA_EMISSAO, :ID_CLIENTE, :VALOR_TOTAL)');
    query.Params.ParamByName('CD_PEDIDO').AsInteger   := cdPedido;
    query.Params.ParamByName('DATA_EMISSAO').AsDate   := Now; 
    query.Params.ParamByName('ID_CLIENTE').AsInteger  := idCliente; 
    query.Params.ParamByName('VALOR_TOTAL').AsFloat   := 0;             
    query.ExecSQL;
    
  except on E: Exception do
    begin
      raise Exception.Create(E.ToString);
      Abort;
    end;
  end;

  Result := cdPedido;
end;

function TPedido.pConectaBanco: boolean;
begin

  try
    dm.Conexao.Connected               := False;
    dm.Conexao.Params.UserName         := 'root';
    dm.Conexao.Params.Password         := '';
    dm.Conexao.Params.Database         := 'bdpedido';
    dm.Conexao.Params.Values['Server'] := '127.0.0.1';
    dm.Conexao.Params.Values['Port']   := '3306';
    dm.Conexao.Connected               := True;

    Result := True;

  except on E: Exception do
    Result := False;
  end;
end;

function TPedido.RetornaClientePorId(idCliente : string): TFDQuery;
begin
  try
    query := TFDQuery.Create(nil);
    query.Connection := dm.Conexao;

    query.Close;
    query.SQL.Clear;
    query.SQL.Add('SELECT * FROM CLIENTES WHERE CD_CLIENTE = '+idCliente);
    query.Open;

  except on E: Exception do
    begin
      raise Exception.Create(E.ToString);
      Abort;
    end;
  end;

  Result := query;
end;

function TPedido.RetornaDadosPedido: TFDQuery;
begin
 
  query := TFDQuery.Create(nil);
  query.Connection := dm.Conexao;

  try
    query.Close;
    query.SQL.Clear;
    query.SQL.Add('SELECT CLIENTES.*, PEDIDOS_GERAIS.* FROM PEDIDOS_GERAIS');
    query.SQL.Add('LEFT JOIN CLIENTES ON CLIENTES.CD_CLIENTE = PEDIDOS_GERAIS.ID_CLIENTE');
    query.Open;
    
  except on E: Exception do
    begin
      raise Exception.Create(E.ToString);
      Abort;
    end;
  end;

  Result := query;

end;

function TPedido.RetornaDadosPedidoPorId(idPedido : Integer): TFDQuery;
begin
  query := TFDQuery.Create(nil);
  query.Connection := dm.Conexao;

  try
    query.Close;
    query.SQL.Clear;
    query.SQL.Add('SELECT CLIENTES.*, PEDIDOS_GERAIS.* FROM PEDIDOS_GERAIS');
    query.SQL.Add('LEFT JOIN CLIENTES ON CLIENTES.CD_CLIENTE = PEDIDOS_GERAIS.ID_CLIENTE');
    query.SQL.Add('WHERE CD_PEDIDO = :CD_PEDIDO');
    query.Params.ParamByName('CD_PEDIDO').AsInteger := idPedido; 
    query.Open;
    
  except on E: Exception do
    begin
      raise Exception.Create(E.ToString);
      Abort;
    end;
  end;

  Result := query;

end;

function TPedido.RetornaProdutoPorId(idProduto : string): TFDQuery;
begin
  query := TFDQuery.Create(nil);
  query.Connection := dm.Conexao;

  try
    query.Close;
    query.SQL.Clear;
    query.SQL.Add('SELECT * FROM PRODUTOS WHERE CD_PRODUTO = '+idProduto);
    query.Open;
    
  except on E: Exception do
    begin
      raise Exception.Create(E.ToString);
      Abort;
    end;
  end;

  Result := query;
end;

function TPedido.RetornaProdutosPedido(idPedido: Integer): TFDQuery;
begin
  try
    query := TFDQuery.Create(nil);
    query.Connection := dm.Conexao;
    
    query.Close;
    query.SQL.Clear;
    query.SQL.Add('SELECT PEDIDOS_GERAIS.CD_PEDIDO, PEDIDOS_GERAIS.DATA_EMISSAO, PEDIDOS_GERAIS.ID_CLIENTE,');
    query.SQL.Add('PRODUTOS.DESCRICAO, PEDIDOS_PRODUTOS.* FROM PEDIDOS_PRODUTOS');
    query.SQL.Add('LEFT JOIN PEDIDOS_GERAIS ON PEDIDOS_GERAIS.CD_PEDIDO = PEDIDOS_PRODUTOS.ID_PEDIDO');
    query.SQL.Add('LEFT JOIN PRODUTOS ON PRODUTOS.CD_PRODUTO = PEDIDOS_PRODUTOS.ID_PRODUTO');
    query.SQL.Add('WHERE CD_PEDIDO = :CD_PEDIDO');
    query.Params.ParamByName('CD_PEDIDO').AsInteger := idPedido;
    query.Open;
    
  except on E: Exception do
    begin
      raise Exception.Create(E.ToString);
      Abort;
    end;
  end;

  Result := query;
end;

function TPedido.RetornaTodosClientes: TFDQuery;
var
  cdsTemp: TClientDataSet;
begin

  try
    query := TFDQuery.Create(nil);
    query.Connection := dm.Conexao;
  
    query.Close;
    query.SQL.Clear;
    query.SQL.Add('SELECT * FROM CLIENTES');
    query.Open;
    
  except on E: Exception do
    begin
      raise Exception.Create(E.ToString);
      Abort;
    end;
  end;

  Result := query;
end;

function TPedido.RetornaTodosProdutos: TFDQuery;
begin

  try
    query := TFDQuery.Create(nil);
    query.Connection := dm.Conexao;
    
    query.Close;
    query.SQL.Clear;
    query.SQL.Add('SELECT * FROM PRODUTOS');
    query.Open;
    
  except on E: Exception do
    begin
      raise Exception.Create(E.ToString);
      Abort;
    end;
  end;

  Result := query;
end;

function TPedido.RetornaValorPedido(idPedido: Integer): TFDQuery;
begin
   try
    query := TFDQuery.Create(nil);
    query.Connection := dm.Conexao;
    
    query.Close;
    query.SQL.Clear;
    query.SQL.Add('SELECT SUM(VALOR_TOTAL) VALOR_TOTAL, COUNT(CD_PEDIDO_PRODUTO) CD_PEDIDO_PRODUTO FROM PEDIDOS_PRODUTOS');
    query.SQL.Add('WHERE ID_PEDIDO = :ID_PEDIDO');    
    query.Params.ParamByName('ID_PEDIDO').AsInteger := idPedido;
    query.Open;  
    
  except on E: Exception do
    begin
      raise Exception.Create(E.ToString);
      Abort;
    end;
  end;

  Result := query;
end;

end.

