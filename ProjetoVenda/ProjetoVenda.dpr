program ProjetoVenda;

uses
  Vcl.Forms,
  formVenda in 'formVenda.pas' {frmVenda},
  uDm in 'Conexao\uDm.pas' {dm: TDataModule},
  frmPesquisaCliente in 'Pesquisas\frmPesquisaCliente.pas' {formPesquisaCliente},
  uPedido in 'Units\uPedido.pas',
  frmPesquisaProduto in 'Pesquisas\frmPesquisaProduto.pas' {formPesquisaProduto},
  frmPesquisaPedido in 'Pesquisas\frmPesquisaPedido.pas' {formPesquisaPedido};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmVenda, frmVenda);
  Application.CreateForm(Tdm, dm);
  Application.CreateForm(TformPesquisaCliente, formPesquisaCliente);
  Application.CreateForm(TformPesquisaProduto, formPesquisaProduto);
  Application.CreateForm(TformPesquisaPedido, formPesquisaPedido);
  Application.Run;
end.
