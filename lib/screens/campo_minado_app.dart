import 'package:campo_minado/components/campo_widget.dart';
import 'package:campo_minado/components/tabuleiro_widget.dart';
import 'package:campo_minado/models/campo.dart';
import 'package:campo_minado/models/explosao_exception.dart';
import 'package:campo_minado/models/tabuleiro.dart';
import 'package:flutter/material.dart';
import 'package:campo_minado/components/resultado_widget.dart';

class CampoMinadoApp extends StatelessWidget {
  const CampoMinadoApp({super.key});

  void _reiniciar() {
    print('reiniciar...');
  }

  void _abrir(Campo campo) {
    print('abrir ');
  }

  void _alternarMarcacao(Campo campo) {
    print('alternar marcacao ');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: ResultadoWidget(
          venceu: false,
          onReiniciar: _reiniciar,
        ),
        body: TabuleiroWidget(
          tabuleiro: Tabuleiro(
            linhas: 3,
            colunas: 3,
            qtdeBombas: 30,
          ),
          onAbrir: _abrir,
          onAlternarMarcacao: _alternarMarcacao,
        ),
      ),
    );
  }
}
