import 'package:flutter/foundation.dart';
import 'explosao_exception.dart';

class Campo {
  final int linha;
  final int coluna;
  final List<Campo> vizinhos = [];
  bool _aberto = false;
  bool _minado = false;
  bool _marcado = false;
  bool _explodido = false;

  Campo({
    required this.linha,
    required this.coluna,
  });

  void adicionarVizinho(Campo vizinho) {
    final deltaLinha = (vizinho.linha - linha).abs();
    final deltaColuna = (vizinho.coluna - coluna).abs();

    if (deltaLinha == 0 && deltaColuna == 0) {
      return;
    }

    if (deltaLinha <= 1 && deltaColuna <= 1) {
      vizinhos.add(vizinho);
    }
  }

  void abrir() {
    if (_aberto) {
      return;
    }
    _aberto = true;
    if (_minado) {
      _explodido = true;
      throw ExplosaoException();
    }

    if (vizinhancaSegura) {
      vizinhos.forEach((vizinhos) => vizinhos.abrir());
    }
  }

  void revelarBombas() {
    if (_minado) {
      _aberto = true;
    }
  }

  void minar() {
    _minado = true;
  }

  void alternarMarcacao() {
    _marcado = !_marcado;
  }

  void reiniciar() {
    _aberto = false;
    _minado = false;
    _marcado = false;
    _explodido = false;
  }

  bool get resolvido {
    bool minadoEMarcado = minado && marcado;
    bool seguroEDescoberto = _aberto && !minado;
    return minadoEMarcado || seguroEDescoberto;
  }

  int get qtdeMinasNaVizinhanca {
    return vizinhos.where((vizinho) => vizinho.minado).length;
  }

  bool get minadoEMarcado {
    bool minadoEMarcado = minado && marcado;
    bool seguroEDescoberto = _aberto && !minado;
    return minadoEMarcado || seguroEDescoberto;
  }

  bool get vizinhancaSegura => vizinhos.every((vizinho) => !vizinho.minado);
  bool get minado => _minado;
  bool get aberto => _aberto;
  bool get marcado => _marcado;
  bool get explodido => _explodido;
}
