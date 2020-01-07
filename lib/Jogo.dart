import 'dart:math';

import 'package:flutter/material.dart';

class Jogo extends StatefulWidget {
  @override
  _JogoState createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  var _imageApp = AssetImage("imagens/padrao.png");
  var _resultado_jogo = " Resultado ";

  void _opcaoSelecionada(String escolhaUsuario) {
    var opcoes = [
      "imagens/tesoura.png",
      "imagens/papel.png",
      "imagens/pedra.png"
    ];
    var numero = Random().nextInt(opcoes.length);
    var opcaoApp = opcoes[numero];

    setState(() {
      this._imageApp = AssetImage(opcaoApp);
      if (escolhaUsuario == opcaoApp) {
        _resultado_jogo = "Empatamos";
      } else {
        switch (opcaoApp) {
          case "imagens/tesoura.png":
            _resultado_jogo = escolhaUsuario == "imagens/papel.png"
                ? " Você perdeu"
                : "Voce ganhou ";
            break;
          case "imagens/papel.png":
            _resultado_jogo = escolhaUsuario == "imagens/pedra.png"
                ? " Você perdeu"
                : "Voce ganhou ";
            break;
          case "imagens/pedra.png":
            _resultado_jogo = escolhaUsuario == "imagens/tesoura.png"
                ? " Você perdeu"
                : "Voce ganhou ";
            break;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: Text("Jokenpo"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              "Escolha do App ",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Image(
            image: this._imageApp,
          ),
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              _resultado_jogo,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                onTap: () => _opcaoSelecionada("imagens/pedra.png"),
                child: Image.asset(
                  "imagens/pedra.png",
                  height: 95,
                ),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada("imagens/tesoura.png"),
                child: Image.asset(
                  "imagens/tesoura.png",
                  height: 95,
                ),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada("imagens/papel.png"),
                child: Image.asset(
                  "imagens/papel.png",
                  height: 95,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
