import 'dart:io';
import 'package:dio_imc_calculator/models/pessoa_model.dart';

class PessoaController {
  String calcularIMC(PessoaModel pessoa) {
    if (pessoa.peso <= 0 || pessoa.altura <= 0) {
      throw ArgumentError("Peso e altura devem ser maiores que zero.");
    }
    return (pessoa.peso / (pessoa.altura * pessoa.altura)).toStringAsFixed(2);
  }

  String classificarIMC(PessoaModel pessoa) {
    String imc = calcularIMC(pessoa);
    if (double.parse(imc) < 18.5) {
      return "Abaixo do peso";
    } else if (double.parse(imc) < 24.9) {
      return "Peso normal";
    } else if (double.parse(imc) < 29.9) {
      return "Sobrepeso";
    } else if (double.parse(imc) < 34.9) {
      return "Obesidade Grau 1";
    } else if (double.parse(imc) < 39.9) {
      return "Obesidade Grau 2";
    } else {
      return "Obesidade Grau 3";
    }
  }

  PessoaModel obterDadosUsuario() {
    print("Digite seu nome:");
    String nome = stdin.readLineSync() ?? "";

    print("Digite sua altura (em metros):");
    double altura = double.parse(stdin.readLineSync() ?? "0.0");

    print("Digite seu peso (em quilogramas):");
    double peso = double.parse(stdin.readLineSync() ?? "0.0");

    if (altura == 0 || peso == 0) {
      print(
          "Altura ou peso não podem ser iguais a zero. Encerrando a aplicação.");
      exit(0);
    }

    return PessoaModel(nome: nome, altura: altura, peso: peso);
  }

  void mostrarResultado(PessoaModel pessoa) {
    String imc = calcularIMC(pessoa);
    String classificacao = classificarIMC(pessoa);

    print(
        "O IMC de ${pessoa.nome} é $imc e sua classificação é: $classificacao");
  }
}
