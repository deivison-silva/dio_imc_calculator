import 'package:dio_imc_calculator/controllers/pessoa_controller.dart';

void main() {
  var pessoaController = PessoaController();

  var pessoa = pessoaController.obterDadosUsuario();
  pessoaController.mostrarResultado(pessoa);
}
