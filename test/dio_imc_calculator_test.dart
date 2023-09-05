// import 'package:test/test.dart';

import 'package:dio_imc_calculator/controllers/pessoa_controller.dart';
import 'package:dio_imc_calculator/models/pessoa_model.dart';
import 'package:test/test.dart';

void main() {
  group('Testes de IMC', () {
    PessoaController pessoaController = PessoaController();
    test('Caso de Teste Peso normal', () {
      PessoaModel pessoa = PessoaModel(nome: "João", altura: 1.75, peso: 70.0);
      expect(pessoaController.calcularIMC(pessoa), equals('22.86'));
      expect(pessoaController.classificarIMC(pessoa), equals("Peso normal"));
    });

    test('Caso de Teste de Obesidade Grau 3', () {
      PessoaModel pessoa =
          PessoaModel(nome: "Obeso", altura: 1.60, peso: 120.0);
      double imcAtual = double.parse(pessoaController.calcularIMC(pessoa));
      expect(imcAtual, closeTo(46.88, 0.02));
      expect(
          pessoaController.classificarIMC(pessoa), equals("Obesidade Grau 3"));
    });

    test('Caso de Teste de Peso Abaixo do Normal', () {
      PessoaModel pessoa = PessoaModel(nome: "Ana", altura: 1.70, peso: 50.0);
      expect(pessoaController.calcularIMC(pessoa), equals('17.30'));
      expect(pessoaController.classificarIMC(pessoa), equals("Abaixo do peso"));
    });
  });
}
