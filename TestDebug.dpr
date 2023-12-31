program TestDebug;

uses
  Vcl.Forms,
  uFormCadastroPessoa in 'View\uFormCadastroPessoa.pas' {Pessoas},
  uDmConexao in 'DAO\uDmConexao.pas' {DmConexao: TDataModule},
  uDmPessoa in 'DAO\uDmPessoa.pas' {DmPessoa: TDataModule},
  uPessoaController in 'Controller\uPessoaController.pas',
  uPessoaModel in 'Model\uPessoaModel.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TPessoas, Pessoas);
  Application.CreateForm(TDmPessoa, DmPessoa);
  Application.CreateForm(TDmConexao, DmConexao);
  Application.Run;
end.
